// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// チャット　最下部にスクロール
document.addEventListener("turbolinks:load", () => {
    if(document.URL.match(/rooms\/+\d/)){
    function scrollToEnd() {
        ('#scroll').animate({ scrollEnd: $('#scroll')[0].scrollHeight});
        var messageDetails = document.getElementById('scroll');
        messageDetails.scrollTop = messageDetails.scrollHeight;
        // }
    scrollToEnd()
    }
    // var element = document.getElementById('scroll'); // 移動させたい位置の要素を取得
    // var rect = element.getBoundingClientRect();
    // var position = rect.top;
    // setTimeout( function() {
    //     scrollTo(0, position);}
    //     , 1000);
}
})

