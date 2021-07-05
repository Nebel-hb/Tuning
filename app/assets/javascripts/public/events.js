// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
/* global $*/


$(document).on('turbolinks:load', function () {
    $('.search_title').val('')
    $('.search_user').val('')
    $('.search_other').val('')
    $('.search_title').css("display","none")
    $('.search_user').css("display","none")
    $('.search_other').css("display","none")
    $('.search_type').change(function () {
        var selectedValue = $(this).val();
        if (selectedValue == 'イベント検索') {
            $('.search_user').val('')
            $('.search_other').val('')
            $('.search_title').css("display","")
            $('.search_user').css("display","none")
            $('.search_other').css("display","none")

        }else if (selectedValue == '募集者検索') {
            $('.search_title').val('')
            $('.search_other').val('')
            $('.search_title').css("display","none")
            $('.search_user').css("display","")
            $('.search_other').css("display","none")
        }else if (selectedValue == 'タグ検索') {
            $('.search_title').val('')
            $('.search_user').val('')
            $('.search_title').css("display","none")
            $('.search_user').css("display","none")
            $('.search_other').css("display","")
        }else{
            $('.search_title').val('')
            $('.search_user').val('')
            $('.search_other').val('')
            $('.search_title').css("display","none")
            $('.search_user').css("display","none")
            $('.search_other').css("display","none")
        }
    })
});


$(document).on('turbolinks:load',function(){
  $('#event_event_image').on('change', function (e) {
    // 既存の画像のurlの取得
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#event_image").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
  });
});

// ＝＝＝＝ツールチップ＝＝＝＝＝

$(document).on('turbolinks:load',function(){

  function simple_tooltip(target_items, name){
   $(target_items).each(function(i){
  		$("body").append("<div class='"+name+"' id='"+name+i+"'><p>"+$(this).attr('title')+"</p></div>");
  		var my_tooltip = $("#"+name+i);

  		if($(this).attr("title") != "" && $(this).attr("title") != "undefined" ){

  		$(this).removeAttr("title").mouseover(function(){
  					my_tooltip.css({opacity:0.8, display:"none"}).fadeIn(400);
  		}).mousemove(function(kmouse){
  				var border_top = $(window).scrollTop();
  				var border_right = $(window).width();
  				var left_pos;
  				var top_pos;
  				var offset = 20;
  				if(border_right - (offset *2) >= my_tooltip.width() + kmouse.pageX){
  					left_pos = kmouse.pageX+offset;
  					} else{
  					left_pos = border_right-my_tooltip.width()-offset;
  					}

  				if(border_top + (offset *2)>= kmouse.pageY - my_tooltip.height()){
  					top_pos = border_top +offset;
  					} else{
  					top_pos = kmouse.pageY-my_tooltip.height()-offset;
  					}


  				my_tooltip.css({left:left_pos, top:top_pos});
  		}).mouseout(function(){
  				my_tooltip.css({left:"-9999px"});
  		});

  		}

  	});
  }


  $(document).ready(function(){
  	 simple_tooltip(".tooltip_image","tooltip");
  });
});