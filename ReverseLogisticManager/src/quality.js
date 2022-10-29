const open = document.getElementById('open');
const modal_container = document.getElementById('modal_container');
const close = document.getElementById('close');

//VENTANA MODAL. Insertamospara indicar nº cliente
open.addEventListener('click', () => {
    modal_container.classList.add('show');
    document.getElementById("controles-pendientes").focus();
    document.getElementById("open").style.visibility = "hidden";
    importarListaControlesPendientes();
});

//CANCELACION DEL FORMULARIO. Sale al principio (No deja volver a acceder al formulario)
var cancel = () => {
    console.log(">>> Operación cancelada")
    desbloquearLocker();
    borrarEntradaDepartamento(document.getElementById("quality-id").value);
    window.location.replace("../forms/quality.html");
}

var cancelmodal = () => {
    window.location.replace("../forms/quality.html");
}

close.addEventListener('click', () => {
    var reception_id = document.getElementById("controles-pendientes").value;
    document.getElementById("numerorecepcio-quality").value = "Recepción:    " + reception_id;

    var qualityid = generarQualityId(200);
    document.getElementById("quality-id").value = qualityid;

    var codigocliente = reception_id.substring(12, 19);
    document.getElementById("codigoclientereturns").value = codigocliente;

    var stringreceptionsinfo = importarListaControlesPendientes();
    var index = stringreceptionsinfo.indexOf(".");
    var arrayreceptionsid = stringreceptionsinfo.substring(0, index).split(",");
    var arraylockers = stringreceptionsinfo.substring(index + 1).split(",");

    var index2 = arrayreceptionsid.indexOf(reception_id);
    var locker = arraylockers[index2];
    document.getElementById("locker-id").value = locker;

    lockerName(locker);
    obtenerDatosCliente(codigocliente);
    obtenerOrdenAsociada(reception_id);
    obtenerDetalleControl(reception_id);
    obtenerMotivosDevolucion();
    importarListaDepartamentos();
    selectorProcede()
    obtenerUsuario();

    modal_container.classList.remove('show');
    document.getElementById('cont1').style.visibility = "visible";
    document.getElementById('cont2').style.visibility = "visible";
    document.getElementById('botonera-quality').style.visibility = "visible";
    document.getElementById('analisis-tecnico-quality').focus();

    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",
        data: {
            Quality_ID: qualityid,
            ReceptionQ: reception_id,
        },
        success: function (response) {
            console.log(">>> Devolución " + qualityid + " registrada de entrada correctamente");
        },
        error: function () {
            alert("Error");
        }
    });
});


var confirmarControl = () => {
    var user = document.getElementById("iduser3").value;
    var item = document.getElementById("item-id-quality").value
    var qty = document.getElementById("cant-q").value;
    var locker = document.getElementById("locker-id").value;
    var recepcion = document.getElementById("controles-pendientes").value;;
    var procede = document.getElementById("procedequality").value;
    var qualityid = document.getElementById("quality-id").value;
    var motivo = document.getElementById("comentarios-tecnico-quality2").value;
    var analisis = document.getElementById("analisis-tecnico-quality").value;
    var nexttrack = document.getElementById("dest-quality").value;
    /* console.log(user);
    console.log(item);
    console.log(qty);
    console.log(locker);
    console.log(qualityid);
    console.log(recepcion);
    console.log(procede);
    console.log(motivo);
    console.log(analisis);
    console.log(nexttrack); */
    $.ajax({
        type: "POST",
        url: "../PHPServidor4.php",
        data: {
            User_ID: user,
            Item_ID: item,
            Qty: qty,
            /* Ana: analisis, */
            Proceded: procede,
            Reason: motivo,
            NextTrackingStatus: nexttrack,
            Locker_ID: locker,
            Quality_ID: qualityid,
        },
        success: function (response) {
            if (response.length > 0) {
                console.log(">>> Devolución " + qualityid + " registrada de salida correctamente");
            }
        },
        error: function () {
            alert("Error");
        }
    });
    $.ajax({
        type: "POST",
        url: "../PHPServidor5.php",
        data: {
            Reception_ID: recepcion,
            LastStatus: nexttrack,
            Locker_ID: locker,
            Quality_ID: qualityid,
        },
        success: function (response) {
            console.log(">>> Tracking actualizado");
        },
        error: function () {
            alert("Error");
        }
    });
}

