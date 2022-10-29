const open = document.getElementById('open');
const modal_container = document.getElementById('modal_container');
const close = document.getElementById('close');

//VENTANA MODAL. Insertamospara indicar nº cliente
open.addEventListener('click', () => {
    modal_container.classList.add('show');
    document.getElementById("pickup-number").focus();
    document.getElementById("open").style.visibility = "hidden";
    importarPickUpsIds();       //importamos todas las recogidas sin recepcionar
    importarTiposEmbalaje();    //importamos todos los tipos de embalaje disponibles

});

//CANCELACION DEL FORMULARIO. Sale al principio (No deja volver a acceder al formulario)
var cancel = () => {
    desbloquearLocker();
    window.location.replace("../forms/receptions.html");
}

close.addEventListener('click', () => {
    //VALIDACION NUMERO DE RECOGIDA
    var pickupId = document.getElementById('pickup-num').value;
    var arrayRecogidas = importarPickUpsIds().split(",");
    var flag = false;
    var flag2 = false;

    for (var i = 0; i < arrayRecogidas.length; i++) {        // Existe?
        if (arrayRecogidas[i] == pickupId) {
            flag = true;
        }
    }

    if (flag == false) {
        document.getElementById('pickup-number').value = "";
        alert('Introduzca un número de recogida válido');
        document.getElementById('pickup-number').focus;
        return;
    }

    var type = document.getElementById('package-type').value;
    if (type == "") {
        alert("Debe indicar el tipo de embalaje");
        document.getElementById("package-type").focus;
        return;
    } else {
        flag2 = true;
    }

    if (flag == true && flag2 == true) {

        /* Se hace visible el menú */
        modal_container.classList.remove('show');
        document.getElementById('cont1').style.visibility = "visible";
        document.getElementById('botonera').style.visibility = "visible";
        document.getElementById('obser').focus();

        document.getElementById("num-recogida").value = pickupId;
        document.getElementById("tipo-embalaje").value = type;

        obtenterDepartamento(pickupId);
        obtenerLocker(type);
        importarListaDepartamentos();
        obtenerUsuario();

    } else {
        return;
    }
});

//GENERA NUMERO DE RECEPCION 
var generarNumeroRecepcion = (codigcliente) => {

    var customer = codigcliente;
    var date = new Date();
    var day = updatefechahora(date.getDate()).toString();
    var mounth = updatefechahora((date.getMonth() + 1)).toString();
    var year = date.getFullYear().toString(); //).substring(2);    //año con dos cifras
    var hour = updatefechahora(date.getHours()).toString();
    var minute = updatefechahora(date.getMinutes()).toString();
    var digitocontrol = Math.floor(Math.random() * (9 - 0 + 1) + 0);

    var Reception_ID = year + mounth + day + hour + minute + customer + digitocontrol;

    if (Reception_ID.length == 20) {
        return Reception_ID;
    } else {
        Reception_ID = "";
        return Reception_ID;
    }
}

//GUARDA LA RECEPCION EN LAS TABLAS Y HACE TODAS LAS MODIFICACIONES EN LA DEMÁS TABLAS IMPLICADAS
var confirmarRecepcion = () => {
    var PickUp_ID = document.getElementById("num-recogida").value;
    var Customer_ID = document.getElementById("cod_cliente").value;
    var Reception_ID = generarNumeroRecepcion(Customer_ID);
    var User_ID = document.getElementById("iduser").value;
    /* var User_ID = document.getElementById("iduser").value; */
    var PackageType = document.getElementById("tipo-embalaje").value;

    //VALIDACION DEPARTAMENTO:
    var departamentos = importarListaDepartamentos();
    var index = departamentos.indexOf(".");
    var dep = (departamentos.substring(0, index)).split(",");
    var id = (departamentos.substring(index + 1)).split(",");
    var NextTrackingStatus = document.getElementById("proximo-dep").value;
    var proxdepactual = document.getElementById("proximo-departamento").value;
    //Confirmamos que existe
    var flag = false;
    for (var i = 0; i < dep.length; i++) {
        if (proxdepactual == dep[i]) {
            flag == true;
        }
    }
    //Comprueba que si se ha cambiado manuelamente el dpto y modifica la variable
    if (!flag) {
        var index2 = dep.indexOf(proxdepactual);
        var proxdepidactual = id[index2];
        if (NextTrackingStatus != proxdepidactual) {
            NextTrackingStatus = proxdepidactual;
        }

    } else return;
    var Locker_ID = document.getElementById("id-locker").value; 
    //var Locker_ID = document.getElementById("locker-recepciones").value;
    var Comments = document.getElementById("obser").value;

    //GUARDA DATOS EN RECEPTION Y TRACKING
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",  //dirección del servidor
        data: {
            Reception_ID: Reception_ID,
            PickUp_ID: PickUp_ID,
            User_ID: User_ID,
            PackageType: PackageType,
            NextTrackingStatus: NextTrackingStatus,
            Locker_ID: Locker_ID,
            Comments: Comments
        },
        success: function (response) {
            console.log(">>> Recepción registrada correctamente");
        },
        error: function () {
            alert("Error");
        }
    });
    $.ajax({
        type: "POST",
        url: "../PHPServidor3.php",
        data: {
            Reception_ID: Reception_ID,
            Customer_ID: Customer_ID,
            LastStatus: NextTrackingStatus,
            Locker_ID: Locker_ID
        },
        success: function (response) {
            console.log(">>> Tracking iniciado");
        },
        error: function () {
            alert("Error");
        }
    });
    marcarMercaniaRecibida(PickUp_ID);
}

