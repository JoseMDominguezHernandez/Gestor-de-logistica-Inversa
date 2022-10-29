const open = document.getElementById('open');
const modal_container = document.getElementById('modal_container');
const close = document.getElementById('close');
const exit = document.getElementById('cancel');


//VENTANA MODAL. Insertamospara indicar nº cliente
open.addEventListener('click', () => {
    modal_container.classList.add('show');
    document.getElementById("cliente").focus();
    document.getElementById("open").style.visibility = "hidden";
    importarCodigosCliente();   //Listado de códigos de cliente
});


//CANCELACION DEL FORMULARIO. Sale al principio (No deja volver a acceder al formulario)
var cancel = () => {
    window.location.replace("../forms/pickups.html");
}


/*VALIDAR CC y ABRIR FORMULARIO.  Captura nº cliente, cierra y esconde la ventana y 
hace visible el formulario pone el focus en campo pedido asociado*/
close.addEventListener('click', () => {

    //VALIDACIÓN CÓDIGO DE CLIENTE
    var cliente_ = document.getElementById('cliente').value;
    var arrayClientes = importarCodigosCliente().split(",");
    var flag = false;
    if (comprobarNumero(cliente_, 7) == true) {                 // Es número?
        for (var i = 0; i < arrayClientes.length; i++) {        // Existe?
            if (arrayClientes[i] == cliente_) {
                flag = true;
            }
        }
        if (flag == false) {
            document.getElementById('cliente').value = "";
            alert('Introduzca un código de cliente válido');
            document.getElementById('cliente').focus;
            return

        } else {
            document.getElementById('codigo-cliente').value = cliente_;
            modal_container.classList.remove('show');

            //Importamos los "option" de los 'select'
            importarAgencias();
            importarDepartamentos();
            importarOrdenes();
            obtenerUsuario();

            //Mostramos el formulario oculto y ponemos focua en el primer campo a rellenar
            document.getElementById('cont1').style.visibility = "visible";
            document.getElementById('cont2').style.visibility = "visible";
            document.getElementById('salirformulario').style.visibility = "visible";
            document.getElementById('pedido-asociado').focus();

            datosCliente(cliente_);     //Rellena los datos del cliente
        }
    } else {
        alert('Código de cliente inexistente.\nIntroduzca un código de cliente válido');
        document.getElementById('cliente').value = "";
        document.getElementById('cliente').focus;
    }
});

//CONFIGURACION digitos fecha y hora. Añade ceros a los parámetros de la fecha u hora cuando son menores de 10
var updatefechahora = (datetime) => {
    if (datetime < 10) {
        return "0" + datetime;
    } else {
        return datetime;
    }
}

//VALIDACIÓN números
var comprobarNumero = (numero, long) => {
    let num = "";
    let cont = 0;
    for (let i = 0; i < numero.length; i++) {
        if (numero.charCodeAt(i) <= 57 && numero.charCodeAt(i) >= 48) //ASCII numeros
            num = num + numero.charAt(i);
        cont = cont + 1;
    }
    if (num === numero && cont === long) return true;
    else return false;
}

/*VALIDACIÓN Fecha de recogida. Compara la fecha actual con la de la solicitud 
y si es para hoy o anterior nos muestra un error, sólo las habilitamos para el día siguiente.*/
var comprobarFecha = (fechaSolicitud) => {
    var date = new Date();
    var day = updatefechahora(date.getDate());
    var mounth = updatefechahora(date.getMonth() + 1);
    var year = date.getFullYear();
    var fechaActual = year + "-" + mounth + "-" + day;
    var diferenciaFechas = parseInt(new Date(fechaActual).getTime()) - parseInt(new Date(fechaSolicitud).getTime());
    var numDay = new Date(fechaSolicitud).getDay();

    if (diferenciaFechas >= 0 || numDay == 0 || numDay == 6) {
        alert('Elija una fecha valida');
        return false;
    } else {
        return true;
    }
}

