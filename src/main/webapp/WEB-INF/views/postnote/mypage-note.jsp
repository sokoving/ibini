<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap js -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script> -->

    <!-- jQuery UI CSS파일 -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <!-- jQuery 기본 js파일 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <!-- jQuery UI 라이브러리 js파일 -->
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    <link rel="stylesheet" href="/css/calendar.css">

    <!-- naver font -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

    <link rel="stylesheet" href="/css/mypage-note.css">
</head>

<body>
    <!-- 최상단 wrap 영역 -->
    <div id="wrap">
        <section>
            <div class="header-wrapper">

                <!-- 마크, 메모 탭 버튼 영역 -->
                <div class="tab-button-wrapper flex">
                    <div class="w50 selected" name="mark" onclick="oncick_tabButton(this)">
                        <!-- <i class="fas fa-bookmark"></i> -->
                        MARK
                    </div>
                    <div class="w50" name="memo" onclick="oncick_tabButton(this)">
                        <!-- <i class="fas fa-sticky-note"></i> -->
                        MEMO
                    </div>
                </div> <!-- end tab-button-wrapper -->

                <!-- 검색 영역 -->
                <div class="search-wrapper">
                    <div name="mark">
                        <div class="search-mark">
                            <select name="">
                                <option value="">책 제목</option>
                                <option value="">마크 내용</option>
                                <option value="">회차</option>
                            </select>
                            <input type="text" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off">

                            <label for="start-date">
                                <i class="fas fa-calendar-alt"></i>
                            </label>
                            <input type="text" id="start-date" autocomplete="off">
                            ~
                            <input type="text" id="end-date" autocomplete="off">

                            <button class="search-button" type="submit">
                                검색
                            </button>
                        </div>
                    </div> <!-- end mark -->
                    <div class="hidden" name="memo">
                        <div class="search-mark">
                            <select name="">
                                <option value="">책 제목</option>
                                <option value="">메모 내용</option>
                            </select>
                            <input type="text" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off">

                            <label for="start-date">
                                <i class="fas fa-calendar-alt"></i>
                            </label>
                            <input type="text" id="start-date" autocomplete="off">
                            ~
                            <input type="text" id="end-date" autocomplete="off">

                            <button class="search-button" type="submit">
                                검색
                            </button>
                        </div>
                    </div> <!-- end memo -->
                </div> <!-- end search-wrapper -->

                <!-- LIST 영역 -->
                <div class="list-wrapper">
                    <div class="list-button">
                        <span>MARK LIST</span>
                    </div>
                    <div class="list-button hidden">
                        <span>MEMO LIST</span>
                    </div>
                </div> <!-- end list-wrapper -->
            </div> <!-- end header-wrapper -->


            <!-- body 영역 -->
            <div class="body-wrapper">
                <!-- content 영역 -->
                <div class="content-wrapper" name="mark">
                    <c:forEach var="p" items="${postList}">
                        <div class="content">
                            <div class="book-wrapper flex-fs">
                                <!-- 책 이미지 -->
                                <c:choose>
                                    <c:when test="${p.thumbImg != null}">
                                        <div class="book-image w30 noselect">
                                            <img class="book-image" src="${p.thumbImg}" alt="book image">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="book-image w30 noselect"></div>
                                    </c:otherwise>
                                </c:choose>
                                <!-- <div class="book-image w30 noselect">
                                    <img class="book-image" src="${p.thumbImg}" alt="book image">
                                </div> -->

                                <!-- 포스트 번호 -->
                                <span id="postNo" style="display: none;">${p.postNo}</span>

                                <!-- 책 정보 -->
                                <div class="book-info w70">
                                    <!-- 책 제목 -->
                                    <div class="book-title">
                                        <span>${p.postTitle}</span>
                                    </div>
                    
                                    <!-- MARK 내용 -->
                                    <div id="mark-info" class="my-text">
                                        <div class="episode-no">
                                            <span>ep.15</span>
                                        </div>
                                        <textarea class="w100" spellcheck="false" readonly onkeydown="resize_textarea(this)" onkeyup="resize_textarea(this)">ffff
                                            asdasdagre기머이ㅓ니ㅓ리너일너ㅣㅇ허닝허닝허니어니어히나ㅓ히나ㅓㅇ히나ㅓㅇ히나ㅓㅇ히ㅏ넝히머이허닝허니어
                                        </textarea>
                                        <!-- Mark 날짜 -->
                                        <div class="meta-data">
                                            <span>2022-08-22</span>
                                        </div>
                                        <hr>

                                        <div class="episode-no">
                                            <span>ep.1225</span>
                                        </div>
                                        <textarea class="w100" spellcheck="false" readonly onkeydown="resize_textarea(this)" onkeyup="resize_textarea(this)">
                                            rgarg&#10;&#10;raeheath
                                        </textarea>
                                        <!-- Mark 날짜 -->
                                        <div class="meta-data">
                                            2022-08-22
                                        </div>
                                        <hr>
                                    </div> <!-- end my-text -->
                                    <div class="view-more">
                                        <a class="noselect" href="javascript:click_viewMore(this)">... 더보기</a>
                                    </div>
                                </div> <!-- end book-info -->
                            </div> <!-- end book-wrapper -->
                        </div> <!-- end content -->
                    </c:forEach>
                    
                </div> <!-- end content-wrapper name="mark" -->

                
                <div class="content-wrapper hidden" name="memo">
                    <div class="content">
                        <div class="book-wrapper flex-fs">
                            <!-- 책 이미지 -->
                            <div class="book-image w30 noselect">
                                <img class="book-image" src="./project3.png" alt="book image">
                            </div>
                            <!-- 책 정보 -->
                            <div class="book-info w70">
                                <!-- 책 제목 -->
                                <div class="book-title">
                                    <span>여행계획 짜기</span>
                                </div>
                                <!-- MARK 내용 -->
                                <div class="my-text">
                                    <textarea class="w100" spellcheck="false" readonly onkeydown="resize_textarea(this)" onkeyup="resize_textarea(this)">ffff
                                        asdasdagre
                                    </textarea>
                                    <!-- Mark 날짜 -->
                                    <div class="meta-data">
                                        <span>2022-08-22</span>
                                    </div>    
                                    <hr>

                                    <textarea class="w100" spellcheck="false" readonly onkeydown="resize_textarea(this)" onkeyup="resize_textarea(this)">
                                        rgarg&#10;&#10;raeheath
                                    </textarea>
                                    <!-- Mark 날짜 -->
                                    <div class="meta-data">
                                        2022-08-22
                                    </div>  
                                    <hr>
                                </div> <!-- end my-text -->
                                <div class="view-more">
                                    <a class="noselect" href="javascript:click_viewMore(this)">... 더보기</a>
                                </div>
                            </div> <!-- end book-info -->
                        </div> <!-- end book-wrapper -->
                    </div> <!-- end content -->

                    <div class="content">
                        <div class="book-wrapper flex-fs">
                            <!-- 책 이미지 -->
                            <div class="book-image w30 noselect">
                                <img class="book-image" src="./project3.png" alt="book image">
                            </div>
                            <!-- 책 정보 -->
                            <div class="book-info w70">
                                <!-- 책 제목 -->
                                <div class="book-title">
                                    <span>여행계획 짜기</span>
                                </div>
                                <!-- MARK 내용 -->
                                <div class="my-text">
                                    <textarea class="w100" spellcheck="false" readonly onkeydown="resize_textarea(this)" onkeyup="resize_textarea(this)">ffff
                                        asdasdagre
                                    </textarea>
                                    <!-- Mark 날짜 -->
                                    <div class="meta-data">
                                        <span>2022-08-22</span>
                                    </div>    
                                    <hr>

                                    <textarea class="w100" spellcheck="false" readonly onkeydown="resize_textarea(this)" onkeyup="resize_textarea(this)">
                                        rgarg&#10;&#10;raeheath
                                    </textarea>
                                    <!-- Mark 날짜 -->
                                    <div class="meta-data">
                                        2022-08-22
                                    </div>  
                                    <hr>
                                </div> <!-- end my-text -->
                                <div class="view-more">
                                    <a class="noselect" href="javascript:click_viewMore(this)">... 더보기</a>
                                </div>
                            </div> <!-- end book-info -->
                        </div> <!-- end book-wrapper -->
                    </div> <!-- end content -->
                </div> <!-- end content-wrapper name="memo" -->
        </section>
    </div> <!-- end wrap -->

    <script>
        $(document).ready(function () {
            $("#start-date, #end-date").datepicker({
                changeMonth: true,
                changeYear: true,
                showMonthAfterYear: true,
                monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11',
                    '12'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                dateFormat: 'yy-mm-dd',
            });
            $('#start-date').datepicker('setDate', 'today');

            $('#start-date').datepicker("option", "maxDate", $("#end-date").val());
            $('#start-date').datepicker("option", "onClose", function (selectedDate) {
                $("#end-date").datepicker("option", "minDate", selectedDate);
            });

            $('#end-date').datepicker();
            $('#end-date').datepicker("option", "minDate", $("#start-date").val());
            $('#end-date').datepicker("option", "onClose", function (selectedDate) {
                $("#start-date").datepicker("option", "maxDate", selectedDate);
            });
        });
    </script>


    <script>
        /*======================================================================
            이벤트 영역
        ========================================================================*/
        // 탭 버튼 클릭
        function oncick_tabButton($eventTag) {
            const fireEvent = !$eventTag.classList.contains('selected');
            if (fireEvent) toggleSelected($eventTag);
            testCall();
        }

        // textarea 높이 자동조절
        // function resize_textarea($eventTag) {
        //     console.log($eventTag.value);
        //     $eventTag.style.height = "1px";
        //     $eventTag.style.height = (12 + $eventTag.scrollHeight) + "px";
        // }

        // ... 더보기 클릭
        function click_viewMore($eventTag) {
            // fetch() 사용하여 팝업페이지 호출 및 책/회차 등의 변수값 전달
            // 지금은 샘플html이니 redirect 처리를 하도록 한다.
            window.location.href = './detail/detail.html';
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
            const $titles = [...document.querySelector('section .tab-button-wrapper').children];
            $titles.forEach($title => $title.classList.toggle('selected'));
        }

        // hidden 클래스 toggle 처리
        function toggleHiddenClass($eventTag) {
            const name = $eventTag.getAttribute('name');

            // 검색 영역
            const $searchList = [...document.querySelector('section .search-wrapper').children];
            $searchList.forEach($search => $search.classList.toggle('hidden'));

            // LIST 영역
            const $lists = [...document.querySelector('section .list-wrapper').children];
            $lists.forEach($list => $list.classList.toggle('hidden'));

            // 데이터 목록 영역
            const $contents = [...document.querySelector('section .body-wrapper').children];
            $contents.forEach($content => $content.classList.toggle('hidden'));
        }

        /*======================================================================
            테스트 영역
        ========================================================================*/
        function testCall() {
            const $textAreaList = [...document.querySelectorAll('.my-text textarea')];

            for ($textArea of $textAreaList) {
                // console.log($textArea.value);
                $textArea.style.height = "1px";
                $textArea.style.height = (12 + $textArea.scrollHeight) + "px";
            }
        }
        testCall();
     



        // ==================== 마크 영역 ==================== //

        const postNo = document.getElementById('postNo').textContent;

        // 마크 목록 보여주는 함수
        function showMarkList() {

        fetch('/post/detail/test/mark' + '?postNo=' + postNo)
            .then(response => response.json())
            .then(markMap => {
                makeMarkDOM(markMap);
            })    
        }

        // 마크 내용 입력하기
        function makeMarkDOM({markList, markCnt}) {
        const $markContentList = document.getElementById('mark-info');

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
        iconArea +=        `<i class="` + classifyMarkIconType(data.epId) + `">` + data.episodeNo + `</i>`;
        iconArea +=         ' | ';
        iconArea +=         `<span class="noselect">` + data.modDatetime + `</span>`;
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
            case 3: 
                return 'marking-type3 noselect'
            default : return 'marking-type1 noselect';
        }
        }

        // 북마크 내용 입력
        function appendMarkContent(data) {
        return '<textarea class="content" readonly data-initvalue="' + data.content + '">'
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


        showMarkList();

        
    </script>
</body>

</html>