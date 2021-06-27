// // # Place all the behaviors and hooks related to the matching controller here.
// // # All this logic will automatically be available in application.js.
// // # You can use CoffeeScript in this file: http://coffeescript.org/

/* global $*/

$(document).on('turbolinks:load', function () {
  var wrapper = document.getElementById('wrapper');
  if (wrapper != null) {
    $('#wrapper').multiscroll({
    	sectionsColor: ['#222', '#333', '#222','#333', '#444', '#333', '#222', '#111', '#000'],//セクションごとの背景色設定
    	anchors: ['area1', 'area2', 'area3','area4','area5','area6','area7','area8'],//セクションとリンクするページ内アンカーになる名前
    	menu: '#menu',//上部ナビゲーションのメニュー設定
    	navigation: true,//右のナビゲーション出現、非表示は false
    	navigationTooltips:['thanks your coming', 'welcome to Tuning', 'join member ','event','talk room','official orchestra','thank you comment','let`s find!'],//右のナビゲーション現在地時に入るテキスト
    	loopTop: true,//最初のセクションを上にスクロールして最後のセクションまでスクロールするかどうかを定義します。
    	loopBottom: true,//最後のセクションを下にスクロールして最初のセクションまでスクロールするかどうかを定義します。
    });
  }
});