/// ENVÍO SOLICITUD >> VALIDACIÓN de datos no validados con anterioridad y envio a la base de datos
var enviarsolicitud = () => {
    //Validación campos
    var Agency_ID = document.getElementById("agencia-transporte").value;
    var idagenciainicial = document.getElementById('id-codigo-agencia').value;

    //VALIDACION AGENCIA DE TRANSPORTE
    var cuentas = importarCuentasDevoluciones(Agency_ID);
    var index = cuentas.indexOf(".");
    var agencias = (cuentas.substring(0, index)).split(",");
    var codes = (cuentas.substring(index + 1)).split(",");
    if (Agency_ID != idagenciainicial) {
        for (var i = 0; i < agencias.length; i++) {
            if (agencias[i] == Agency_ID) {
                document.getElementById('codigo-agencia').value = codes[i]
            }
        }
    }
    var Customer_ID = document.getElementById("codigo-cliente").value;  //Ya validado
    var ID_User = document.getElementById("iduser").value;

    //VALIDACION NÚMERO DE ORDEN
    var AssociatedOrder_ID = document.getElementById("pedido-asociado").value;
    var arrayOrdenes = importarOrdenes().split(",");
    var flag = false;
    if (comprobarNumero(AssociatedOrder_ID, 7) == false || AssociatedOrder_ID == "") {      //Es número?
        document.getElementById("pedido-asociado").value = "";
        document.getElementById("pedido-asociado").focus;
        return;
    } else {
        for (var i = 0; i < arrayOrdenes.length; i++) {     //Existente??
            if (arrayOrdenes[i] == AssociatedOrder_ID) {
                flag = true;
            }
        }
        if (flag == false) {
            alert('Introduzca un Nº de pedido válido');
            document.getElementById("pedido-asociado").value = "";
            document.getElementById("pedido-asociado").focus;
            return;
        }
    }

    //VALIDACION FECHA (No puede ser anterior a hoy, )
    var DateRequest = document.getElementById("fecha-recogida").value;
    if (comprobarFecha(DateRequest) == false) {
        document.getElementById("fecha-recogida").value = "";
        document.getElementById("fecha-recogida").focus;
        return;
    }
    else {
        var DateRequest = DateRequest;
    };

    var PreferentialTimetable = document.getElementById('horario-recogida').value;
    var Urgently = document.getElementById('urgente').value;
    var MerchandiseRemarks = document.getElementById("observaciones-mercancia").value;

    var Department_ID = document.getElementById("departamento-destino").value;
    if (document.getElementById("departamento-destino").value == "") {
        document.getElementById("departamento-destino").focus;
        return;
    }
    var PickUpRemarks = document.getElementById("observaciones-recogidas").value;
    var Code = document.getElementById('codigo-agencia').value;
    var PickUp_ID = generarNumeroRecogida(Code);

    if (AssociatedOrder_ID == "") alert('Introduzca un Nº de pedido válido');
    else if (Department_ID == "") alert("Debe seleccionar un departamento de destino");
    else if (DateRequest == "") alert('Introduzca una fecha valida');
    else if (Agency_ID == "") alert("Debe seleccionar una agencia");
    else if (PreferentialTimetable == "") alert('Seleccione un horario preferente');
    else if (Urgently == "") alert('Debe seleccionar si la solicitud es urgente');

    //VALIDACIÓN de parámetros
    if (Customer_ID == "" || AssociatedOrder_ID == "" || DateRequest == "" || PreferentialTimetable == ""
        || Urgently == "" || Department_ID == "" || Agency_ID == "" || PickUp_ID == "") {
        return;
    }

    //GUARDAR SOLICITUD EN BDD. Envío de datos al servidor con ajax
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",  //dirección del servidor
        data: {
            PickUp_ID: PickUp_ID,
            Customer_ID: Customer_ID,
            ID_User: ID_User,
            AssociatedOrder_ID: AssociatedOrder_ID,
            DateRequest: DateRequest,
            PreferentialTimetable: PreferentialTimetable,
            Urgently: Urgently,
            MerchandiseRemarks: MerchandiseRemarks,
            Department_ID: Department_ID,
            Agency_ID: Agency_ID,
            PickUpRemarks: PickUpRemarks
        },
        success: function (response) {
            console.log(">>> Solicitud registrada correctamente");
        },
        error: function () {
            alert("Error");
        }
    });
    //Invocación a constructorFichero y esconde el formulario de nuevo
    guardarArchivoTexto(constructorFichero(PickUp_ID), PickUp_ID);
    alert("Solicitud y fichero generados\n\n" + PickUp_ID);
    document.getElementById('cont1').style.visibility = "hidden";
    document.getElementById('cont2').style.visibility = "hidden";
    document.getElementById('salirformulario').style.visibility = "hidden";
    document.getElementById("open").style.visibility = "visible";
}

