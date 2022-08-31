// --------------- 전역변수 선언 --------------- //




// --------------- 함수 정의 --------------- //
// 포스트 별점만큼 별 찍는 함수
function drawStarsAtDetail(star) {
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

// 수정, 삭제, 목록 버튼 클릭 이벤트 핸들러
function clickPostBtn(target, postNo) {
    // 수정 폼 요청
    if (target.matches('.fa-pencil-alt') || target.matches('.post-modi-btn')) {
//        console.log("포스트 수정");
        // location.href = '/post/modify?postNo=' + postNo;
    }

    // 삭제 폼 요청
    else if (target.matches('.fa-trash-alt') || target.matches('.post-del-btn')) {
        console.log("포스트 삭제");
        const delFlag = confirm("해당 포스트에 등록한 모든 정보가 사라집니다.\n계속하시겠습니까?");
//        console.log(delFlag);
        if (delFlag) {
            location.href = '/post/delete?postNo=' + postNo;
        }

        // 목록 페이지 요청
    } else if (target.matches('.fa-list-alt') || target.matches('.post-list-btn')) {
//        console.log("목록으로");
        location.href = '/list';
    }
}