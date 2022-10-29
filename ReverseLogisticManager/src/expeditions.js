const open = document.getElementById('open');
const modal_container = document.getElementById('modal_container');
const close = document.getElementById('close');

//VENTANA MODAL. Insertamospara indicar nº cliente
open.addEventListener('click', () => {
    modal_container.classList.add('show');
    document.getElementById("expedition-num").focus();
    document.getElementById("open").style.visibility = "hidden";
    importarListaPendientesEnvio();
});

var cancelmodal = () => {
    window.location.replace("../forms/expeditions.html");
}

close.addEventListener('click', () => {

    var exped = document.getElementById("expedition-num").value;
    var arrayExpeditions = importarListaPendientesEnvio().split(",");
    var flag = false;
    for (var i = 0; i < arrayExpeditions.length; i++) {        // Existe?
        if (arrayExpeditions[i] == exped) {
            flag = true;
            document.getElementById("numexpedicion").value = arrayExpeditions[i];

            modal_container.classList.remove('show');
            document.getElementById("open").style.visibility = "visible";
            var lockerout = 0;
            var nexttrack = 99;
            var Expedition_ID = document.getElementById("numexpedicion").value;
            $.ajax({
                type: "POST",
                url: "../PHPServidor5.php",
                data: {
                    /*  Reception_ID: Reception_ID, */
                    LastStatus: nexttrack,
                    Locker_ID: lockerout,
                    Expedition: Expedition_ID,
                },
                success: function (response) {
                    console.log(">>> Tracking actualizado");
                },
                error: function () {
                    alert("Error");
                }
            });

        } else {
            document.getElementById('numexpedicion').value = "";
            alert('Introduzca un número de expedicióne válido');
            document.getElementById('exp-number').focus;
            return
        }
    }
    for (var i = 0; i <= arrayExpeditions.length + 1; i++) {
        enviarCliente();
    }
});


//IMPORTACIÓN NUMEROS DE RECOGIDA pendientes de recepcionar >>> Desplegable y Array de verificación
var importarListaPendientesEnvio = () => {
    window.expeditions = [];
    window.stringexpeditions;
    var proximodep = 16;
    $.ajax({
        type: "POST",
        url: "../PHPServidor5.php",
        data: {
            LastStatus: proximodep,
        },
        success: function (response) {
            var index = response.indexOf("[");
            var json = response.substring(index, response.length);
            var jsparse = JSON.parse(json);

            const $datalist = document.getElementById("exp-number");
            var option;
            var valor;
            for (var i = 0; i < jsparse.length; i++) {
                option = document.createElement('option');
                valor = jsparse[i].Expedition_ID;
                expeditions.push(jsparse[i].Expedition_ID)
                option.value = valor;
                $datalist.appendChild(option);
            }
            stringexpeditions = expeditions.toString();
        },
        error: function () {
            alert("Error");
        }
    });
    return window.stringexpeditions;
}