// --------------- 전역변수 ----------------//

// 연관 포스트 토글 박스
const $postToggles = $('#link-post-wrap .toggle-box').children();

// 연관 포스트 목록 구성하기
function makeLinkListDom({
    linkList,
    linkSize
}) {
    const $linkUl = document.getElementById('link-container');

    $linkUl.innerHTML = '';
    // 연관 포스트가 없을 때
    if (linkList === null || linkSize === 0) {
        $linkUl.innerHTML += '<li class="link-zero-box"><div class="link-zero-1">등록된 연관 포스트가 없습니다.</div><div class="link-zero-2">위 토글 버튼을 눌러 새 포스트를 추가해 보세요</div></li>';
    } else {
        // 연관 포스트가 있을 때
        for (let link of linkList) {
            $linkUl.innerHTML += appendLinkHTML(link);
        }
    }
}

// 연관포스트 li 내용
function appendLinkHTML(l) {
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
    let linkHTML = '';
    linkHTML += '<li>';
    linkHTML += '<a class="link-a" href="#">';
    linkHTML += '<div class="link-ca">' + l.caName + '</div>';
    linkHTML += '<div class="link-post-info">';
    linkHTML += '<div class="link-title">' + l.postTitle + '</div>';
    linkHTML += '<div class="link-writer">' + l.postWriter + ' | <span>' + l.platformName +
        '</span> <span>' + cycle + '</span></div>';
    linkHTML += '</div>';
    linkHTML += '<div class="link-post-date">';
    linkHTML += '<span class="link-percent">' + epPercent + '%</span>';
    linkHTML += '<span class="link-date">' + l.shortDate.postUpdateDate + '</span>';
    linkHTML += '</div>';
    linkHTML += '<i data-del-post-no="' + l.postNo +
        '" class="fas fa-times-circle link-remove-btn hide"></i>';
    linkHTML += '</a>';
    linkHTML += '</li>';

    return linkHTML;
}


// 토글, 자물쇠 아이콘 스위치하는 함수
function switchToggle($toggleIcons) {
    $toggleIcons[0].classList.toggle('fff');
    $toggleIcons[1].classList.toggle('hide');
    $toggleIcons[2].classList.toggle('hide');
    $toggleIcons[3].classList.toggle('fff');
}

function setLinkEditMod() {
    switchToggle($postToggles); // 아이콘 바꾸기
    $('.search-wrap').toggleClass('hide') // 검색창 표시
    const $removeBtnList = $('.link-remove-btn');
    for (let $btn of $removeBtnList) {
        $btn.classList.toggle('hide')
    }
}




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


// 연관포스트 목록을 보여주는 함수
function showLinklist(linkURL, postNo) {
    fetch(linkURL + '/' + postNo)
        .then(res => res.json())
        .then(linkMap => {
            makeLinkListDom(linkMap);
        })
}