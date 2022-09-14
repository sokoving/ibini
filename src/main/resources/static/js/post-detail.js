// --------------- 전역변수 ----------------//

// 연관 포스트 토글 박스
const $postToggles = $('#link-post-wrap .toggle-box').children();
// 연관 포스트 목록(검색창, 목록 포함)
const $linkUl = document.getElementById('link-container');
// 요청 URL
const linkURL = '/post/api/links';



// -------------------------- 연관 포스트 관련 함수 --------------------------- //
// --------- 랜더링 --------- //
// 연관포스트 목록을 요청하는 함수
function showLinklist(linkURL, postNo) {
    fetch(linkURL + '/' + postNo)
        .then(res => res.json())
        .then(linkMap => {
            makeLinkListDom(linkMap);
        })
}


// 연관 포스트 돔 초기화
function makeLinkListDom({
    linkList,
    linkSize
}) {
    // ul 태그 비우기
    $linkUl.innerHTML = '';

    // 편집모드일 때 
    if (isToggleOn()) {
        makeSearchLi(); // 검색창 만들기
        makeLinkLi(linkList, linkSize); // 목록 만들기
        toggleDelBtn(); // 삭제 버튼 보여주기
    }
    // 잠금모드일 때
    else {
        if (linkSize <= 0) {
            // 연관포스트가 없다면 
            makeSearchLi(); // 검색창 만들기
        } else {
            // 연관포스트가 있다면 
            makeLinkLi(linkList, linkSize); // 목록 만들기
        }
    }
} // end makeLinkListDom



// 포스트 검색창 만들기
function makeSearchLi() {
    // 검색창이 이미 있거나 잠금 모드라면 
    // 만들지 않음 새로 만들기 않음
    if (isSearchLi()) {
        return;
    }

    // 모두 감쌀 li
    const $linkZeroBox = document.createElement('li');
    $linkZeroBox.classList.add('link-zero-box');

    // 설명창
    const $searchMsg = document.createElement('div');
    $searchMsg.classList.add('search-msg');
    $searchMsg.innerHTML = '연관 포스트를 저장해 보세요. <br> 바로가기 링크가 생깁니다.';

    // 검색창을 감쌀 div
    const $searchWrap = document.createElement('div');
    $searchWrap.classList.add('search-wrap');
    let tag = '';

    tag += "<select class='form-select' id='linkSearchType'>" +
        "<option value='sTitle' selected>제목</option>" +
        "<option value='sWriter'>작가</option>" +
        "</select>" +
        "<input class='form-control' list='datalistOptions' id='postSearchList' placeholder='포스트를 검색해 링크를 추가해 보세요'>" +
        "<datalist id='datalistOptions'>" +
        "<option data-link-post-no='0' value='스페이스바를 누르면 등록된 포스트를 제외한 모든 포스트가 검색됩니다.'>" +
        "</datalist>" +
        "<button type='button' class='link-reg-btn btn btn-secondary'>저장</button>";

    $searchWrap.innerHTML = tag;

    // 어펜드
    $linkZeroBox.append($searchMsg);
    $linkZeroBox.append($searchWrap);
    $linkUl.prepend($linkZeroBox);
} // end makeSearchLi



// 연관포스트 li 태그 생성
function makeLinkLi(linkList, linkSize) {
    // 연관 포스트 목록이 없다면 안 만듦
    if (linkSize <= 0) {
        return;
    }

    // 있다면 linkList를 반복문 돌려서 문자열에 저장
    let liTags = '';
    for (let l of linkList) {

        // 연재 주기가 빈문자라면 연재 상태 띄우기
        let cycle = l.publishCycle === '' ? l.publishStatusName : l.publishCycle;
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
            "<i data-del-post-no='" + l.postNo +
            "' class='fas fa-times-circle link-remove-btn hide'></i>" +
            "</a>" +
            "</li>";

        liTags += tag;
    }
    // ul에 태그를 넣어 화면에 표시
    $linkUl.innerHTML += liTags;
} // end makeLinkLi


// 토글 아이콘, 자물쇠 아이콘 스위치하는 함수
function switchToggle($toggleIcons) {
    $toggleIcons[0].classList.toggle('fff');
    $toggleIcons[1].classList.toggle('hide');
    $toggleIcons[2].classList.toggle('hide');
    $toggleIcons[3].classList.toggle('fff');
}

// 삭제 버튼 스위치하는 함수
function toggleDelBtn() {
    const $removeBtnList = $('.link-remove-btn');
    for (let $btn of $removeBtnList) {
        $btn.classList.toggle('hide')
    }
}


// 포스트 검색 결과 datalist의 옵션으로 넣는 함수
function makeDatalist(searchList, keyword) {
    // 포스트 검생창 데이터리스트 노드
    const $searchDatalist = document.getElementById('datalistOptions');
    const len = searchList.length;

    // 데이터리스트 노드의 innterHTML 저장할 변수
    let tag = '';

    // 검색 결과가 없으면 없다고 하기
    if (len <= 0) {
        tag = "<option data-link-post-no='0' value='" + keyword + "'> 검색 결과가 없습니다."
    }
    // 검색 결과 있으면 찾은 거 옵션에 넣어주기
    else {
        for (let s of searchList) {
            tag += "<option data-link-post-no='" + s.postNo +
                "' value='" + s.postTitle + "'> " +
                s.platformName + " | " + s.postWriter
        }
    }

    // 데이터리스트에 태그 넣기
    $searchDatalist.innerHTML = tag;
}

