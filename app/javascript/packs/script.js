$(function() {

  $('.menu-icon').click(function() {
    $(this).hide();
    $('.close-icon').css('display', 'block');
    $('.header_right').css('display', 'block')
  });

  $('.close-icon').click(function() {
    $(this).hide();
    $('.menu-icon').css('display', 'block');
    $('.header_right').css('display', 'none')
  });

});
