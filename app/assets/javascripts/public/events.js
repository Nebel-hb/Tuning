// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


//カレンダー

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