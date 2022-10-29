const open = document.getElementById('open');
const modal_container = document.getElementById('modal_container');
const close = document.getElementById('close');

//VENTANA MODAL. Insertamospara indicar nº cliente
open.addEventListener('click', () => {
    modal_container.classList.add('show');
    document.getElementById("devoluciones-pendientes").focus();
    document.getElementById("open").style.visibility = "hidden";
    importarListaRecepcionesPendientes();
});

//CANCELACION DEL FORMULARIO. Sale al principio (No deja volver a acceder al formulario)
var cancel = () => {
    console.log(">>> Operación cancelada")
    desbloquearLocker();
    borrarEntradaDepartamento(document.getElementById("returnid").value);
    window.location.replace("../forms/returns.html");
}

var cancelmodal = () => {
    window.location.replace("../forms/returns.html");
}

//EJECUCION CUANDO PULSAMOS ACEPTAR
close.addEventListener('click', () => {
    var reception_id = document.getElementById("devoluciones-pendientes").value;
    document.getElementById("numerorecepcio-returns").value = reception_id;
    ;
    var returnid = generarReturId(100);
    document.getElementById("returnid").value = returnid;


    var arrayreceptionsinfo = importarListaRecepcionesPendientes();
    var index1 = arrayreceptionsinfo.indexOf(".");
    var arrayreceptionsid = arrayreceptionsinfo.substring(0, index1).split(",");
    var arraylockers = arrayreceptionsinfo.substring(index1 + 1).split(",");

    //SACAMOS NUMERO DE CLIENTE
    var codigocliente = reception_id.substring(12, 19);
    document.getElementById("codigoclientereturns").value = codigocliente;

    //SACAMOS CASILLERO, COMENTARIOS Y OBTENEMOS TIPO DE EMBALAJE
    var index3 = arrayreceptionsid.indexOf(reception_id);
    var locker = arraylockers[index3];
    lockerName(locker);

    document.getElementById("locker-in-returns").value = locker;
    modal_container.classList.remove('show');
    document.getElementById('cont1').style.visibility = "visible";
    document.getElementById('cont2').style.visibility = "visible";
    document.getElementById('botonera-returns').style.visibility = "visible";
    document.getElementById('cantidadabono-returns').focus();

    obtenerOrdenAsociada(reception_id);
    obtenerDatosCliente(codigocliente);
    obtenerMotivosDevolucion();
    devolucionesEsperaReturns();
    obtenerUsuario();
   

    //Graba la entrada en tabla returns, luego añadimos datos.
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",
        data: {
            Return: returnid,
            Reception: reception_id,
        },
        success: function (response) {
            console.log(">>> Devolución " + returnid + " registrada de entrada correctamente");
        },
        error: function () {
            alert("Error");
        }
    });
});

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
            document.getElementById("locker-in-returns").value = jsparse[0].Name;

            var letter = casillero.substring(0, 1);
            var type = obtenerTipoEmbalaje(letter);
            document.getElementById("pack-type").value = type;
            obtenerLocker(type);
        },
        error: function () {
            alert("Error");
        }
    });
    return window.casillero;
}

//CONFIRMAR Y GRABAR EN TABLA
var confirmarGestion = () => {
    var item = document.getElementById("item-id-returns").value;
    var qty = document.getElementById("cantidadabono-returns").value;
    var remarks = document.getElementById("cantidadabono-returns").value;
    const nexttrack = 2;
    var locker = document.getElementById("nextlocker-id-returns").value;
    var returnid = document.getElementById("returnid").value;
    // var reception = document.getElementById("devoluciones-pendientes").value;
    var user = document.getElementById("iduser2").value;
    //actualiza la tabla returns
    $.ajax({
        type: "POST",
        url: "../PHPServidor3.php",
        data: {
            Item: item,
            Qty: qty,
            Remarks: remarks,
            NextTrack: nexttrack,
            Locker_ID: locker,
            Return_ID: returnid,
            User: user,
        },
        success: function (response) {
            console.log(">>> Devolución " + returnid + " registrada de salida correctamente");
            actualizaTracking();
        },
        error: function () {
            alert("Error");
        }
    });
    
}

var actualizaTracking = () => {
    var nexttrack = 2;
    var locker = document.getElementById("nextlocker-id-returns").value;
    var returnid = document.getElementById("returnid").value;
    var reception = document.getElementById("devoluciones-pendientes").value;

    $.ajax({
        type: "POST",
        url: "../PHPServidor4.php",
        data: {
           
            Reception_ID: reception,
            LastStatus: nexttrack,
            Locker_ID: locker,
            Return_ID: returnid
        },
        success: function (response) {
            console.log(">>> Tracking actualizado");
        },
        error: function () {
            alert("Error");
        }
    });
    
}

//BORRARR REGISTRO DE ENTRADA EN DEPARTAMENTO
var borrarEntradaDepartamento = (returnid) => {
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",
        data: {
            Devolucion: returnid,
        },
        success: function (response) {
            console.log(">>> Devolución " + returnid + " eliminada del registro correctamente");
        },
        error: function () {
            alert("Error");
        }
    });
}


