<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- linear icons -->
    <!-- https://linearicons.com/free#cdn -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- Bootstrap icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />

    <!-- post-note CSS -->
    <link rel="stylesheet" href="/css/post-note.css">
</head>

<body>
    <!-- MARK/MEMO 영역 도입부 -->
    <div id="postnote">

        <!-- MARK / MEMO 탭 버튼 영역 -->
        <div class="title-wrapper flex">
            <div class="half selected" name="mark" onclick="btnTitle_onclick(this)">MARK</div>
            <div class="half" name="memo" onclick="btnTitle_onclick(this)">MEMO</div>
        </div>

        <!-- MARK / MEMO 데이터 입력 영역 -->
        <div class="submit-wrapper">
            <div name="mark">
                <div class="episode-no">
                    <label for="episode-no">회차
                        <!-- <input type="number" id="episode-no" name="episodeNo" min="1" max="9999999999" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -->
                        <input type="text" id="episode-no" name="episodeNo" maxlength="10" autocomplete="off" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                    </label>
                </div>
                <div class="text-area">
                    <textarea id="mark-content" class="w100" cols="20" rows="5" maxlength="300" placeholder="새로운 글을 입력해 주세요." onkeyup="textArea_onkeyup_down(this)" onkeydown="textArea_onkeyup_down(this)" spellcheck="false"></textarea>
                </div>
                <div class="submit-area">
                    <div class="info">
                        <span class="text-length">0/300</span>
                    </div>
                    <div class="button">
                        <button type="button" name="mark" onclick="btnAdd_onclick(this)">등록</button>
                    </div>
                </div>
            </div>
            <div class="hidden" name="memo">
                <div class="text-area">
                    <textarea id="memo-content" class="w100" cols="20" rows="5" maxlength="300" placeholder="새로운 글을 입력해 주세요." onkeyup="textArea_onkeyup_down(this)" onkeydown="textArea_onkeyup_down(this)" spellcheck="false"></textarea>
                </div>
                <div class="submit-area">
                    <div class="info">
                        <span class="text-length">0/300</span>
                    </div>
                    <div class="button">
                        <button type="button" name="memo" onclick="btnAdd_onclick(this)">등록</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- MARK/MEMO 아코디언 영역 -->
        <div class="accodian-wrapper">
            <div class="accodian-button"><span>MARK LIST</span></div>
            <div class="accodian-button hidden"><span>MEMO LIST</span></div>
        </div>
        <!-- MARK/MEMO 데이터 목록 영역 -->
        <div class="content-wrapper">
            <div name="mark">
                <!-- <div class="content-area">
                    <div class="flex-sb">
                        <div>
                            <i class="marking-type1 noselect">121</i>
                            |
                            <span class="noselect">2022.08.15 13:22:34</span>
                        </div>
                        <div class="button-area">
                            <ion-icon name="create-outline" class="button" onclick="btnModify_onclick(this)"></ion-icon>
                            <ion-icon name="trash-outline" class="button" onclick="btnDelete_onclick(this)"></ion-icon>
                        </div>
                    </div>
                    <div class="content">
                        mark Content1
                    </div>
                </div> -->
            </div>
            <div class="hidden" name="memo">
                <!-- <div class="content-area">
                    <div class="flex-sb">
                        <div>
                            <span class="noselect memo-datetime">2022.08.15 13:22:34</span>
                        </div>
                        <div class="button-area">
                            <ion-icon name="create-outline" class="button" onclick="btnModify_onclick(this)"></ion-icon>
                            <ion-icon name="trash-outline" class="button" onclick="btnDelete_onclick(this)"></ion-icon>
                        </div>
                    </div>
                    <div class="content">
                        memo Content1
                    </div>
                </div> -->
            </div>
        </div>
    </div>

    <script>
        // 마크 요청 URL
        const markURL = '/post/detail/test/mark';
        // const episodeNo = 1;
        const account = '2209050001';
        
        // 메모 요청 URL
        const memoURL = '/post/detail/test/memo';
        const postNo = 1; 

        /*======================================================================
            이벤트 영역
        ========================================================================*/
        // 탭 버튼 onclick Event
        function btnTitle_onclick($eventTag) {
            console.log($eventTag);

            const fireEvent = !$eventTag.classList.contains('selected');
            if(fireEvent) toggleSelected($eventTag);
        }

        // 등록 버튼 onclick Event
        function btnAdd_onclick($eventTag) {
            if ($eventTag.getAttribute('name') == 'memo') {
                const $memoContent = document.getElementById('memo-content');
                
                if (!validateMemoContent()) {
                    return;
                }

                fetch(memoURL, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            "postNo": postNo,
                            "content": $memoContent.value,
                            "account": account
                        })
                    }) 
                    .then(response => response.text())
                    .then(message => {
                        if (message === 'insert-success') {
                            alert('메모 등록!');

                            $memoContent.value = '';
                            $eventTag.parentElement.parentElement.querySelector('.text-length').textContent = 0 + '/' + document.getElementById('memo-content').getAttribute('maxlength');

                            showMemoList();

                        } else {
                            alert('메모 등록 실패!');
                        }
                })
                
            } else {
                const $episodeNo = document.getElementById('episode-no');
                const $markContent = document.getElementById('mark-content');
                
                if (!validateMarkEpAndContent()) {
                    return;
                }
                
                fetch(markURL, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            "postNo": postNo,
                            "episodeNo": $episodeNo.value,
                            "content": $markContent.value,
                            "account": account
                        })
                    }) 
                    .then(response => response.text())
                    .then(message => {

                        if (message === 'insert-success') {
                            alert('마크 등록!');

                            $episodeNo.value = '';
                            $markContent.value = '';
                            $eventTag.parentElement.parentElement.querySelector('.text-length').textContent = 0 + '/' + document.getElementById('mark-content').getAttribute('maxlength');

                            showMarkList();

                        } else {
                            alert('마크 등록 실패!');
                        }
                })
            }
        }

        // 수정 버튼 onclick event
        function btnModify_onclick($eventTag) {
            if ($eventTag.parentElement.parentElement.parentElement.parentElement.getAttribute('name') == 'memo') {
                const $memoContent = $eventTag.parentElement.parentElement.parentElement.querySelector('.content');
                
                // 버튼 모드 switching
                toggleMemoMode($memoContent);

            } else {
                const $markContent = $eventTag.parentElement.parentElement.parentElement.querySelector('.content');
                
                // 버튼 모드 switching
                toggleMarkMode($markContent);
            }
            
        }

        // 수정 취소 버튼 onclick event 
        function btnCancle_onclick($eventTag) {
            if ($eventTag.parentElement.parentElement.parentElement.parentElement.getAttribute('name') == 'memo') {
                const $memoContent = $eventTag.parentElement.parentElement.parentElement.querySelector('.content');
                
                // 취소 버튼 클릭 시, 원래 데이터로 되돌리기
                $memoContent.value = $memoContent.getAttribute('data-initvalue');

                // 버튼 모드 switching
                toggleMemoMode($memoContent);

            } else {
                const $markContent = $eventTag.parentElement.parentElement.parentElement.querySelector('.content');

                // 취소 버튼 클릭 시, 원래 데이터로 되돌리기
                $markContent.value = $markContent.getAttribute('data-initvalue');
                
                // 버튼 모드 switching
                toggleMarkMode($markContent);
            }
        }


        // 수정 저장 버튼 onclick Event
        function btnModifySave_onclick($eventTag) {
            if ($eventTag.parentElement.parentElement.parentElement.parentElement.getAttribute('name') == 'memo'){
                const memoNo = $eventTag.parentElement.parentElement.parentElement.getAttribute('data-memo-no');
                const $memoContent = $eventTag.parentElement.parentElement.parentElement.querySelector('.content');            

                if (!validateMemoContent_modify($eventTag)) {
                    return;
                }

                fetch(memoURL + '/' + memoNo, {
                        method: "PUT",
                        headers: {
                            "Content-Type": "application/json"
                        }, 
                        body: JSON.stringify({
                            "memoNo": memoNo,
                            "content": $memoContent.value
                        })
                    })
                    .then(response => response.text())
                    .then(message => {
                        if (message === 'modify-success') {
                            alert('메모 수정!');
                            showMemoList();                           

                        } else {
                            alert('메모 수정 실패!');
                        }
                })

            } else {
                const markNo = $eventTag.parentElement.parentElement.parentElement.getAttribute('data-mark-no');
                const $markContent = $eventTag.parentElement.parentElement.parentElement.querySelector('.content');
                
                if (!validateMarkEpAndContent_modify($eventTag)) {
                    return;
                }

                fetch(markURL + '/' + markNo, {
                        method: "PUT",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            "markNo": markNo,
                            "content": $markContent.value
                        })
                    })
                    .then(response => response.text())
                    .then(message => {
                        if (message === 'modify-success') {
                            alert('마크 수정!');
                            showMarkList();

                        } else {
                            alert('마크 수정 실패!');
                        }
                })                
            }          
        }

        // 삭제 버튼 onclick Event
        function btnDelete_onclick($eventTag) {
            if ($eventTag.parentElement.parentElement.parentElement.parentElement.getAttribute('name') == 'memo') {
                const memoNo = $eventTag.parentElement.parentElement.parentElement.getAttribute('data-memo-no');

                fetch(memoURL + '/' + memoNo, {method : 'DELETE'})
                    .then(response => response.text())
                    .then(message => {
                        if (message === 'delete-success') {
                            alert('메모 삭제!');
                            showMemoList();

                        } else {
                            alert('메모 삭제 실패!');
                        }
                });

            } else {
                const markNo = $eventTag.parentElement.parentElement.parentElement.getAttribute('data-mark-no');

                fetch(markURL + '/' + markNo, {method : 'DELETE'})
                    .then(response => response.text())
                    .then(message => {
                        if (message === 'delete-success') {
                            alert('마크 삭제!');
                            showMarkList();

                        } else {
                            alert('마크 삭제 실패!');
                        }
                });
            }
        }

        // textArea onkeyup onkeydown Event
        function textArea_onkeyup_down($eventTag) {
            $eventTag.parentElement.parentElement.querySelector('.text-length').textContent = $eventTag.textLength + '/' + $eventTag.getAttribute('maxlength');
        }


        /*======================================================================
            함수 영역
        ========================================================================*/
        // MARK or MEMO 선택처리
        function toggleSelected($eventTag) {
            // selected 클래스 toggle 처리
            toggleSelectedClass($eventTag);

            // hidden 클래스 toggle 처리
            toggleHiddenClass($eventTag);
        }

        // selected 클래스 toggle 처리
        function toggleSelectedClass($eventTag) {
            const $titles = [...document.querySelector('#postnote .title-wrapper').children];
            $titles.forEach($title => $title.classList.toggle('selected'));
        }

        // selected 클래스 toggle 처리
        function toggleHiddenClass($eventTag) {
            const name = $eventTag.getAttribute('name');

            // 데이터 입력 영역
            const $submits = [...document.querySelector('#postnote .submit-wrapper').children];
            $submits.forEach($submit => $submit.classList.toggle('hidden'));
            
            // 아코디언 영역
            const $accodians = [...document.querySelector('#postnote .accodian-wrapper').children];
            $accodians.forEach($accodian => $accodian.classList.toggle('hidden'));
            
            // 데이터 목록 영역
            const $contents = [...document.querySelector('#postnote .content-wrapper').children];
            $contents.forEach($content => $content.classList.toggle('hidden'));
        }

        // datetime 포맷 변환 함수
        function formatDateTime(datetime) {
            // 문자열 날짜 데이터를 날짜객체로 변환
            const today = new Date(datetime);

            let year = today.getFullYear();
            let month = today.getMonth() + 1;
            let day = today.getDate();
            let hour = today.getHours();
            let minute = today.getMinutes();

            // 오전, 오후 시간체크
            let ampm = '';
            if (hour < 12 && hour >= 0) {
                ampm = 'AM';

            } else if (hour >= 12 && hour < 24) {
                ampm = 'PM';

                if (hour !== 12) {
                    hour -= 12;                    
                }
            } 

            // 숫자가 1자리일 경우 2자리로 변환
            (month < 10) ? month = '0' + month : month;
            (day < 10) ? day = '0' + day : day;
            (hour < 10) ? hour = '0' + hour : hour;
            (minute < 10) ? minute = '0' + minute : minute;

            return year + "." + month + "." + day + "  " + ampm + hour + ":" + minute;
        }

        // 마크 episodeNo, content 등록 할 때 필수값 체크 method
        function validateMarkEpAndContent() {
            const $episodeNo = document.getElementById('episode-no');
            const $markContent = document.getElementById('mark-content');

            let flag = false;
            if ($episodeNo.value.trim() === '') {
                alert('회차는 필수 입력값입니다');

            } else if ($markContent.value.trim() === '') {
                alert('내용은 필수 입력값입니다');

            } else {
                flag = true;

            }
            return flag;
        }
        
        // 메모 content 등록 할 때 필수값 체크 method
        function validateMemoContent() {
            const $memoContent = document.getElementById('memo-content');

            let flag = false;
            if ($memoContent.value.trim() === '') {
                alert('내용은 필수 입력값입니다');

            } else {
                flag = true;

            }
            return flag;
        }

        // 마크 content 수정 할 때 필수값 체크 method
        function validateMarkEpAndContent_modify($eventTag) {
            const $markContent = $eventTag.parentElement.parentElement.parentElement.querySelector('.content');  

            let flag = false;
            if ($markContent.value.trim() === '') {
                alert('내용은 필수 입력값입니다');

            } else {
                flag = true;

            }
            return flag;
        }

        // 메모 content 수정 할 때 필수값 체크 method
        function validateMemoContent_modify($eventTag) {
            const $memoContent = $eventTag.parentElement.parentElement.parentElement.querySelector('.content'); 

            let flag = false;
            if ($memoContent.value.trim() === '') {
                alert('내용은 필수 입력값입니다');

            } else {
                flag = true;

            }
            return flag;
        }


        /*======================================================================
            마크, 메모 리스트 영역
        ========================================================================*/
        // ==================== 메모 영역 ==================== //

        // 메모 목록 보여주는 함수
        function showMemoList() {
            fetch(memoURL + '?postNo=' + postNo)
                .then(response => response.json())
                .then(memoMap => {
                    makeMemoDOM(memoMap);
                    resize_textarea();
                })    
        }

        // 메모 내용 입력하기
        function makeMemoDOM({memoList, memoCnt}) {
            const $memoContentList = document.querySelector('.content-wrapper div[name="memo"]');

            $memoContentList.innerHTML = '';

            if (memoList === null || memoList.length === 0 ) { // 메모가 하나도 없을 때               
                $memoContentList.innerHTML += "<div>작성한 메모가 없습니다</div>"
            
            } else { 
                for (let memo of memoList) {
                    // 메모 내용 동적생성
                    $memoContentList.innerHTML += appendMemoContentArea(memo);
                }
            }
        }
        
        // 메모 내용 동적생성
        function appendMemoContentArea(data) {
            let content = '<div class="content-area" data-memo-no="' + data.memoNo + '">';
            
            // 메모 버튼 영역 동적생성 
            content += appendMemoButtonArea(data);

            // 메모 내용 입력
            content += appendMemoContent(data);

            content += '</div>';
            return content;
        }

        // 메모 버튼 영역 동적생성
        function appendMemoButtonArea(data) {
            let iconArea = '';
            iconArea += '<div class="flex-sb">';
            iconArea +=     '<div class="datetime">';
            iconArea +=         `<span class="noselect">` + formatDateTime(data.modDatetime) + `</span>`;
            iconArea +=     '</div>';
            iconArea +=     '<div class="button-area memo-initMode">';
            iconArea +=         '<i class="fas fa-edit button" onclick="btnModify_onclick(this)"></i>';
            iconArea +=         '<i class="fas fa-trash-alt button" onclick="btnDelete_onclick(this)"></i>';
            iconArea +=     '</div>';
            iconArea +=     '<div class="button-area memo-modifyMode button-hidden">';
            iconArea +=         '<i class="fas fa-check-square button" onclick="btnModifySave_onclick(this)"></i>';
            iconArea +=         '<i class="fas fa-times button" onclick="btnCancle_onclick(this)"></i>';
            iconArea +=     '</div>';
            iconArea += '</div>';
            return iconArea;
        }

        // 메모 내용 입력
        function appendMemoContent(data) {
            return '<textarea class="content" readonly data-initvalue="' + data.content + '">'
                + data.content
                + '</textarea>'
            ;
        }

        // 메모 button-area 모드 전환
        async function toggleMemoMode($memoContent) {
            // 저장, 취소 버튼 show <-> hide
            const $saveMemo = $memoContent.previousSibling.querySelector('.memo-modifyMode');
            $saveMemo.classList.toggle('button-hidden');

            // 수정, 삭제 버튼 hide <-> show
            const $cancleMemo = $memoContent.previousSibling.querySelector('.memo-initMode');
            $cancleMemo.classList.toggle('button-hidden');

            $memoContent.toggleAttribute('readonly');
        }

        // ==================== 마크 영역 ==================== //

        // 마크 목록 보여주는 함수
        function showMarkList() {
            fetch(markURL + '?postNo=' + postNo)
                .then(response => response.json())
                .then(markMap => {
                    makeMarkDOM(markMap);
                    resize_textarea();
                })    
        }

        // 마크 내용 입력하기
        function makeMarkDOM({markList, markCnt}) {
            const $markContentList = document.querySelector('.content-wrapper div[name="mark"]');

            $markContentList.innerHTML = '';

            if (markList === null || markList.length === 0 ) { // 마크가 하나도 없을 때               
                $markContentList.innerHTML += "<div>작성한 북마크가 없습니다</div>"
            
            } else { 
                for (let mark of markList) {
                    // 마크 내용 동적생성
                    $markContentList.innerHTML += appendMarkContentArea(mark);
                }
            }
        }

        // 북마크 내용 동적생성
        function appendMarkContentArea(data) {
            let content = '<div class="content-area" data-mark-no="' + data.markNo + '">';

            // (회차 / 페이지 / 권수 / 퍼센트) 아이콘, 마크 버튼 영역 동적생성
            content += appendMarkIconAndButtonArea(data);

            // 북마크 내용 입력
            content += appendMarkContent(data);

            content += '</div>';
            return content;
        }

        // (회차 / 페이지 / 권수 / 퍼센트) 아이콘, 마크 버튼 영역 동적생성
        function appendMarkIconAndButtonArea(data) {
            let iconArea = '';
            iconArea += '<div class="flex-sb">';
            iconArea +=     '<div class="datetime">';
            iconArea +=         '<i class="' + classifyMarkIconType(data.epId) + `">` + data.episodeNo + `</i>`;
            iconArea +=         ' | ';
            iconArea +=         `<span class="noselect mark-date">` +data.prettierDate + `</span>`;
            iconArea +=     '</div>';
            iconArea +=     '<div class="button-area mark-initMode">';
            iconArea +=         '<i class="fas fa-edit button" onclick="btnModify_onclick(this)"></i>';
            iconArea +=         '<i class="fas fa-trash-alt button" onclick="btnDelete_onclick(this)"></i>';
            iconArea +=     '</div>';
            iconArea +=     '<div class="button-area mark-modifyMode button-hidden">';
            iconArea +=         '<i class="fas fa-check-square button" onclick="btnModifySave_onclick(this)"></i>';
            iconArea +=         '<i class="fas fa-times button" onclick="btnCancle_onclick(this)"></i>';
            iconArea +=     '</div>';
            iconArea += '</div>';
            return iconArea;
        }

        // (회차(화) / 페이지(p) / 권수(권) / 퍼센트(%)) 아이콘 종류 판단
        function classifyMarkIconType(epId) {
            // (고정) 0:회차, 1:페이지, 2:권수, 3:퍼센트
            switch(epId) {
                case 0:
                    return 'marking-type1 noselect';
                case 1:
                    return 'marking-type2 noselect';
                case 2:
                    return 'marking-type3 noselect';
                case 4: 
                    return 'marking-type4 noselect'
                default : return 'marking-type1 noselect';
            }
        }

        // 북마크 내용 입력
        function appendMarkContent(data) {
            return '<textarea class="content" readonly onkeydown="resize_textarea(this)" onkeyup="resize_textarea(this)" data-initvalue="' + data.content + '">'
                + data.content
                + '</textarea>'
            ;
        }

        // 북마크 button-area 모드 전환
        async function toggleMarkMode($markContent) {
            // 저장, 취소 버튼 show <-> hide
            const $saveMark = $markContent.previousSibling.querySelector('.mark-modifyMode');
            $saveMark.classList.toggle('button-hidden');

            // 수정, 삭제 버튼 hide <-> show
            const $cancleMark = $markContent.previousSibling.querySelector('.mark-initMode');
            $cancleMark.classList.toggle('button-hidden');

            $markContent.toggleAttribute('readonly');
        }

        // textarea 높이 자동조절
        function resize_textarea() {
            const $textAreaList = [...document.querySelectorAll('.content-area .content')];
            
            for ($textArea of $textAreaList) {
                // console.log($textArea.value);
                $textArea.style.height = "1px";
                $textArea.style.height = (12 + $textArea.scrollHeight) + "px";
            }
        }
        
        showMarkList();
        showMemoList(); 
    </script>
</body>
</html>