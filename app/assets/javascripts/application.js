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

//= require_tree .

/* global $*/

/*
$('honyarara').on("change", function(){
  if title search
    $("title ni kanren").css("display","")
    $("tag ni kanren").css("display","none")
  else if tagnikanren
    $("title ni kanren").css("display","none")
    $("tag ni kanren").css("display","")
})
*/

  // $(function () {
  //   $('.datepicker').datetimepicker({
  //     format: 'YYYY-MM-DD HH:mm:ss'
  //   });
  // });


//カレンダー
$(function () {
    // 画面遷移を検知
    $(document).on('turbolinks:load', function () {
        if ($('#calendar').length) {

            function Calendar() {
                return $('#calendar').fullCalendar({
                });
            }
            function clearCalendar() {
                $('#calendar').html('');
            }

            $(document).on('turbolinks:load', function () {
                Calendar();
            });
            $(document).on('turbolinks:before-cache', clearCalendar);

            //events: '/events.json', 以下に追加
            $('#calendar').fullCalendar({
                events: '/events.json',
                //カレンダー上部を年月で表示させる
                titleFormat: 'YYYY年 M月',
                //曜日を日本語表示
                dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
                //ボタンのレイアウト
                header: {
                    left: 'listWeek,dayGridMonth',
                    center: 'title',
                    right: ' today, prev,next'
                },
                //終了時刻がないイベントの表示間隔
                defaultTimedEventDuration: '03:00:00',
                buttonText: {
                    prev: '<',
                    next: '>',
                    prevYear: '前年',
                    nextYear: '翌年',
                    today: '今日',
                    month: '月',
                    week: '週',
                    day: '日'
                },
                // Drag & Drop & Resize
                // editable: true,
                //イベントの時間表示を２４時間に
                timeFormat: "HH:mm",
                //イベントの色を変える
                eventColor: '#d0e39b',
                //イベントの文字色を変える
                eventTextColor: '#000000',
                eventRender: function(event, element) {
                    element.css("font-size", "0.5em");
                    element.css("padding", "3px");
                }
 
            });
        }
    });
});

//  function formSwitch() {
//         hoge = document.getElementsByName('utf8')
//          if (hoge[0].checked) {
//             // 好きな食べ物が選択されたら下記を実行します
//             document.getElementById('event').style.display = "";
//             document.getElementById('tag').style.display = "none";
//         } else if (hoge[1].checked) {
//             // 好きな場所が選択されたら下記を実行します
//             document.getElementById('event').style.display = "none";
//             document.getElementById('tag').style.display = "";
//         } else {
//             document.getElementById('event').style.display = "none";
//             document.getElementById('tag').style.display = "none";
//         }
//     }
//     window.addEventListener('load', formSwitch());
    