// --------- 연관 포스트 등록, 삭제 관련 함수 --------- // 
// linkPostNo 만들어서 connectPost로 넘기는 함수
function makeLinkPostNo(postNo) {
    let linkPostNo = -1;

    // 작가로 검색했을 때
    if ($('#linkSearchType').val() === 'sWriter') {
        // 새로 검색 요청 보내기
        const keyword = $('#postSearchList').val();
        const url = linkURL + '/searchPost?rootPostNo=' + postNo + "&sTitle=" + keyword;
        fetch(url)
            .then(res => res.json())
            .then(searchList => {
                // 검색 결과가 있다면 키워드와 일치하는 제목의 포스트 번호로 등록 요청 보내기
                if (searchList.length > 0) {
                    for (let s of searchList) {
                        if (s.postTitle === keyword) {
                            linkPostNo = s.postNo;
                            break;
                        }
                    }
                }
                if (linkPostNo > 0) {
                    connectPost(postNo, linkPostNo);
                } else {
                    alert("존재하지 않는 포스트입니다. ");
                    return;
                }
            })
    }
    // 제목으로 검색했을 때
    else {
        linkPostNo = changeTitleToNum();
        if (linkPostNo > 0) {
            connectPost(postNo, linkPostNo);
        } else {
            alert("존재하지 않는 포스트입니다. ");
            return;
        }
    }
}

// 검색창에 입력한 포스트 제목을 포스트 번호로 바꿔 리턴하는 함수
// 0 이하의 수를 리턴하면 없는 포스트
function changeTitleToNum() {
    let linkPostNo = -1;

    // 인풋 입력값(포스트 제목)
    const inputValue = $('#postSearchList').val();
    // console.log(inputValue);
    const $options = $('datalist[id=datalistOptions]').children()
    for (let i = 0; i < $options.length; i++) {
        if (inputValue === $options[i].value) {
            return $options[i].dataset.linkPostNo
        }
    }
    return linkPostNo;
}

// 연관 포스트 등록 요청하는 함수
function connectPost(rootPostNo, linkPostNo) {
    fetch(linkURL, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                "rootPostNo": rootPostNo,
                "linkPostNo": linkPostNo
            })
        })
        .then(res => res.text())
        .then(msg => {
            if (msg === 'connect-success') {
                showLinklist(linkURL, rootPostNo);
                const flag = confirm('연관 포스트가 등록되었습니다. \n연관 포스트 섹션 편집을 계속하시겠습니까?');
                if (flag) {
                    // 잠금모드라면 풀기
                    if (!isToggleOn()) {
                        setLinkEditMod();
                    }
                } else {
                    // 편집모드라면 잠그기
                    if (isToggleOn()) {
                        setLinkEditMod();
                    }
                }
            } else {
                alert('연관 포스트 등록에 실패했습니다.');
            }
        })
}

function sendLinkDelete(e, postNo) {
    // 다시 확인받기
    const title = e.target.previousElementSibling.previousElementSibling
        .firstElementChild.textContent;
    const flag = confirm("[" + title + "] 바로가기 링크를 삭제하시겠습니까?");
    if (!flag) {
        return;
    }

    // linkId 구하기
    const linkPostNo = e.target.dataset.delPostNo;
    const linkId = postNo + "_" + linkPostNo;

    // 삭제 요청 보내기
    fetch(linkURL + "/" + linkId, {
            method: 'DELETE'
        })
        .then(res => res.text())
        .then(msg => {
            if (msg === 'disconnect-success') {
                alert("연관 포스트가 삭제되었습니다.");
                showLinklist(linkURL, postNo);
            } else if (msg === 'disconnect-fail') {
                alert("연관 포스트 삭제에 실패하였습니다.");
            }
        })
}



//--------- 연관 포스트 공용 함수---------//

//검색창이 존재하는지 확인하는 함수
function isSearchLi() {
    // 검색창이 존재하면 true, 없으면 false
    const flag = $linkUl.children.length > 0 && $linkUl.firstElementChild.classList.contains('link-zero-box');
    // console.log(flag + "(searchLi flag : true - 검색창 있음, false - 검색창 없음)");
    return flag;
}

// 잠금모드면 false, 편집모드면 true
function isToggleOn() {
    const flag = $postToggles[1].classList.contains('hide');
    // console.log(flag + "(toggle flag : true -편집모드 열려 있음, false - 잠금모드 열려 있음");
    return flag;
}

// -------------------------- 수정, 삭제, 목록 버튼 ------------------------------------------ //

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


// ----------------- 해시태그 입력 관련 함수 -----------------//
// 해시태그가 #으로 시작하지 않으면 # 넣어주기
function checkKeyup(e) {
    let fullValue = e.target.value;
    let lastValue = fullValue.charAt(fullValue.length - 1);
    // console.log("f : " + fullValue);
    // console.log("l : " + lastValue);
    if (fullValue.length > 0 && fullValue.charAt(0) !== '#') {
        $('#hashtagInput').val('#' + fullValue);
    }
}


// 해시태그 공백으로 시작, 공백 반복 입력 막기
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
}