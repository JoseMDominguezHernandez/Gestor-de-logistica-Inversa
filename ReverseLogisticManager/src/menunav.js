//Replica el menú  navegador en todas las páginas excepto en Index que lo tiene incrustado
function menuNavegacion() {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '../forms/menunav.html');
    xhr.setRequestHeader('Content-Type', 'text/plain');
    xhr.send();
    xhr.onload = function (data) {
        document.querySelector("nav").innerHTML = data.currentTarget.response;
    }
}
menuNavegacion();