//CONSTRUCTOR NUMERO DE RECOGIDA >> (Varchar 25)
var generarNumeroRecogida = (code) => {
    var date = new Date();
    var CompanyClientCode = code;
    var day = updatefechahora(date.getDate()).toString();
    var mounth = updatefechahora((date.getMonth() + 1)).toString();
    var year = date.getFullYear().toString(); //).substring(2);    //año con dos cifras
    var hour = updatefechahora(date.getHours()).toString();
    var minute = updatefechahora(date.getMinutes()).toString();
    var customer = document.getElementById("codigo-cliente").value.toString();
    var preferentialTime = document.getElementById('horario-recogida').value.toString();
    var urgent = document.getElementById('urgente').value.toString();
    var PickUp_ID = CompanyClientCode + year + mounth + day + hour + minute + customer + preferentialTime + urgent;

    if (PickUp_ID.length == 25) {   //adaptacion a 16
        return PickUp_ID;
    } else {
        PickUp_ID = "";
        return PickUp_ID;
    }
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

//CONSTRUCTOR FICHERO TRANSPORTISTA (txt, separado por ; para poder importar como CSV)
var constructorFichero = (PickUp_ID) => {

    var nombre = document.getElementById('nombre-cliente').value;
    var dir1 = document.getElementById("direccion-cliente").value;

    //Comprueba si el campo está vacio y lo omite en el fichero
    if (document.getElementById("direccion-cliente2")) {
        var dir2 = document.getElementById("direccion-cliente2").value;
    } else {
        var dir2 = "";
    }

    var zip = document.getElementById("zip-cliente").value;
    var email = document.getElementById("email-cliente").value;
    var tel1 = document.getElementById("tlf1-cliente").value;

    //Comprueba si el campo está vacio y lo omite en el fichero
    if (document.getElementById("tlf2-cliente")) {
        var tel2 = document.getElementById("tlf2-cliente").value;
    } else {
        var tel2 = "";
    }

    var fecha = document.getElementById("fecha-recogida").value;
    var observ = document.getElementById("observaciones-recogidas").value;
    var ficheroAgencia = "\"" + PickUp_ID + "\"" + ";" + nombre + ";" + dir1 + ";" + dir2 + ";" + zip + ";" + email + ";" + tel1 + ";" + tel2 + ";" + fecha + ";" + observ;

    return ficheroAgencia;
}

//GENERA Y COMPLETA FICHERO .txt. Lo descarga automáticamente en "downloads";
var guardarArchivoTexto = (contenido, nombre) => {
    const a = document.createElement("a");
    const archivo = new Blob([contenido], { type: 'csv' });
    const url = URL.createObjectURL(archivo);
    a.href = url;
    a.download = nombre;
    a.click();
    URL.revokeObjectURL(url);
}

//COMPLETA LOS CAMPOS DE DATOS DEL CLIENTE >>> en formulario.
var datosCliente = (codigocliente) => {
    var Customer_ID = codigocliente;

    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",
        data: {
            Customer_ID: Customer_ID,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index + 1, response.length - 1);
            var jsparse = JSON.parse(json);

            //Asignamos valores a campos del formulario
            document.getElementById('nombre-cliente').value = jsparse.Name;
            document.getElementById('direccion-cliente').value = jsparse.Direction1;

            //Borra campo si no hay dato en la BDD
            if (!jsparse.Direction2) {
                var direccion2 = document.getElementById("direccion-cliente2");
                direccion2.parentNode.removeChild(direccion2)
            } else {
                document.getElementById('direccion-cliente2').value = jsparse.Direction2;
            }

            document.getElementById('zip-cliente').value = jsparse.ZIPCode;
            document.getElementById('poblacion-cliente').value = jsparse.Town;
            document.getElementById('provincia-cliente').value = jsparse.Province;
            document.getElementById('email-cliente').value = jsparse.Email;
            document.getElementById('tlf1-cliente').value = jsparse.Phone1;

            //Borra campo si no hay dato en la BDD
            if (jsparse.Phone2 == 0) {
                var phone2 = document.getElementById("tlf2-cliente");
                document.getElementById('tlf1-cliente').style.marginTop = "5px";
                phone2.parentNode.removeChild(phone2)
            } else {
                document.getElementById('tlf2-cliente').value = jsparse.Phone2;
            }

            document.getElementById('agencia-transporte').value = jsparse.Agency_ID;
            document.getElementById('horario-recogida').value = 1;
            document.getElementById('urgente').value = 0;

            //Importamos las cuentas de devolución para verificar
            importarCuentasDevoluciones(jsparse.Agency_ID);
        },
        error: function () {
            alert("Error");
        }
    });
}

