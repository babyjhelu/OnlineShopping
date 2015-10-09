$(document).ready(
    function() {
        setInterval(function() {
            $('.main-time-portion').load('/home/give_time');
        }, 1000);
    });