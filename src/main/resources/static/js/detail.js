// --------------- 전역변수 선언 --------------- //




// --------------- 함수 정의 --------------- //
// 포스트 별점만큼 별 찍는 함수
function starRate(star) {
    // console.log("starRate 함수 시작!");
    // console.log(star);

    const $star = $('.star-span');
    let text = '';

    // 별점이 0일 경우
    if (star === '0' || star === null) {
        $star.removeClass('top-span')
        return;
    } else {
    // 별점이 1보다 큰 경우
    for (let i = 0; i < star; i++) {
        text += '⭐';
    }
    $star.text(text);
    }
}