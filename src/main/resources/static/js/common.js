// -------------- 전역변수, 함수 선언부 ----------- //
function jQueryTagTest(msg, node) {
  console.log(msg);
  console.log(node);
}

// 플랫폼 배지에 색 칠하는 함수
function paintPlatformBadge(){
  console.log("paintPlatformBadge 호출");
}





// ------------ 함수 실행부 ------------ //
$(document).ready(function () {
  $(() => {
    // 메뉴 토글 이벤트
    const $menu = $('.menu-open');
    const $gnb = $('.gnb')

    $menu.click(e => {
      //  console.log(e.target);
      $gnb.toggleClass('on')
    })

    // 메뉴 닫기 이벤트
    const $close = $('.menu-close');
    $close.click(e => {
      $gnb.toggleClass('on')
    })

  });

});