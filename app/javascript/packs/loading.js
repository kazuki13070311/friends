$(document).on('turbolinks:load', function() {
  $(function(){
    var loader = $('.loader-wrap');

    $(window).on('load',function(){
      loader.fadeOut();
    });

    setTimeout(function(){
      loader.fadeOut();
    },2000);
  });
});