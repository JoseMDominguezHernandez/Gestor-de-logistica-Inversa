//CONSULTA SOLICITUDES PENDIENTES >>> Campo INFO. Carga al acceder a la página
var solicitudesPendientes = () => {
    var Recibida = 0;
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",  //dirección del servidor
        data: {
            Received: Recibida
        },
        success: function (response) {
            var index = response.indexOf(":");
            var json = response.substring(index + 1, response.length - 1);
            var jsparse = JSON.parse(json);

            pendientes = jsparse;
            document.getElementById("contador-pendientes").value = pendientes;
        },
        error: function () {
            alert("Error");
        }
    });
}
solicitudesPendientes();



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
        if (numero.charCodeAt(i) <= 57 && numero.charCodeAt(i) >= 48) {//ASCII numeros
            num = num + numero.charAt(i);
            cont = cont + 1;
        }
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
