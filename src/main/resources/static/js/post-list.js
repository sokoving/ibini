// -------------- 전역변수, 함수 선언부 ----------- //
// 별 특수문자 채우는 함수
function drawStarsAtList(){
    const $stars = document.querySelectorAll('.star-rate');
//    console.log($stars);

    for (let i= 0; i < $stars.length; i++ ){
        const num = $stars[i].dataset.starRate;
//        console.log(num);
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


  
    });
  
  });