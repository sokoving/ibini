// 이미지를 보여주는 함수
// n: 이미지 슬라이드 번호
function showSlides(n) {

    let $slides = document.querySelectorAll(".mySlides");
    let $dots = document.querySelectorAll(".dot");

    // ex: 3번 슬라이드에서 다음버튼을 누르면 1번 슬라이드로 이동
    if (n > $slides.length) {
        slideIndex = 1
    }

    // ex: 1번 슬라이드에서 이전버튼을 누르면 3번 슬라이드로 이동
    if (n < 1) {
        slideIndex = $slides.length
    }

    // 슬라이드 시작전 모든 슬라이드 숨김처리
    for (let i = 0; i < $slides.length; i++) {
        $slides[i].style.display = "none";
    }
    // 슬라이드 시작전 모든 슬라이드에서 active 클래스 제거
    for (let i = 0; i < $dots.length; i++) {
        if ($dots[i].classList.contains('active')) {
            $dots[i].classList.remove('active');
            break;
        }
    }

    // 현재 슬라이드 번호에 맞는 이미지 슬라이드 보여지게 함.
    $slides[slideIndex - 1].style.display = "block";
    $dots[slideIndex - 1].classList.add('active');
}


function slick() {
    // 슬라이드 이미지 번호
    let slideIndex = 1;

    // 시작화면에 1번 이미지를 띄움
    showSlides(slideIndex);

    // 이전, 다음 버튼 클릭시 작동할 이벤트 핸들러
    function plusSlides(e) {
        showSlides(slideIndex += +e.target.dataset.index);
    }

    // 도트 버튼 클릭시 작동할 이벤트 핸들러
    function currentSlide(e) {
        showSlides(slideIndex = +e.target.dataset.index);
    }
}