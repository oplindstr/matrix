matrixApp.service('DateHelper', function(){

    this.time_format = function(time) {
        time = new Date(time);
        day = time.getDay();
        switch (day) {
            case 0:
                day = "Su";
                break;
            case 1:
                day = "Ma";
                break;
            case 2:
                day = "Ti";
                break;
            case 3:
                day = "Ke";
                break;
            case 4:
                day = "To";
                break;
            case 5:
                day = "Pe";
                break;
            case 6:
                day = "La";
                break;
        }

        newTime = day + ' ' + time.getDate() + '.' + time.getMonth() + '.' + time.getFullYear() + ' ' + addZero(time.getHours()) + ':' + addZero(time.getMinutes());
        return newTime;
    }

    function addZero(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }
});