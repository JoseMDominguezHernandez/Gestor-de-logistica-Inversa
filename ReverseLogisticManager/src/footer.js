function footernav() {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '../forms/footer.html');
    xhr.setRequestHeader('Content-Type', 'text/plain');
    xhr.send();
    xhr.onload = function (data) {
        document.querySelector("footer").innerHTML = data.currentTarget.response;
    }
}
footernav();