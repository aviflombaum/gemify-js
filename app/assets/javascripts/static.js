$(document).ready(function(){
  var paths = $('path');
  var currentURL = window.location.pathname
  if (currentURL == "/"){
      $('body').addClass("background")
  };

  $.each(paths, draw);
});


var draw = function(i, path){
    path.style.transition = path.style.WebkitTransition = 'none';
    path.style.opacity = '0'

    path.getBoundingClientRect();
    var duration = 'opacity ' + (Math.floor((Math.random()*600)+1) / 100 + 1) + 's' + ' ease-in-out';

    path.style.transition = path.style.WebkitTransition = duration;

    path.style.opacity = '1';
    setTimeout(draw, 1000);
  };