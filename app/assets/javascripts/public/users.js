// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/



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
        var selectedUserValue = $(this).val();
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
});


/* ===== Logic for creating fake Select Boxes ===== */
$(function(){
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
});

// Toggling the `.active` state on the `.sel`.
$(function(){
$('.sel').click(function() {
  $(this).toggleClass('active');
});
});

$(function(){
// Toggling the `.selected` state on the options.
$('.sel__box__options').click(function() {
  var txt = $(this).text();
  var index = $(this).index();

  $(this).siblings('.sel__box__options').removeClass('selected');
  $(this).addClass('selected');

  var $currentSel = $(this).closest('.sel');
  $currentSel.children('.sel__placeholder').text(txt);
  $currentSel.children('select').prop('selectedIndex', index + 1);
});
});


// 絞り込み



$(document).on('turbolinks:load', function () {
    $('.user_general').val('')
    $('.user_orchestra').val('')
    $('.user_general').css("display","")
    $('.user_orchestra').css("display","none")
    $('#user_index').change(function () {
        var selectedValue = $('#user_index').val();
        if (selectedValue == '奏者一覧') {
            $('.user_orchestra').val('')
            $('.user_general').val('')
            $('.user_orchestra').css("display","none")
            $('.user_general').css("display","")
        }else if (selectedValue == 'オーケストラ一覧') {
            $('.user_orchestra').val('')
            $('.user_general').val('')
            $('.user_orchestra').css("display","")
            $('.user_general').css("display","none")
        }else{
            $('.user_general').val('')
            $('.user_orchestra').val('')
            $('.user_general').css("display","none")
            $('.user_orchestra').css("display","none")
        }
    })
});