var obtenerUsuario = () => {
    var user = 1;
    $.ajax({
        type: "POST",
        url: "../PHPServidor3.php",
        data: {
            User: user,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);
            document.getElementById("iduser").value = jsparse[0].User_ID;
        },
        error: function () {
            alert("Error");
        }
    });
}





//MARCA EN TABLA PICKUPS LA RECOGIDA COMO RECEPCIONADA
var marcarMercaniaRecibida = (pickupid) => {
    var pickup = pickupid;
    var recibido = 1;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",
        data: {
            PickUp_ID: pickup,
            Received: recibido
        },
        success: function (response) {
            //console.log(">>> Recogida: " + pickupid + " >>> Recepcionada");
        },
        error: function () {
            alert("Error");
        }
    });
}


//IMPORTACIÓN DE DEPARTAMENTOS >>> LISTA Desplegable y Array de verificación
var importarListaDepartamentos = () => {
    var departamentoactivo = 1;
    window.departamentos = [];
    window.ids = [];
    window.stringdepartamentos;
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",  //dirección del servidor
        data: {
            Activo: departamentoactivo,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            //Creamos los 'option' del select
            const $datalist = document.getElementById("DeptList");

            var option;
            var valor;
            for (var i = 0; i < jsparse.length; i++) {
                option = document.createElement('option');
                valor = jsparse[i].Name;
                departamentos.push(jsparse[i].Name);
                ids.push(jsparse[i].Department_ID);
                option.value = valor;
                $datalist.appendChild(option);
            }
            stringdepartamentos = (departamentos.toString() + "." + ids.toString())
        },
        error: function () {
            alert("Error");
        }
    });
    return window.stringdepartamentos;
}


//OBTENER PROXIMO DEPARTAMENTOS. DOS CONSULTAS ANIDADAS
var obtenterDepartamento = (pickupId) => {
    var Recogida = pickupId;
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",
        data: {
            PickUp_ID: Recogida
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            for (var i = 0; i < jsparse.length; i++) {
                document.getElementById("proximo-dep").value = jsparse[i].Department_ID;
                document.getElementById("cod_cliente").value = jsparse[i].Customer_ID;
                var departamento = jsparse[i].Department_ID;
                $.ajax({
                    type: "POST",
                    url: "../PHPServidor.php",
                    data: {
                        Department_ID: departamento
                    },
                    success: function (response) {
                        var index = response.indexOf("[");
                        var json = response.substring(index, response.length);
                        var jsparse = JSON.parse(json);

                        for (var i = 0; i < jsparse.length; i++) {
                            document.getElementById("proximo-departamento").value = jsparse[i].Name;
                        }
                    },
                    error: function () {
                        alert("Error");
                    }
                });
            }
        },
        error: function () {
            alert("Error");
        }
    });
}


//IMPORTACIÓN NUMEROS DE RECOGIDA pendientes de recepcionar >>> Desplegable y Array de verificación
var importarPickUpsIds = () => {
    var RecogidaNoRecibida = 0;
    window.pickups = [];
    window.stringpickups;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",  //dirección del servidor
        data: {
            Received: RecogidaNoRecibida,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            const $datalist = document.getElementById("pickup-number")
            var option;
            var valor;
            for (var i = 0; i < jsparse.length; i++) {
                option = document.createElement('option');
                valor = jsparse[i].PickUp_ID;
                pickups.push(valor);
                option.value = valor;
                $datalist.appendChild(option);
            }
            stringpickups = pickups.toString();
        },
        error: function () {
            alert("Error");
        }
    });
    return window.stringpickups;
}

//IMPORTAR TIPOS DE EMBALAJE >>> Select
var importarTiposEmbalaje = () => {
    var Activo = 1;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",
        data: {
            ActivePackage: Activo
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            //Creamos los 'option' del select
            const $select = document.getElementById("package-type")
            //Borramos los anteriores
            for (var i = 0; i > $select.options.length; i++) {
                $select.remove(i);
            }
            var option;
            var valor;
            var texto;
            for (var i = -1; i < jsparse.length; i++) {
                option = document.createElement('option');
                if (i == -1) {
                    valor = "";
                    texto = "Elija una tipo de embalaje";
                } else {
                    valor = jsparse[i].PackageType_ID;
                    texto = jsparse[i].Description;
                }
                option.value = valor;
                option.text = texto;
                $select.appendChild(option);
            }
        },
        error: function () {
            alert("Error");
        }
    });
}


//IMPORTAR LOCKER LIBRE LO BLOQUEA PARA QUE NO SE DUPLIQUE
var obtenerLocker = (tipo) => {
   
    var Tipo = tipo;
    var status = 0;
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",
        data: {
            PackageType: Tipo,
            Status: status
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            document.getElementById("id-locker").value = jsparse[0].Locker_ID;
            document.getElementById("locker-recepciones").value = jsparse[0].Name;
            bloquearLocker(jsparse[0].Locker_ID, jsparse[0].Name);
        },
        error: function () {
            alert("Error");
        }
    });
}

//BLOQUEO DEL LOCKER SELECCIONADO
var bloquearLocker = (lockerid, name) => {
    /* var locker = document.getElementById("id-locker").value; */
    var locker = lockerid;
    var status = 1;
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",
        data: {
            Locker_ID: locker,
            Status: status
        },
        success: function (response) {
            console.log(">>> Casillero " + name + " bloqueado");
        },
        error: function () {
            alert("Error");
        }
    });
}

var desbloquearLocker = () => {
    var locker = document.getElementById("id-locker").value;
    var name = document.getElementById("locker-recepciones").value;
    var status = 0;
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",
        data: {
            Locker_ID: locker,
            Status: status
        },
        success: function (response) {
            console.log(">>> Recepción cancelada. Casillero " + name + " liberado");
        },
        error: function () {
            alert("Error");
        }
    });
}




