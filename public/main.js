$(window).scroll(function() {
  checkToTop();
});

var to_top = $('.to_top');
var timer;

to_top.find(".box").click(function() {
  $('body, html').animate({
    scrollTop: "0px"
  });
});

function checkToTop() {
  var view = isElementInViewport(to_top);
  if (view) {
    timer = setTimeout(function() {
      to_top.css("transition", "opacity 1s");
      to_top.css('opacity', 1);
    }, 300);
  } else {
    clearTimeout(timer);
    to_top.css("transition", "opacity 0s");
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






// Auto complete
(function() {
  var input = $("#search_input_box"),
    suggestions = $(".suggestions"),
    no_user_msg = $(".no_user"),
    user_temp = $('<div class="user"> <a href="#"> <div class="img"><img/></div><div class="name">Test</div></a> </div>'),
    timer = null,
    num = 0;



  function makeAutoReq() {
    var url = "autocomplete/user_json";
    $.getJSON(url + '?q=' + input.val()).done(handleData);
  }

  function handleData(data) {
    suggestions.removeClass('hide');
    if (data.length > 0) {
      no_user_msg.addClass('hide');
      createUsers(data);
    } else {
      suggestions.find('.user').remove();
      no_user_msg.removeClass('hide');
    }
  }

  function createUsers(data) {
    suggestions.find('.user').remove();
    data.forEach(function(u) {
      var $user = user_temp.clone();
      $user.find('.name').text(u.name);
      $user.find('a').attr('href',u.profile_link);
      $user.find('img').attr('src',u.img_url);
      suggestions.append($user);
    });
  }

  function show_suggestions() {

    clearTimeout(timer);
  }

  function blurHandler() {
    clearTimeout(timer);
    timer = setTimeout(function(){
      suggestions.addClass('hide');
    },400);
  }



  input.on('input', makeAutoReq);
  input.on('blur', blurHandler);
  input.on('focus', show_suggestions);

})();
