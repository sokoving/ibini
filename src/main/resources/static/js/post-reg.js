// 게시물 등록 입력값 검증 함수
function validateFormValue() {
    // 이름입력태그, 제목 입력태그
    const titleVal = $('.title-input').val();
    const writerVal = $('.writer-input').val();
    console.log('t: ', titleVal);
    console.log('w: ', writerVal);

    let flag = false; // 입력 제대로하면 true로 변경 

    // 제목 값이 없는 경우 
        // $('.title-msg').removeClass('hide');
        // 강제 커서 이동
    // 작가 값이 없는 경우
        // $('.writer-msg').removeClass('hide');
        // 강제 커서 이동
    // 별점이 없는 경우, 숫자외의 글자가 들어간 경우
        // $('.star-msg').attr('value', 0);
    // 회차 구분이 안 들어간 경우
        //epId = 3, curEp = 0, totalEp = 100 고정
    
    if (titleVal.trim() === '') {
        $('.title-msg').removeClass('hide');
        
        
    }
    console.log('flag:', flag);
    return flag;
}

// 연속 스페이스바 막는 이벤트

// 썸네일 이미지 중복 업로드 막기(upload.js에서)
 
// 업로드 이미지 삭제하기



// 연재 상태 버튼 체크 함수
document.querySelector('.pub-btn-group').onclick = function() {
    const $radioGroup = document.getElementsByName('publishStatus');    
    
    for (let radio of $radioGroup) {
    
        if (radio.checked) {
            radio.parentElement.classList.add('checked');
        } else {
            radio.parentElement.classList.remove('checked');
        }       
    }    
}
// 회차 버튼 체크 함수
document.querySelector('.ep-btn-group').onclick = function() {
    const $radioGroup = document.getElementsByName('epId');

    for (let radio of $radioGroup) {
    
        if (radio.checked) {
            radio.parentElement.classList.add('checked');
        } else {
            radio.parentElement.classList.remove('checked');
        }       
    }
}


