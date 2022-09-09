// --------------- 전역변수 ----------------//

// 연관 포스트 토글 박스
const $postToggles = $('#link-post-wrap .toggle-box').children();

// 연관 포스트 목록(검색창, 목록 포함)
const $linkUl = document.getElementById('link-container');



// -------------------------- 연관 포스트 요청 관련 함수 --------------------------- //








// -------------------------------------------------------------------- //

// 수정, 삭제, 목록 버튼 클릭 이벤트 핸들러
function clickPostBtn(target, postNo) {
    // 수정 폼 요청
    if (target.matches('.fa-pencil-alt') || target.matches('.post-modi-btn')) {
        //        console.log("포스트 수정");
        location.href = '/post/modify/' + postNo;
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
