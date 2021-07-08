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

