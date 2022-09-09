// --------------- 전역변수 ----------------//

// 연관 포스트 토글 박스
const $postToggles = $('#link-post-wrap .toggle-box').children();

// 연관 포스트 목록(검색창, 목록 포함)
const $linkUl = document.getElementById('link-container');



// -------------------------- 연관 포스트 요청 관련 함수 --------------------------- //

// 연관포스트 목록을 요청하는 함수
function showLinklist(linkURL, postNo) {
    fetch(linkURL + '/' + postNo)
        .then(res => res.json())
        .then(linkMap => {
            makeLinkListDom(linkMap);
        })
}

// 연관포스트 해제(삭제)를 요청하는 함수
function disconnectLink(linkURL, linkId) {
    if (!confirm('연관 포스트 바로가기 링크를 삭제합니다')) return;
    fetch(linkURL + '/' + linkId, {
            method: 'DELETE'
        })
        .then(res => res.text())
        .then(msg => {
            if (msg === 'disconnect-success') {
                alert('삭제되었습니다.');
                showLinklist(); // 댓글 새로불러오기
            } else {
                alert('삭제에 실패했습니다.');
            }
        });
}



// 연관 포스트 목록 구성하기
function makeLinkListDom({
    linkList,
    linkSize
}) {
    //    console.log(linkList);
    //    console.log(linkSize);
    // ul 태그 비우기
    $linkUl.innerHTML = '';
    //    console.log(linkList === null || linkSize === 0);
    if (linkList === null || linkSize === 0) {
        // 검색창 만들기
        makeSearchLi();
    } else {
        // 연관 포스트가 있을 때 링크 목록 만들기
        let liTags = '';
        for (let link of linkList) {
            liTags += makeLinkLi(link);
        }
        $linkUl.innerHTML += liTags;
    }
}
//검색창이 존재하는지 확인하는 함수
function isSearchLi() {
    // 검색창이 존재하면 true, 없으면 false
    const flag = $linkUl.children[0].classList.contains('link-zero-box');
    console.log(flag + "(true - 검색창 있음, false - 검색창 없음")
    return flag;
}

// 포스트 검색창 만들기
function makeSearchLi() {
    // 검색창이 이미 있다면 새로 만들기 않음
    if (isSearchLi()) {
        return;
    }

    // 모두 감쌀 li
    const $linkZeroBox = document.createElement('li');
    $linkZeroBox.classList.add('link-zero-box');

    // 설명창
    const $searchMsg = document.createElement('div');
    $searchMsg.classList.add('search-msg');
    $searchMsg.innerHTML = '연관 포스트를 추가해 보세요. <br> 바로가기 링크가 생깁니다.';

    // 검색창을 감쌀 div
    const $searchWrap = document.createElement('div');
    $searchWrap.classList.add('search-wrap');
    let tag = '';


    tag += "<select class='form-select' id='linkSearchType'>" +
        "<option value='title' selected>제목</option>" +
        "<option value='writer'>작가</option>" +
        "</select>" +
        "<input class='form-control' list='datalistOptions' id='postSearchList' placeholder='포스트 제목 검색'>" +
        "<datalist id='datalistOptions'></datalist>" +
        "<button type='button' class='link-reg-btn btn btn-secondary'>저장</button>";

    $searchWrap.innerHTML = tag;

    // 어펜드
    $linkZeroBox.append($searchMsg);
    $linkZeroBox.append($searchWrap);
    $linkUl.prepend($linkZeroBox);

    // 검색창으로 커서 이동
    $('#postSearchList').focus();
}

// 연관포스트 li 태그
function makeLinkLi(l) {
    // 연재 주기(연재 / 연재주기 / 휴재/ 완결 중 선택)
    let cycle = '';
    if (l.publishStatus <= 1) {
        if (l.publishCycle.trim() === '') {
            cycle = l.publishStatusName;
        } else {
            cycle = l.publishCycle;
        }
    } else {
        cycle = l.publishStatusName;
    }

    // 진행도 퍼센트로
    let epPercent = Math.round(l.curEp / l.totalEp * 100)


    // 연관 포스트 내용
    let tag = '';
    tag += "<li>" +
        "<a class='link-a' href='/post/detail/" + l.postNo + "'>" +
        "<div class='link-percent' style='background-color:" + l.platformBgColor +
        "; color:" + l.platformFontColor + "'>" + epPercent + "%</div>" +
        "<div class='link-post-info'>" +
        "<div class='link-title'>" + l.postTitle + "</div>" +
        "<div class='link-writer'>" + l.postWriter + " | " + l.platformName +
        " - " + cycle + "</div>" +
        "</div>" +
        "<div class='link-post-date'>" +
        "<span class='link-date'>수정일</span>" +
        "<span class='link-date'>" + l.shortDate.postUpdateDate + "</span>" +
        "</div>" +
        "<i data-del-post-no='" + l.postNo + "' class='fas fa-times-circle link-remove-btn hide'></i>" +
        "</a>" +
        "</li>";

    return tag;
}

// 연관 포스트 수정 모드 진입하는 함수
function setLinkEditMod() {
    switchToggle($postToggles); // 아이콘 바꾸기
    // 잠금모드가 풀릴 때 > 검색창 생성
    if($postToggles[1].classList.contains('hide')){
        makeSearchLi() 
    }
    // 잠금모드가 잠길 때 > 검색창 삭제
     else if($postToggles[2].classList.contains('hide')){
        if ($linkUl.children.length > 1 && isSearchLi()) {
            $linkUl.children[0].remove();
        }
     }

    // 삭제 버튼 표시
    const $removeBtnList = $('.link-remove-btn');
    for (let $btn of $removeBtnList) {
        $btn.classList.toggle('hide')
    }
}


// 토글, 자물쇠 아이콘 스위치하는 함수
function switchToggle($toggleIcons) {
    $toggleIcons[0].classList.toggle('fff');
    $toggleIcons[1].classList.toggle('hide');
    $toggleIcons[2].classList.toggle('hide');
    $toggleIcons[3].classList.toggle('fff');
}




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
