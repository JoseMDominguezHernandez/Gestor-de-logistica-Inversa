var countercontrols = () => {
    var lastStatus = 2;
    $.ajax({
        type: "POST",
        url: "../PHPServidor.php",  //dirección del servidor
        data: {
            LastStatus: lastStatus
        },
        success: function (response) {
            var index = response.indexOf(":");
            var json = response.substring(index + 1, response.length - 1);
            var jsparse = JSON.parse(json);

            pendientes = jsparse;
            document.getElementById("contador-devolucionesreturns").value = pendientes;
        },
        error: function () {
            alert("Error");
        }
    });
}
countercontrols();

var updatefechahora = (datetime) => {
    if (datetime < 10) {
        return "0" + datetime;
    } else {
        return datetime;
    }
}