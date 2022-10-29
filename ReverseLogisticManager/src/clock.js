function Time() {
    var date = new Date();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();
    var day = date.getDate();
    var mounth = date.getMonth() + 1;
    var year = date.getFullYear();

    hour = updateTime(hour);
    minute = updateTime(minute);
    second = updateTime(second);
    day = updateTime(day);
    mounth = updateTime(mounth);

    document.getElementById("digitalclock").innerHTML =
        hour + ":" + minute + ":" + second;
    document.getElementById("date").innerHTML = day + "-" + mounth + "-" + year;
    setTimeout(Time, 1000);
}

function updateTime(datetime) {
    if (datetime < 10) {
        return "0" + datetime;
    } else {
        return datetime;
    }
}
Time();