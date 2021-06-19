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
//= require fullcalendar
//= require fullcalendar/locale-all


//= require shards

//= require_tree .

/* global $*/



  // $(function () {
  //   $('.datepicker').datetimepicker({
  //     format: 'YYYY-MM-DD HH:mm:ss'
  //   });
  // });



//スクロールすると上部に固定させるための設定を関数でまとめる

function FixedAnime() {
	var headerH = $('#header').outerHeight(true);
	var scroll = $(window).scrollTop();
	if (scroll >= headerH){//headerの高さ以上になったら
			$('#header').addClass('fade-in');//fixedというクラス名を付与
			$('#header').removeClass('fade-out');//fixedというクラス名を除去
			// $('#header').fadeOut();//fixedというクラス名を付与
			// $('.fixed').fadeIn();//fixedというクラス名を除去

		}else{//それ以外は
			$('#header').addClass('fade-out');//fixedというクラス名を付与
			$('#header').removeClass('fade-in');//fixedというクラス名を除去
			// $('#header').fadeIn();//fixedというクラス名を付与
			// $('.fixed').fadeOut();//fixedというクラス名を除去


		}
}


$(document).on('turbolinks:load', function () {
// 画面をスクロールをしたら動かしたい場合の記述
$(window).scroll(function () {
	FixedAnime();/* スクロール途中からヘッダーを出現させる関数を呼ぶ*/
});
});
