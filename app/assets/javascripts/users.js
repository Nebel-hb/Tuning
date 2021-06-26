// // # Place all the behaviors and hooks related to the matching controller here.
// // # All this logic will automatically be available in application.js.
// // # You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {
$('#signup').click(function() {
  $('.box').css('transform', 'translateX(80%)');
  $('.signin').addClass('nodisplay');
  $('.signup').removeClass('nodisplay');
});
});

$( function () {
$('#signin').click(function() {
  $('.box').css('transform', 'translateX(0%)');
  $('.signup').addClass('nodisplay');
  $('.signin').removeClass('nodisplay');
});
});