/*$('html, body').scrollTop(10000);*/

$(window).scroll(function() {
  checkToTop();
});

var to_top = $('.to_top');
var timer;

to_top.find(".box").click(function(){
  $('body, html').animate({ scrollTop: "0px" });
});

function checkToTop() {
  var view = isElementInViewport(to_top);
  if (view) {
    timer = setTimeout(function(){
      to_top.css("transition","opacity 1s");
      to_top.css('opacity', 1);
    },300);
  } else {
    clearTimeout(timer);
    to_top.css("transition","opacity 0s");
    to_top.css('opacity', 0);
  }
}


function isElementInViewport(el) {

  //special bonus for those using jQuery
  if (typeof jQuery === "function" && el instanceof jQuery) {
    el = el[0];
  }

  var rect = el.getBoundingClientRect();

  return (
    rect.top >= 0 &&
    rect.left >= 0 &&
    rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && /*or $(window).height() */
    rect.right <= (window.innerWidth || document.documentElement.clientWidth) /*or $(window).width() */
  );
}

//token_box 
var token_box = $('.token_box');

if (token_box.find('input:checkbox').length == 0) {
  $('.give_token').text('All Given');
}
$('.give_token').click(function(){
  if (token_box.find('input:checkbox').length == 0) return;
  token_box.fadeIn();
  var n = token_box.find('.dialog').offset().top;
  $('html, body').animate({ scrollTop: (n - 100)+"px" });
});
token_box.click(function(e) {
  if(e.target != this) return;
  if($(this).is('.token_box')) {
    $(this).hide();
  }
});



// hide show more if there are not more than 7 tokens

var tokens = $('.tokens');
var all_token =  tokens.find('.token');
var show_more_btn = $('.show_more');
var n = 6;
if (all_token.length == 0) {
  $('.no_token_msg').show();
}
if (all_token.length < n) {
  show_more_btn.hide();
} else {
  all_token.eq(n-1).addClass('no_bottom');
  all_token.slice(n).hide();
}

show_more_btn.click(function(){
  all_token.removeClass('no_bottom');
  all_token.show();
  show_more_btn.remove();
});