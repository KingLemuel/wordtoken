$(document).ready(notification);

function notification(argument) {
  var p_btn = $('.profile_btn');
  var circle = $('<div>').addClass('noti_circle');
  circle.text(1);
  p_btn.append(circle);


  $('.handshake_btn').click(showNotificationsDialog);
  var notification_box = $('.notification_box');

  function showNotificationsDialog() {
    notification_box.fadeIn();
    var n = notification_box.find('.dialog').offset().top;
    $('html, body').animate({
      scrollTop: (n - 100) + "px"
    });
  }


  notification_box.click(function(e) {
    if (e.target != this) return;
    if ($(this).is('.notification_box')) {
      $(this).hide();
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
