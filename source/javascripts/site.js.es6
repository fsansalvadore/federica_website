var width = $(window).width();
        var anchor;

        if(width>950) {
            anchor = 160;
        } else {
           anchor = 90;
           }

          $(document).ready(function(){
          $("a").click(function(e) {
            $('html, body').animate({
              scrollTop: $($.attr(this, 'href')).offset().top - anchor
            }, 'slow');
          });
        });

var clickEvent = (function() {
  if ('ontouchstart' in document.documentElement === true)
    return 'touchstart';
  else
    return 'click';
})();

$('#menuToggle').on('click', function(){
    $('#menu').toggleClass("open-menu");
    $('#menu').toggleClass("closed-menu");
});

$('#menu li').on('click', function(){
    $('#menu').removeClass("open-menu");
    $('#menu').addClass("closed-menu");
    $("#menuToggle input").prop("checked", false);
});

$('.map-btn-single').on('click', function(){
    $('#map-btn .map-btn-single').removeClass("active");
    $(this, '.map-btn-single').addClass("active");
    console.log(jQuery(this).attr("id"));
    if(jQuery(this).attr("id") == "torino") {
        $('#map').html('<iframe src="https://www.google.com/maps/embed/v1/place?q=Via%20Don%20Giovanni%20Minzoni%2C%202%2010121%20Torino%20TO&key=AIzaSyAvMMUbUBXr4WEtSIYgrUZq3HMWEmzEKTw" width="100%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>');
    } else if (event.target.id == "chieri") {
        $('#map').html('<iframe src="https://www.google.com/maps/embed/v1/place?q=Viale%20Fasano%20%2C%2017%2C%20Chieri%2C%20Metropolitan%20City%20of%20Turin%2C%20Italy&key=AIzaSyAvMMUbUBXr4WEtSIYgrUZq3HMWEmzEKTw" width="100%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>');
    }
});