//CREAR NUMERO DE DEVOLUCION
var generarReturId = (code) => {
    var depcode = code;
    var date = new Date();
    var day = updatefechahora(date.getDate()).toString();
    var mounth = updatefechahora((date.getMonth() + 1)).toString();
    var year = date.getFullYear().toString();
    var hour = updatefechahora(date.getHours()).toString();
    var minute = updatefechahora(date.getMinutes()).toString();
    var digitocontrol = Math.floor(Math.random() * (9 - 0 + 1) + 0);

    var Return_ID = depcode + year + mounth + day + hour + minute + digitocontrol;

    if (Return_ID.length == 16) {
        return Return_ID;
    } else {
        Return_ID = "";
        return Return_ID;
    }
}

//CANTIDAD DE ITEMS PARA ABONAR
var cantidadItemsAbonar = (unidades) => {
    const $select = document.getElementById("cantidadabono-returns");
    var cantidad = unidades;
    var option;
    var valor;
    var texto;
    for (var i = 0; i > $select.options.length; i++) {
        $select.remove(i);
    }
    for (var i = -1; i < cantidad; i++) {
        option = document.createElement('option');
        if (i == -1) {
            valor = "";
            texto = "Selecione una";
        } else {
            valor = i + 1;
            texto = i + 1;
        }
        option.value = valor;
        option.text = texto;
        $select.appendChild(option);
    }
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
            document.getElementById("nombrecliente-returns").value = jsparse[0].Name;
            document.getElementById("telefono1-returns").value = jsparse[0].Phone1;
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
            document.getElementById("comentarios-cliente-returns").value = jsparse[0].MerchandiseRemarks;
            document.getElementById("pedidoasociado-returns").value = jsparse[0].AssociatedOrder_ID;
            obtenerDetalleOrdenAsociada(jsparse[0].AssociatedOrder_ID);
        },
        error: function () {
            alert("Error");
        }
    });
}

//IMPORTAR DETALLE DE PEDIDO
var obtenerDetalleOrdenAsociada = (order) => {
    var associatedorder = order;
    $.ajax({
        type: "POST",
        url: "../PHPServidor2.php",
        data: {
            Orden: associatedorder,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);
            document.getElementById("cantidadreturns").value = jsparse[0].Qty + " uds.";
            document.getElementById("item-id-returns").value = jsparse[0].Item_ID;
            cantidadItemsAbonar(jsparse[0].Qty);
            obtenerDescripcionItem(jsparse[0].Item_ID);
            console.log(">>> Importados todos los elementos...");
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
            document.getElementById("mercancia-abonar").value = jsparse[0].Reference;
            document.getElementById("detalle-pedido-returns").value = jsparse[0].Reference;
            document.getElementById("descripctionItem-returns").value = jsparse[0].Description;
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
            document.getElementById("iduser2").value = jsparse[0].User_ID;
        },
        error: function () {
            alert("Error");
        }
    });
}

//OBTENER MOTIVOS DE DEVOLLUCION >>> Select
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

            const $select = document.getElementById("comentarios-tecnico-returns");
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
                    texto = "Seleccione un motivo";
                } else {
                    valor = jsparse[i].ReturnReason_ID;
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


//IMPORTA LISTA DE RECEPCIONES EN ESPERA DE ENTRAR EN DEPARTAMENTO + ARRAY CON LOCKER Y COMENTARIOS
var importarListaRecepcionesPendientes = () => {
    var proximodep = 1;
    window.pickups = [];
    window.lockers = [];
    //window.customers = [];
    //window.packagetype = [];
    window.stringrecepionespendientes;
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

            const $select = document.getElementById("devoluciones-pendientes");
            for (var i = 0; i > $select.options.length; i--) {
                $select.remove(i);
            }
            var option;
            var valor;
            var texto;
            for (var i = -1; i < jsparse.length; i++) {
                option = document.createElement('option');
                if (i == -1) {
                    valor = "";
                    texto = "Seleccione una devolución";
                } else {
                    valor = jsparse[i].Reception_ID;
                    texto = jsparse[i].Reception_ID;
                    lockers.push(jsparse[i].Locker_ID);
                    //customers.push(jsparse[i].Customer_ID);
                    pickups.push(valor);
                }
                option.value = valor;
                option.text = texto;
                $select.appendChild(option);
            }
            stringrecepionespendientes = pickups.toString() + "." + lockers.toString() /* + "." + customers.toString() */;
        },
        error: function () {
            alert("Error");
        }
    });
    return window.stringrecepionespendientes;
}

/* ----------------------LOCKERS-------------------------------- */
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
            document.getElementById("nextlocker-id-returns").value = jsparse[0].Locker_ID;
            document.getElementById("nextlocker-returns").value = jsparse[0].Name;
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

var desbloquearLocker = () => {
    var locker = document.getElementById("nextlocker-id-returns").value;
    var name = document.getElementById("nextlocker-returns").value;
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