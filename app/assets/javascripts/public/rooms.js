// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// チャット　最下部にスクロール
document.addEventListener("turbolinks:load", () => {
    function scrollToEnd() {
        if(document.URL.match(/rooms\/+\d/)){
        const messageDetails = document.getElementById('scroll');
        messageDetails.scrollTop = messageDetails.scrollHeight;
        }
    }
    scrollToEnd()
})
