// // # Place all the behaviors and hooks related to the matching controller here.
// // # All this logic will automatically be available in application.js.
// // # You can use CoffeeScript in this file: http://coffeescript.org/

/* global $*/

// =========about==========
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


// top slide

$(document).on('turbolinks:load', function () {

	$('.slider').slick({
		fade:true,//切り替えをフェードで行う。初期値はfalse。
		autoplay: true,//自動的に動き出すか。初期値はfalse。
		autoplaySpeed: 6000,//次のスライドに切り替わる待ち時間
		speed:1000,//スライドの動きのスピード。初期値は300。
		infinite: true,//スライドをループさせるかどうか。初期値はtrue。
		slidesToShow: 1,//スライドを画面に3枚見せる
		slidesToScroll: 1,//1回のスクロールで3枚の写真を移動して見せる
		arrows: true,//左右の矢印あり
		prevArrow: '<div class="slick-prev"></div>',//矢印部分PreviewのHTMLを変更
		nextArrow: '<div class="slick-next"></div>',//矢印部分NextのHTMLを変更
		dots: true,//下部ドットナビゲーションの表示
        pauseOnFocus: false,//フォーカスで一時停止を無効
        pauseOnHover: false,//マウスホバーで一時停止を無効
        pauseOnDotsHover: false,//ドットナビゲーションをマウスホバーで一時停止を無効
});
});

// top

let data =[
      {str:"皆さま、大変長らくお待たせいたしました。",},
      {str:"この度はご来場いただき、誠にありがとうございます。",},
      {str:"コンサートを開催するにあたり",},
      {str:"多くの方にご協力いただきました。",},
      {str:"私どもが共にTuningし",},
      {str:"演奏する仲間に出会えたのは",},
      {str:"”Tuning”のおかげです",last:"true"},

      ];
    let time,timerId,index=0,pos=0;

    let getTimer=0;


          function opening(){

            let text =   document.getElementById('top_contain_text');
            text.classList.add("display_block");
            text.classList.add("top_contain");
            text.classList.remove("display_non");
            // document.getElementById('gnavi').classList.add("display_non");
            let contain = document.querySelector("#top_contain");
            contain.remove();
            clearTimeout(getTimer);
            getTimer=setTimeout(start,500);
          }


     function start(){
      // document.getElementById("nom").textContent="";
      // document.getElementById("gnavi").style.display="none";
      onkeydown=read;
      timerId=setInterval(tick,100);
    }

    function enter(){read({keyCode:13}) ;}

    function read (){

      time=setTimeout(function(){
      pos=0;
      index =(index+1)%data.length;
      clearInterval(timerId);
      timerId=setInterval(tick,100);
      },200);
    }

    function tick(){
      let text =data[index].str;
      document.getElementById("text").textContent=text.substr(0,pos);
      if(++pos> text.length){
        clearInterval(timerId);

      }

   let fin = data[index].last;
   if (fin == "true"){
          getTimer=setTimeout(function() {
 clearTimeout(getTimer);
            getTimer=setTimeout(textend,1000);
          },false);

  }
    }

    function textend(){
            document.getElementById('top_contain_text').classList.add("fadeout_slow");
            document.getElementById('top_contain_main').classList.add("top_contain");
            document.getElementById('top_contain_main').classList.add("fadein_slow");
      document.querySelector("#audio2").play();
            getTimer=setTimeout(function() {
            getTimer=setTimeout(toppage,6000);
          },false);
      }
    function toppage(){
            document.querySelector("#top_contain_text").remove();

    }