//CONFIRMACION SI/NO
var selectorProcede = () => {
    var opciones = ["--", "No", "Sí"];
    const $select = document.getElementById("procedequality");
    for (var i = 0; i > $select.options.length; i--) {
        $select.remove(i);
    }
    var option;
    for (var i = 0; i < opciones.length; i++) {
        option = document.createElement('option');
        if (i == 0) {
            option.selected = true;
        }
        option.value = i;
        option.text = opciones[i];
        $select.appendChild(option);
    }
}

//IMPORTACIÓN DE DEPARTAMENTOS >>> LISTA Desplegable y Array de verificación
var importarListaDepartamentos = () => {
    var departamentoactivo = 1;
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

            const $select = document.getElementById("dest-quality");
            for (var i = 0; i > $select.options.length; i++) {
                $select.remove(i);
            }
            var option;
            var valor;
            var texto;
            for (var i = -1; i < jsparse.length; i++) {
                option = document.createElement('option');
                if (i == -1) {
                    valor = 0;
                    texto = "Seleccione un departamento";
                } else {
                    valor = jsparse[i].Department_ID;
                    texto = jsparse[i].Name;
                }
                option.value = valor;
                option.text = texto;
                if (valor <= 5 && valor != 2) {
                    $select.appendChild(option);
                }
            }
        },
        error: function () {
            alert("Error");
        }
    });
}

//OBTENEMOR EL USUARIO QUE SE HA LOGEADO 
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
            document.getElementById("iduser3").value = jsparse[0].User_ID;
        },
        error: function () {
            alert("Error");
        }
    });
}

//OBTENER MOTIVOS DE DEVOLLUCION >>> Select >>> Resolucion
var obtenerMotivosDevolucion = () => {
    var reasonid = 1;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",
        data: {
            ReturnReason_ID: reasonid,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            const $select = document.getElementById("comentarios-tecnico-quality");
            for (var i = 0; i > $select.options.length; i++) {
                $select.remove(i);
            }
            var option;
            var valor;
            var texto;
            for (var i = -1; i < jsparse.length; i++) {
                if (i == -1) {
                    valor = "";
                    texto = "Seleccione un motivo";
                } else {
                    valor = jsparse[i].ReturnReason_ID;
                    texto = jsparse[i].Description;
                }
                option = document.createElement('option');
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


//OBTENER NOMBRE Y TELEFONO DEL CLIENTE
var obtenerDatosCliente = (codigo) => {
    var cliente = codigo;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",
        data: {
            Cliente: cliente,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);
            document.getElementById("nombrecliente-quality").value = jsparse[0].Name;
            document.getElementById("telefono1-quality").value = jsparse[0].Phone1;
        },
        error: function () {
            alert("Error");
        }
    });
}

//IMPORTAR PEDIDO ASOCIADO
var obtenerOrdenAsociada = (recepcion) => {
    var reception = recepcion;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",
        data: {
            Recepcion: reception,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);
            document.getElementById("comentarios-cliente-quality").value = jsparse[0].MerchandiseRemarks;
            document.getElementById("pedidoasociado-quality").value = jsparse[0].AssociatedOrder_ID;
        },
        error: function () {
            alert("Error");
        }
    });
}

//IMPORTAR DETALLE DE PEDIDO
var obtenerDetalleControl = (recepcion) => {
    var reception = recepcion;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",
        data: {
            detalleAbono: reception,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            document.getElementById("cantidadquality").value = jsparse[0].Qty + " uds.";
            document.getElementById("cant-q").value = jsparse[0].Qty;
            obtenerDescripcionDevolucion(jsparse[0].Remarks);
            document.getElementById("item-id-quality").value = jsparse[0].Item;
            obtenerDescripcionItem(jsparse[0].Item);
            console.log(">>> Importados todos los elementos...");
        },
        error: function () {
            alert("Error");
        }
    });
}

//OBTENER DESCRIPCION DEL MOTIVO DEVOLUCION POR ID
var obtenerDescripcionDevolucion = (code) => {
    var codedev = code;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",
        data: {
            CodeDev: codedev,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);
            document.getElementById("comentarios-tecnico-quality2").value = jsparse[0].Description;
        },
        error: function () {
            alert("Error");
        }
    });
}

