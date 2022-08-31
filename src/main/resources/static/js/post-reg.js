// -------------- 전역변수 -------------- //
const $title = $('input[name=postTitle]');
const $writer = $('input[name=postWriter]');
const $star = $('input[name=starRate]');
const $genre = $('select[name=genreId]');
const $cycle = $('input[name=publishCycle]')
const $epId = $('input[name=epId]');
const $curEp = $('input[name=curEp]');
const $totalEp = $('input[name=totalEp]');
const tag = $('input[name=tagName]')

// --------- 함수 정의부 ---------- //





// 입력하지 않았거나 잘못 입력한 값 처리 함수
function validateFormValue() {
    // console.log('title: ', $title.val());
    // console.log('writer: ', $writer.val());
    // console.log('star: ', $star.val());
    // console.log('platform: ', $('select[name=platformId]').val());
    // console.log('genre: ', $('select[name=genreId]').val());
    console.log('publishStatus: ', $('input[name=publishStatus]').val());
    // console.log('publishCycle: ', $('input[name=publishCycle]').val());
    console.log('epId: ', $epId.val());
    console.log('curEp: ', $curEp.val());
    console.log('totalEp: ', $totalEp.val());
    console.log('tag: ', $('input[name=tagName]').val());

    let flag = true; // 입력 제대로 안 하면 false로 변경

    // 작가 값이 없는 경우
    if ($writer.val().trim() === '') {
        $('.writer-msg').text('[ 작가를 입력해 주세요 ]');
        $('.writer-msg').css('color', '#f44659');
        $writer.focus();
        flag = false;
    }

    // 제목 값이 없는 경우 
    if ($title.val().trim() === '') {
        $('.title-msg').text('[ 제목을 입력해 주세요 ]');
        $('.title-msg').css('color', '#f44659');
        $title.focus();
        flag = false;
    }

    // 별점 값이 없는 경우,
    if ($star.val().trim() === '') {
        $star.val(0);
        $('.star-msg').text('[ 기본값으로 세팅됐습니다. ]');
        $('.star-msg').css('color', '#005666');
        flag = false;
    }


    // 회차 값이 둘 다 없을 경우
    if ($curEp.val() === '' && $totalEp.val() === '') {
        const $radioGroup = document.getElementsByName('epId');
        for (let radio of $radioGroup) {
            if (radio.checked) {
                radio.parentElement.classList.remove('checked');
                radio.setAttribute("checked", false);
            }
            if (radio.value == 3) {
                radio.parentElement.classList.add('checked');
                radio.setAttribute("checked", true);
                $curEp.prev().text('현재 진행도(%)');
                $curEp.attr('placeholder', '0~100 사이 숫자')
                $curEp.val(0);
                $totalEp.prev().text('전체 진행도(%)');
                $totalEp.val(100);
                $totalEp.attr('readonly', 'readonly')
            }
        }
        $('.ep-msg').text('[ 기본값으로 세팅됐습니다. ]');
        $('.ep-msg').css('color', '#005666');

    } // 회차 값이 둘 중 하나만 없을 경우
    else if ($curEp.val() === '') {
        $curEp.val($totalEp.val());
        $('.ep-msg').text('[ 기본값으로 세팅됐습니다. ]');
        $('.ep-msg').css('color', '#005666');
    }
    else if($totalEp.val() === ''){
        if($curEp.val() > 0){
            $totalEp.val($curEp.val());
        } else {
            $totalEp.val(1);
        }
        $('.ep-msg').text('[ 기본값으로 세팅됐습니다. ]');
        $('.ep-msg').css('color', '#005666');
    }

    // 현재 회차가 전체 회차보다 클 때
    else if(+$curEp.val() > +$totalEp.val()){
        $('.ep-msg').text('[ 현재회차는 전체회차보다 클 수 없습니다. ]');
        $('.ep-msg').css('color', '#f44659');
        $curEp.focus();
        flag = false;
    }
    // 전체 회차가 0일 때
    else if($totalEp.val() == 0){
        $('.ep-msg').text('[ 전체회차는 0보다 커야 합니다. ]');
        $('.ep-msg').css('color', '#f44659');
        $totalEp.val(1)
        $totalEp.focus();
        flag = false;
    }

    console.log('flag:', flag);
    return flag;
}

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
    // 기존에 메시지 있으면 지우기
    $('.ep-msg').text('');

    const $radioGroup = document.getElementsByName('epId');
    for (let radio of $radioGroup) {

        if (radio.checked) {
            radio.parentElement.classList.add('checked');
            radio.setAttribute("checked", true);

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
            radio.setAttribute("checked", false);
        }
    }
}