//IMPORTACIÓN DE AGENCIAS >>> Desplegable
var importarAgencias = () => {
    var Disponibilidad = 1
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",  //dirección del servidor
        data: {
            Disponible: Disponibilidad
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            //Creamos los 'option' del select
            const $select = document.getElementById("agencia-transporte")
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
                    texto = "Elija una agencia";
                } else {
                    valor = jsparse[i].Agency_ID;
                    texto = jsparse[i].Name;
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

//IMPORTACION DEPARTAMENTOS >>> Desplegable
var importarDepartamentos = () => {
    var Activo = 1;
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",  //dirección del servidor
        data: {
            Activo: Activo
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            //Creamos los 'option' del select
            const $select = document.getElementById("departamento-destino")
            //Borramos los anteriores
            for (let i = $select.options.length; i >= 0; i--) {
                $select.remove(i);
            }
            var option;
            var valor;
            var texto;
            for (var i = -1; i < jsparse.length; i++) {
                option = document.createElement('option');
                if (i == -1) {
                    valor = "";
                    texto = "Elija un departamento";
                } else {
                    if (jsparse[i].Department_ID == 1) {
                        option.selected = true;
                    }
                    valor = jsparse[i].Department_ID;
                    texto = jsparse[i].Name;
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

//IMPORTACIÓN DE CÓDIGOS DE CLIENTE >>> Desplegable y Array de verificación
var importarCodigosCliente = () => {
    var ClienteActivo = 1;
    window.clientes = [];
    window.stringclientes;
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",  //dirección del servidor
        data: {
            ClienteActivo: ClienteActivo,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            //Creamos los 'option' del select
            const $datalist = document.getElementById("CustomerList")

            var option;
            var valor;
            for (var i = 0; i < jsparse.length; i++) {
                option = document.createElement('option');
                valor = jsparse[i].Customer_ID;
                clientes.push(jsparse[i].Customer_ID);
                option.value = valor;
                $datalist.appendChild(option);
            }
            stringclientes = clientes.toString();
        },
        error: function () {
            alert("Error");
        }
    });
    return window.stringclientes;
}

//IMPORTACIÓN CUENTAS DE DEVOLUCIONES >>> Array para comprobar
var importarCuentasDevoluciones = (id_agencia) => {
    var Disponibilidad = 1;
    window.ag = [];
    window.code = [];
    window.cadena;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",  //dirección del servidor
        data: {
            Disponible: Disponibilidad
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            for (var i = 0; i < jsparse.length; i++) {
                ag.push(jsparse[i].Agency_ID);
                code.push(jsparse[i].ReturnsAccount);
                if (jsparse[i].Agency_ID == id_agencia) {
                    document.getElementById("codigo-agencia").value = jsparse[i].ReturnsAccount;
                    document.getElementById("id-codigo-agencia").value = jsparse[i].Agency_ID;
                }
            }
            cadena = (ag.toString() + "." + code.toString());
        },
        error: function () {
            alert("Error");
        }
    });
    return window.cadena;
}

//IMPORTACIÓN DE NÚMEROS DE ORDEN >>> Desplegable y Array de verificación
var importarOrdenes = () => {
    var Cantidad = 1;
    window.orders = [];
    window.stringordenes;
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",  //dirección del servidor
        data: {
            Qty: Cantidad,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            //Creamos los 'option' del select
            const $datalist = document.getElementById("OrdersList")

            var option;
            var valor;
            for (var i = 0; i < jsparse.length; i++) {
                option = document.createElement('option');
                valor = jsparse[i].Order_ID;
                orders.push(jsparse[i].Order_ID);
                option.value = valor;
                $datalist.appendChild(option);
            }
            stringordenes = orders.toString();
        },
        error: function () {
            alert("Error");
        }
    });
    return window.stringordenes;
}