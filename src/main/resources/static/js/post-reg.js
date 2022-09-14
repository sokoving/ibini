// -------------- 전역변수 -------------- //
const $title = $('input[name=postTitle]');
const $writer = $('input[name=postWriter]');
const $star = $('input[name=starRate]');
const $genre = $('select[name=genreId]');
const $cycle = $('input[name=publishCycle]')
const $epId = $('input[name=epId]');
const $curEp = $('input[name=curEp]');
const $totalEp = $('input[name=totalEp]');
const $tag = $('input[name=tagName]')

// 제목 중복 체크용 플래그(키업 이벤트로 중복이면 false로 변경)
let checkTitle = true;

// --------- 함수 정의부 ---------- //

// 키다운 이벤트 처리 함수
function checkKeydown(e) {
    const keyCode = e.keyCode;
    const target = e.target;
    // console.log(keyCode);
    // 엔터로 서브밋되는 거 막기
    if (e.keyCode === 13) {
        e.preventDefault();
    }

    // 공백으로 시작, 공백 반복 입력 막기
    let fullValue = target.value;
    let lastValue = fullValue.charAt(fullValue.length - 1);
    //    console.log("f : " + fullValue);
    //    console.log("l : " + lastValue);
    if (fullValue === '' || lastValue === ' ') {
        if (keyCode === 32) {
            return false;
        }
    }

    // 정상 입력 중에 띄울 안내 메시지
    switch (target.name) {
        case 'tagName':
            $('#reg-5 .explain-span').text('[ 각 해시태그는 #를 기준으로 구별됩니다. ]');
            $('#reg-5 .explain-span').css('color', '#555');
            break;
        case 'postTitle':
        case 'postWriter':
        case 'starRate':
            let $msg = e.target.previousElementSibling.children[1];
            $msg.textContent = '';
            break;
        case 'totalEp':
        case 'curEp':
            let $epMsg = $('#reg-4 .explain-span');
            $epMsg.text('');
            break;
        default:
            break;
    }
}

function checkKeyup(e, postNo=0) {
    // 해시태그가 #으로 시작하지 않으면 # 넣어주기
    if (e.target.name === 'tagName') {
        let fullValue = e.target.value;
        let lastValue = fullValue.charAt(fullValue.length - 1);
        // console.log("f : " + fullValue);
        // console.log("l : " + lastValue);
        if (fullValue.length > 0 && fullValue.charAt(0) !== '#') {
            $tag.val('#' + fullValue);
        }
    }
    // 제목이 중복이면 메세지 띄워주기
    else if (e.target.name === 'postTitle') {
        console.log("제목 검증중");
        const checkTitleUrl = '/post/api/check?type=title&value=' + $title.val() + '&postNo=' + postNo;
        console.log(checkTitleUrl);
        fetch(checkTitleUrl)
            .then(res => res.text())
            .then(flag => {
                console.log('flag:', flag);
                if (flag === 'true') {
                    //  제목이 중복인 경우
                    $('.title-msg').text('[ 포스트 제목은 중복을 피해주세요 ]');
                    $('.title-msg').css('color', '#f44659');
                    checkTitle = false;
                } else {
                    // 정상적으로 입력하고 중복이 아닌 경우
                    checkTitle = true;
                }
            });
    }

}



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
    } else {
        $('.writer-msg').text('');
    }

    // 제목 값이 없는 경우 
    if ($title.val().trim() === '') {
        $('.title-msg').text('[ 제목을 입력해 주세요 ]');
        $('.title-msg').css('color', '#f44659');
        $title.focus();
        flag = false;
    }
    // 제목값이 있는데 중복인 경우
    else if (!checkTitle) {
        $title.focus();
        flag = false;
    } else {
        // 정상일 때는 msg 비워주기
        $('.title-msg').text('');
    }

    // 별점 값이 없는 경우,
    if ($star.val().trim() === '') {
        $star.val(0);
        $('.star-msg').text('[ 기본값으로 세팅됐습니다. ]');
        $('.star-msg').css('color', '#005666');
        flag = false;
    } else if ($star.val() < 0 || $star.val() > 9) {
        $('.star-msg').text('[ 1~9 사이의 숫자를 입력해 주세요 ]');
        $('.star-msg').css('color', '#005666');
    } else {
        $('.star-msg').text('');
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
        $('#reg-4 .ep-msg').text('[ 기본값으로 세팅됐습니다. ]');
        $('#reg-4 .ep-msg').css('color', '#005666');

    } // 회차 값이 둘 중 하나만 없을 경우
    else if ($curEp.val() === '') {
        $curEp.val($totalEp.val());
        $('#reg-4 .ep-msg').text('[ 기본값으로 세팅됐습니다. ]');
        $('#reg-4 .ep-msg').css('color', '#005666');
    } else if ($totalEp.val() === '') {
        if ($curEp.val() > 0) {
            $totalEp.val($curEp.val());
        } else {
            $totalEp.val(1);
        }
        $('.ep-msg').text('[ 기본값으로 세팅됐습니다. ]');
        $('.ep-msg').css('color', '#005666');
    }

    // 현재 회차가 전체 회차보다 클 때
    else if (+$curEp.val() > +$totalEp.val()) {
        $('.ep-msg').text('[ 현재회차는 전체회차보다 클 수 없습니다. ]');
        $('.ep-msg').css('color', '#f44659');
        $curEp.focus();
        flag = false;
    }
    // 전체 회차가 0일 때
    else if ($totalEp.val() == 0) {
        $('.ep-msg').text('[ 전체회차는 0보다 커야 합니다. ]');
        $('.ep-msg').css('color', '#f44659');
        $totalEp.val(1)
        $totalEp.focus();
        flag = false;
    } else {
        $('.ep-msg').text('');
    }

    console.log('flag:', flag);
    return flag;
}


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


//-------------------modi---------------//

// 불러온 연재, 회차 아이디 넣으면 checked 체크하는 함수
function setModiRadio(pubId, epId) {
    const $pubList = $('input[name=publishStatus]');
    // console.log("pubId : " + pubId);
    for (let i = 0; i < $pubList.length; i++) {
        if (pubId === $pubList[i].value) {
            // console.log($pubList[i]);
            $pubList[i].setAttribute('checked', 'true');
            $pubList[i].parentElement.classList.add('checked');
        }
    }

    const $epList = $('input[name=epId]');
    for (let i = 0; i < $epList.length; i++) {
        if (epId === $epList[i].value) {
            // console.log($epList[i]);
            $epList[i].setAttribute('checked', 'true');
            $epList[i].parentElement.classList.add('checked');
        }
    }
}