// -------------- 전역변수, 함수 선언부 ----------- //
// 별 특수문자 채우는 함수
function drawStars(){
    const $stars = document.querySelectorAll('.star-rate');

    for (let i= 0; i < $stars.length; i++ ){
        const num = $stars[i].dataset.starRate;
        let msg = '';
        for(let j=0; j<num; j++){
            msg += '⭐';
        }
        $stars[i].textContent = msg;
    }

}





// ------------ 함수 실행부 ------------ //
$(document).ready(function () {
    $(() => {

        // 별 특수문자 채우기
        drawStars();



  
    });
  
  });