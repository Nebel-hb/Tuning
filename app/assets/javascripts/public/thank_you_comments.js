// 
$(document).on('turbolinks:load', function () {
  
  $(document).ready(function () {
    var nbP = $('.tool_contain p').length;
    var w = parseInt($('.tool_contain p').css("width"));
    var max = (nbP - 1) * w;
    $("ul li[data-num='1']").addClass('active');
    $('.step span').html('Step 1');
    
    $('body').on('click','.btn', function(){
      var margL = parseInt($('.slider-turn').css('margin-left'));
      var modulo = margL%w;
      if (-margL < max && modulo == 0) {
        margL -= w;
     
        $('.slider-turn').animate({
          'margin-left':margL
        },300);
        $('ul li.active').addClass('true').removeClass('active');
        var x = -margL/w +1;
        $('ul li[data-num="'+x+'"]').addClass('active');
        $('.step span').html("Step "+x);
      }
      else  {}
    });
    
    $('body').on('click','.close',function(){
      $('.tool_contain').animate({
        'opacity':0
      },600);
      $('.tool_contain').animate({
        'top':-1200
      }, {
        duration: 2300,
        queue: false
      });
      $('.open').animate({
        'top':'50%'
      });
    });
    
    $('body').on('click','.open',function() {
      $('.open').animate({
        'top':-1000
      });
      $('.tool_contain').animate({
        'opacity':1
      },400);
      $('.tool_contain').animate({
        'top':'50%'
      }, {
        duration: 800,
        queue: false
      });
    });
  });
});