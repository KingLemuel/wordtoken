$(document).ready(notification);

function notification(argument) {
  var p_btn = $('.profile_btn');


  $('.handshake_btn').click(showNotificationsDialog);
  var notification_box = $('.notification_box');

  function showNotificationsDialog() {
    if (notification_box.find(".user").length<1) return;
    notification_box.fadeIn();
    var n = notification_box.find('.dialog').offset().top;
    $('html, body').animate({
      scrollTop: (n - 100) + "px"
    });
  }



  $('.notification_box .btns input').click(function(){
      $(this).closest('.user').remove();
  });

  notification_box.click(function(e) {
    if (e.target != this) return;
    if ($(this).is('.notification_box')) {
    notification_box.hide();
    }
  });

  notification_box.find('.dialog').bind('mousewheel DOMMouseScroll', function(e) {
    var scrollTo = null;

    if (e.type == 'mousewheel') {
      scrollTo = (e.originalEvent.wheelDelta * -1);
    } else if (e.type == 'DOMMouseScroll') {
      scrollTo = 40 * e.originalEvent.detail;
    }

    if (scrollTo) {
      e.preventDefault();
      $(this).scrollTop(scrollTo + $(this).scrollTop());
    }
  });


}
