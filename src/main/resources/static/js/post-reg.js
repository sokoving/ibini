// 입력하지 않은 값 처리 함수
function validateFormValue(e) {
    const $title = $('input[name=postTitle]');
    // console.log('title: ', $title.val());
    const $writer = $('input[name=postWriter]');
    // console.log('writer: ', $writer.val());
    const $star = $('input[name=starRate]');
    // console.log('star: ', $star.val());
    // console.log('platform: ', $('select[name=platformId]').val());
    const $genre = $('select[name=genreId]').val();
    // console.log('genre: ', $('select[name=genreId]').val());
    // console.log('publishStatus: ', $('input[name=publishStatus]').val());
    // console.log('publishCycle: ', $('input[name=publishCycle]').val());
    const $epId = $('input[name=epId]');
    console.log('epId: ', $epId.val());
    const $curEp = $('input[name=curEp]');
    console.log('curEp: ', $curEp.val());
    const $totalEp = $('input[name=totalEp]');
    console.log('totalEp: ', $totalEp.val());
    // console.log('tag: ', $('input[name=tagName]').val());

    let flag = false; // 입력 제대로하면 true로 변경 


    // 제목 값이 없는 경우 
    if ($title.val().trim() === '') {
        $('.title-msg').text('[ 제목을 입력해 주세요 ]');
        $('.title-msg').css('color', '#f44659');
        $title.focus();
    }
    // 작가 값이 없는 경우
    else if ($writer.val().trim() === '') {
        $('.writer-msg').text('[ 작가를 입력해 주세요 ]');
        $('.writer-msg').css('color', '#f44659');
        $writer.focus();
    }
    // 별점 값이 없는 경우,
    if ($star.val().trim() === '') {
        $star.val(0);
    }
    // 회차 값이 둘 다 없을 경우
    if($curEp.val() === '' || $totalEp === ''){
        // $epId.val(3)
        $curEp.val(0);
        $totalEp.val(100);
    }


    // // 회차 구분이 안 들어간 경우
    // //epId = 3, curEp = 0, totalEp = 100 고정
    // } else if() {

    // } 

    console.log('flag:', flag);
    return flag;
}

// 연속 스페이스바 막는 이벤트

// 썸네일 이미지 중복 업로드 막기(upload.js에서)

// 업로드 이미지 삭제하기



// 연재 상태 버튼 체크 함수
document.querySelector('.pub-btn-group').onclick = function () {
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
document.querySelector('.ep-btn-group').onclick = function () {
    const $radioGroup = document.getElementsByName('epId');
    const $curEp = $('input[name=curEp]');
    const $totalEp = $('input[name=totalEp]');
    for (let radio of $radioGroup) {

        if (radio.checked) {
            radio.parentElement.classList.add('checked');

            // 회차 버튼 아래 텍스트 변경
            let epName = radio.previousElementSibling.textContent;
            if (epName !== '퍼센트(%)') {
                $curEp.prev().text('현재 ' + epName);
                $totalEp.prev().text('전체 ' + epName);
                if ($totalEp.attr('readonly') === 'readonly') {
                    $totalEp.removeAttr('readonly');
                    $totalEp.val('');
                    $curEp.attr('placeholder', '0~99999 사이 숫자')
                }
            } else {
                $curEp.prev().text('현재 진행도(%)');
                $curEp.attr('placeholder', '0~100 사이 숫자')
                $totalEp.prev().text('전체 진행도(%)');
                $totalEp.val(100);
                $totalEp.attr('readonly', 'readonly')
            }
        } else {
            radio.parentElement.classList.remove('checked');
        }
    }
}