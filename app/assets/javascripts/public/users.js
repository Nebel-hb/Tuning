// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

/* global $*/

//開閉ボタンを押した時には
$(function(){
$(".open-btn").on("click", function () {
$(".open-btn").toggleClass('btnactive');//.open-btnは、クリックごとにbtnactiveクラスを付与＆除去。1回目のクリック時は付与
$("#search-wrap").toggleClass('panelactive');//#search-wrapへpanelactiveクラスを付与
$('#search-text').focus();//テキスト入力のinputにフォーカス
});

});


$(document).on('turbolinks:load', function () {
    $('.search_id').val('')
    $('.search_users').val('')
    $('.search_id').css("display","none")
    $('#search_users').change(function () {
      //$('#user_search > div:nth-child(2) > div > span:nth-child(2)').on('click', function() {
        //let selectedUserValue = $(this).val();
        let selectedUserValue = document.querySelector('#user_search > div > span').innerText
        console.log(selectedUserValue)
        if (selectedUserValue == '名前検索') {
            $('.search_id').val('')
            $('.search_users').val('')
            $('.search_id').css("display","none")
            $('.search_users').css("display","")

        }else if (selectedUserValue == 'ID検索') {
            $('.search_users').val('')
            $('.search_id').val('')
            $('.search_id').css("display","")
            $('.search_users').css("display","none")

        }else {
            $('.search_user').val('')
            $('.search_id').val('')
            $('.search_id').css("display","none")
            $('.search_user').css("display","")

        }
    })

    $('.sel').each(function() {
      $(this).children('select').css('display', 'none');

      var $current = $(this);

      $(this).find('option').each(function(i) {
        if (i == 0) {
          $current.prepend($('<div>', {
            class: $current.attr('class').replace(/sel/g, 'sel__box')
          }));

          var placeholder = $(this).text();
          $current.prepend($('<span>', {
            class: $current.attr('class').replace(/sel/g, 'sel__placeholder'),
            text: placeholder,
            'data-placeholder': placeholder
          }));

          return;
        }

        $current.children('div').append($('<span>', {
          class: $current.attr('class').replace(/sel/g, 'sel__box__options'),
          text: $(this).text()
        }));
      });
    });
    $('.sel').click(function() {
      $(this).toggleClass('active');
    });
    $('.sel__box__options').click(function() {
      $('input[type=search]').val('');
      var txt = $(this).text();
      var index = $(this).index();

      $(this).siblings('.sel__box__options').removeClass('selected');
      $(this).addClass('selected');

      var $currentSel = $(this).closest('.sel');
      if ($(this).text() == "奏者一覧"  ) {
        document.querySelector('.user_general').style.display = "block";
        document.querySelector('.user_orchestra').style.display = "none";
      } else if ($(this).text() == "オーケストラ一覧") {
        document.querySelector('.user_orchestra').style.display = "block";
        document.querySelector('.user_general').style.display = "none";
      } else if ($(this).text() == "イベント検索"  ) {
        document.querySelector('.search_title').style.display = "block";
        document.querySelector('.search_user').style.display = "none";
        document.querySelector('.search_other').style.display = "none";
      } else if ($(this).text() == "募集者検索") {
        document.querySelector('.search_title').style.display = "none";
        document.querySelector('.search_user').style.display = "block";
        document.querySelector('.search_other').style.display = "none";
      } else if ($(this).text() == "楽器検索" ) {
        document.querySelector('.search_title').style.display = "none";
        document.querySelector('.search_user').style.display = "none";
        document.querySelector('.search_other').style.display = "block";
      } else if ($(this).text() ==  "投稿者検索") {
        document.querySelector('.search_title').style.display = "none";
        document.querySelector('.search_user').style.display = "block";
        document.querySelector('.search_other').style.display = "none";
      } else if ($(this).text() == "タグ検索") {
        document.querySelector('.search_title').style.display = "none";
        document.querySelector('.search_user').style.display = "none";
        document.querySelector('.search_other').style.display = "block";


      };

      $currentSel.children('.sel__placeholder').text(txt);

      $currentSel.children('select').prop('selectedIndex', index + 1);
    });
});

$(document).on('turbolinks:load',function(){
  $('#user_profile_image').on('change', function (e) {
    // 既存の画像のurlの取得
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#profile_image").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
  });
});