//OBTENER DESCRIPCION DEL ITEMS
var obtenerDescripcionItem = (item) => {
    var itemref = item;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",
        data: {
            Item: itemref,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);
            document.getElementById("detalle-pedido-quality").value = jsparse[0].Reference;
            document.getElementById("descripctionItem-quality").value = jsparse[0].Description;
        },
        error: function () {
            alert("Error");
        }
    });
}

//CREAR NUMERO DE DEVOLUCION
var generarQualityId = (code) => {
    var depcode = code;
    var date = new Date();
    var day = updatefechahora(date.getDate()).toString();
    var mounth = updatefechahora((date.getMonth() + 1)).toString();
    var year = date.getFullYear().toString();
    var hour = updatefechahora(date.getHours()).toString();
    var minute = updatefechahora(date.getMinutes()).toString();
    var digitocontrol = Math.floor(Math.random() * (9 - 0 + 1) + 0);

    var Quality_ID = depcode + year + mounth + day + hour + minute + digitocontrol;

    if (Quality_ID.length == 16) {
        return Quality_ID;
    } else {
        Quality_ID = "";
        return Quality_ID;
    }
}

//IMPORTAR LISTADO DE CONTROLES PENDIENTES DE ENTRAR EN EL DEPARTAMENTO
importarListaControlesPendientes = () => {
    var proximodep = 2;
    window.pickups = [];
    window.lockers = [];
    window.stringcontrolespendientes;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",
        data: {
            LastStatus: proximodep,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            const $select = document.getElementById("controles-pendientes");
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
                    texto = "Seleccione un control";
                } else {
                    valor = jsparse[i].Reception_ID;
                    texto = jsparse[i].Reception_ID;
                    lockers.push(jsparse[i].Locker_ID);
                    pickups.push(valor);
                }
                option.value = valor;
                option.text = texto;
                $select.appendChild(option);
            }
            stringcontrolespendientes = pickups.toString() + "." + lockers.toString();
        },
        error: function () {
            alert("Error");
        }
    });
    return window.stringcontrolespendientes;
}

//BORRARR REGISTRO DE ENTRADA EN DEPARTAMENTO
var borrarEntradaDepartamento = (qualityid) => {
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",
        data: {
            ControlQ: qualityid,
        },
        success: function (response) {
            console.log(">>> Devolución " + qualityid + " eliminada del registro correctamente");
        },
        error: function () {
            alert("Error");
        }
    });
}

/* ----------------------LOCKERS-------------------------------- */

//OBTENER NOMBRE DEL LOCKER
var lockerName = (id) => {
    var lockerid = id;
    window.casillero;
    $.ajax({
        type: "POST",
        url: "../PHPServidor3.php",
        data: {
            ID_Locker: lockerid,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);
            casillero = jsparse[0].Name;
            document.getElementById("locker-in-quality").value = jsparse[0].Name;

            var letter = casillero.substring(0, 1);
            var type = obtenerTipoEmbalaje(letter);
            document.getElementById("pack-type").value = type;
            obtenerLocker(type);
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
            document.getElementById("nextlocker-q").value = jsparse[0].Locker_ID;
            document.getElementById("nextlocker-quality").value = jsparse[0].Name;
            bloquearLocker(jsparse[0].Locker_ID, jsparse[0].Name);
        },
        error: function () {
            alert("Error");
        }
    });
}

//BLOQUEO DEL LOCKER SELECCIONADO
var bloquearLocker = (lockerid, name) => {
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

//LIBERAR LOCKER
var desbloquearLocker = () => {
    var locker = document.getElementById("nextlocker-q").value;
    var name = document.getElementById("nextlocker-quality").value;
    var status = 0;
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",
        data: {
            Locker_ID: locker,
            Status: status
        },
        success: function (response) {
            console.log(">>> Casillero " + name + " liberado");
        },
        error: function () {
            alert("Error");
        }
    });
}


//OBTENER EL TIPO DE EMBALAJE
var obtenerTipoEmbalaje = (lockertype) => {
    var packagetype;
    if (lockertype == "A" || lockertype == "B" || lockertype == "C" || lockertype == "D") {
        packagetype = 1
    } else if (lockertype == "E" || lockertype == "F" || lockertype == "G" || lockertype == "H") {
        packagetype = 2;
    } else if (lockertype == "I" || lockertype == "J") {
        packagetype = 3;
    } else if (locker.substring(0, 1) == "K") {
        packagetype = 4;
    } else {
        return
    }
    return packagetype;
}

