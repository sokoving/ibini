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
        <!-- MARK/MEMO 탭 버튼 영역 -->
        <div class="title-wrapper flex fixed">
            <div class="half selected" name="mark" onclick="btnTitle_onclick(this)">MARK</div>
            <div class="half" name="memo" onclick="btnTitle_onclick(this)">MEMO</div>
        </div>
        <!-- MARK/MEMO 데이터 입력 영역 -->
        <div class="submit-wrapper">
            <div name="mark">
                <div class="text-area">
                    <textarea class="w100" cols="30" rows="5" maxlength="300" placeholder="새로운 글을 입력해 주세요." onkeyup="textArea_onkeyup(this)" spellcheck="false"></textarea>
                </div>
                <div class="flex submit-area">
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
                    <textarea id="memo-content" class="w100" cols="30" rows="5" maxlength="300" placeholder="새로운 글을 입력해 주세요." onkeyup="textArea_onkeyup(this)" spellcheck="false"></textarea>
                </div>
                <div class="flex submit-area">
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
                <div class="content-area">
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
                </div>
                <div class="content-area">
                    <div class="flex-sb">
                        <div>
                            <i class="marking-type2 noselect">23</i>
                            |
                            <span class="noselect">2022.08.15 13:22:34</span>
                        </div>
                        <div class="button-area">
                            <ion-icon name="create-outline" class="button" onclick="btnModify_onclick(this)"></ion-icon>
                            <ion-icon name="trash-outline" class="button" onclick="btnDelete_onclick(this)"></ion-icon>
                        </div>
                    </div>
                    <div class="content">
                        mark Content2
                    </div>
                </div>
                <div class="content-area">
                    <div class="flex-sb">
                        <div>
                            <i class="marking-type3 noselect">5</i>
                            |
                            <span class="noselect">2022.08.15 13:22:34</span>
                        </div>
                        <div class="button-area">
                            <ion-icon name="create-outline" class="button" onclick="btnModify_onclick(this)"></ion-icon>
                            <ion-icon name="trash-outline" class="button" onclick="btnDelete_onclick(this)"></ion-icon>
                        </div>
                    </div>
                    <div class="content">
                        mark Content3
                    </div>
                </div>
            </div>
            <div class="hidden" name="memo">
                <div class="content-area">
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
                </div>
                <div class="content-area">
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
                        memo Content2
                    </div>
                </div>
                <div class="content-area">
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
                        memo Content3
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
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

                fetch(memoURL, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            "postNo": postNo,
                            "content": $memoContent.value
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
                alert('마크 등록!')
            }
        }

        // 수정 버튼 onclick event
        function btnModify_onclick($eventTag) {

            if ($eventTag.parentElement.parentElement.parentElement.parentElement.getAttribute('name') == 'memo') {
                const $memoContent = $eventTag.parentElement.parentElement.parentElement.querySelector('.content');

                // 버튼 모드 switching
                toggleMemoMode($memoContent);
            } 
            
        }

        // 수정 취소 버튼 onclick event 
        function btnCancle_onclick($eventTag) {

            if ($eventTag.parentElement.parentElement.parentElement.parentElement.getAttribute('name') == 'memo') {
                const $memoContent = $eventTag.parentElement.parentElement.parentElement.querySelector('.content');

                // 취소 클릭 시, 원래 데이터로 원복
                $memoContent.value = $memoContent.getAttribute('data-initvalue');

                // 버튼 모드 switching
                toggleMemoMode($memoContent);
            }
        }


        // 수정저장 버튼 onclick Event
        function btnModifySave_onclick($eventTag) {

            if ($eventTag.parentElement.parentElement.parentElement.parentElement.getAttribute('name') == 'memo'){

                const memoNo = $eventTag.parentElement.parentElement.parentElement.getAttribute('data-memo-no');
                const $memoContent = $eventTag.parentElement.parentElement.parentElement.querySelector('.content');

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
                            toggleMemoMode($memoContent);

                        } else {
                            alert('메모 수정 실패!');
                        }
                })

            } else {
                alert('마크 수정!')
            }          
        }

        // 삭제 버튼 onclick Event
        function btnDelete_onclick($eventTag) {

            if ($eventTag.parentElement.parentElement.parentElement.parentElement.getAttribute('name') == 'memo') {

                const memoNo = $eventTag.parentElement.parentElement.parentElement.getAttribute('data-memo-no');
                console.log(memoNo);

                fetch(memoURL + '/' + memoNo, {method : 'DELETE'})
                    .then(response => response.text())
                    .then(message => {
                        if (message === 'delete-success') {
                            alert('메모 삭제!');
                            $eventTag.parentElement.parentElement.parentElement.remove();

                        } else {
                            alert('메모 삭제 실패!');
                        }
                });

            } else {
                alert('마크 삭제!')
            }

        }

        // textArea onkeyup Event
        function textArea_onkeyup($eventTag) {
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


        /*======================================================================
            마크, 메모 리스트 영역
        ========================================================================*/
        // ==================== 메모 영역 ====================

        // 메모 목록 보여주는 함수
        function showMemoList() {

            fetch(memoURL + '?postNo=' + postNo)
                .then(response => response.json())
                .then(memoMap => {
                    makeMemoDOM(memoMap);
                })    
        }

        // 메모 내용 입력하기
        function makeMemoDOM({memoList, memoCnt}) {
            const $memoContentList = document.querySelector('.content-wrapper div[name="memo"]');

            $memoContentList.innerHTML = '';
            
            for (let memo of memoList) {

                // 메모 내용 동적생성
                $memoContentList.innerHTML += appendMemoContentArea(memo);
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
            iconArea +=     '<div>';
            iconArea +=         `<span class="noselect">` + data.regDate + `</span>`;
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

        // ==================== 마크 영역 ====================

        // 북마크 내용 동적생성
        function appendMarkContentArea(data) {
            let content = '<div class="content-area">';

            // (회차/페이지/권)아이콘 동적생성
            content += appendMarkIcon(data);

            // 북마크/메모 내용 입력
            content += appendMarkContent(data);

            content += '</div>';
            return content;
        }

        // (회차/페이지/권)아이콘 동적생성
        function appendMarkIcon(data) {
            let iconArea = '';
            iconArea += '<div class="flex-sb">';
            iconArea +=     '<div>';
            iconArea +=         '<i class="' + classifyMarkIconType(data.epId) + `">` + data.episodeNo + `</i>`;
            iconArea +=         ' | ';
            iconArea +=         `<span class="noselect">` + data.regDate + `</span>`;
            iconArea +=     '</div>';
            iconArea +=     '<div class="button-area">';
            iconArea +=         '<ion-icon name="create-outline" class="button" onclick="btnModify_onclick(this)"></ion-icon> ';
            iconArea +=         '<ion-icon name="trash-outline" class="button" onclick="btnDelete_onclick(this)"></ion-icon>';
            iconArea +=     '</div>';
            iconArea += '</div>';
            return iconArea;
        }

        // (회차/페이지/권)아이콘 종류 판단
        function classifyMarkIconType(epId) {
            // (고정)0:회차, 1:페이지, 2:권
            switch(epId) {
                case 0:
                    return 'marking-type1 noselect';
                case 1:
                    return 'marking-type2 noselect';
                case 2:
                    return 'marking-type3 noselect';
            }
        }

        // 북마크/메모 내용 입력
        function appendMarkContent(data) {
            return '<div class="content">'
                + data.content
                + '</div>'
            ;
        }

        showMemoList();
        
    </script>
</body>
</html>