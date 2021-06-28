// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require moment
//= require jquery.jscroll.min.js


//= require shards
//= require modaal

//= require_tree .

/* global $*/



//スクロールすると上部に固定させるための設定を関数でまとめる

function FixedAnime() {
	var headerH = $('#header').outerHeight(true);
	var scroll = $(window).scrollTop();
	if (scroll >= headerH){//headerの高さ以上になったら
			$('#header').addClass('fade-in');//fixedというクラス名を付与
			$('#header').removeClass('fade-out');//fixedというクラス名を除去

		}else{//それ以外は
			$('#header').addClass('fade-out');//fixedというクラス名を付与
			$('#header').removeClass('fade-in');//fixedというクラス名を除去

		}
}

$(document).on('turbolinks:load', function () {
// 画面をスクロールをしたら動かしたい場合の記述
$(window).scroll(function () {
	FixedAnime();/* スクロール途中からヘッダーを出現させる関数を呼ぶ*/
});
});


// =========モーダル===========

//. テキストを含む一般的なモーダル

$(document).on('turbolinks:load', function () {
$(".info").modaal({
	overlay_close:true,//モーダル背景クリック時に閉じるか
	before_open:function(){// モーダルが開く前に行う動作
		$('html').css('overflow-y','hidden');/*縦スクロールバーを出さない*/
	},
	after_close:function(){// モーダルが閉じた後に行う動作
		$('html').css('overflow-y','scroll');/*縦スクロールバーを出す*/
	}
});
});


$(document).on('turbolinks:load', function () {
var access = $.cookie('access')
	if(!access){
		flag = true;
		$.cookie('access', false);
	}else{
		flag = false
	}
	});

$(document).on('turbolinks:load', function () {
	//モーダル表示
	$(".modal-open").modaal({
	// start_open:flag, // ページロード時に表示するか
	start_open:true, // ページロード時に表示するか
	overlay_close:true,//モーダル背景クリック時に閉じるか
	before_open:function(){// モーダルが開く前に行う動作
		$('html').css('overflow-y','hidden');/*縦スクロールバーを出さない*/
	},
	after_close:function(){// モーダルが閉じた後に行う動作
		$('html').css('overflow-y','scroll');/*縦スクロールバーを出す*/
	}
	});
	});

// ====================

$(window).on('scroll', function() {
  scrollHeight = $(document).height();
  scrollPosition = $(window).height() + $(window).scrollTop();
  if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
    $('.jscroll').jscroll({
      contentSelector: '.scroll-list',
      nextSelector: 'span.next:last a'
    });
  }
});


let client_h = document.getElementsByClassName('.sel__box ').clientHeight;
