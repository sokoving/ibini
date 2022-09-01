<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="../include/static-head.jsp" %>
                <style>
                    /* header section 초기화 */
                    section {
                        width: 100%;
                        border: none;
                        border-radius: none;
                        margin: 0;
                        padding: 0;
                        box-sizing: none;
                    }

                    .title-2 {
                        width: 500px;
                        text-align: center;
                        /* background: yellow; */
                        margin: 20px auto 0;
                    }

                    .btn {
                        cursor: pointer;
                        border: 2px solid;
                        background: rgb(95, 225, 219);
                    }

                    .add-btn {
                        margin-top: 80px;
                    }

                    .register-btn {
                        width: 150px;
                        margin-left: 850px;
                        margin-bottom: 5px;
                        background: rgb(235, 232, 181);
                    }

                    .inquiryMainTable {
                        border-top: 4px solid;
                        border-bottom: 4px solid;
                    }

                    .inquiryTable {
                        width: 100%;
                        margin: 0 auto 0;
                        /* background: yellow; */
                        display: flex;
                        border-bottom: 2px solid;
                        margin-bottom: 5px;
                        padding: 15px 0;
                    }

                    .inquiryTable .table1 {
                        /* background: #000; */
                        cursor: pointer;
                    }

                    .inner-inquiryTable {
                        width: 500px;
                        /* background: green; */
                    }

                    .table1 li {
                        /* background: gray; */
                        padding-left: 20px;
                    }

                    .table1 .title {
                        padding-left: 80px;
                    }

                    .table2 li {
                        /* background: violet; */
                        text-align: right;
                        padding-right: 20px;
                    }

                    .detail {
                        cursor: pointer;
                    }

                    .inquiry-content {
                        margin-left: 80px;
                        width: 850px;
                        /* border: 1px solid; */
                        padding: 15px;
                    }

                    .inquiryMainTable li {
                        margin-bottom: 5px;
                    }

                    /* ========== 문의 - 아이디 - 제목 - 내용 - 답변 ========== */
                    /* 문의/아이디 표시 li 태그 */
                    .inquiry-title {}

                    /* 제목 li 태그 */
                    .table1 .title {
                        padding-left: 80px;
                    }

                    /* 문의글 상세보기시 출력되는 태그 li */
                    .inquiry-content {
                        margin-left: 100px;
                        /* width: 850px; */
                        border: 1px solid;
                        padding: 15px;

                    }

                    /* 문의글 상세보기시 제목 :  */
                    .detailTitle {
                        margin-left: 90px;
                    }

                    /* 답변 상세보기시 출력되는 태그 li */
                    .answer {
                        margin-left: 110px;
                        border: 1px solid;
                    }

                    /* 답변 상세보기시 출력되는 답변: */
                    .answerDetailTitle {
                        margin-left: 100px;
                        margin-top: 20px;
                    }

                    /*
                    .answer{                        
                        width: 350px;
                        border: 1px solid;
                        padding: 15px;
                        margin-left: 130px;
                    } */

                    /* 페이지 form */

                    .bottom-section {
                        margin-top: 50px;
                        margin-bottom: 100px;
                        display: flex;
                    }

                    .bottom-section nav {
                        flex: 9;
                        /* 부모에게 display: flex; */
                        display: flex;
                        justify-content: center;
                    }

                    .pagination-custom a {
                        color: #444 !important;
                        /* !important */
                    }

                    .pagination-custom li.active a,
                    .pagination-custom li:hover a {
                        background: #333 !important;
                        color: #fff !important;
                    }

                    .page-item {
                        margin-left: 5px;
                    }

                </style>

        </head>


        <body>
            <div id="wrap">
                <%@ include file="../include/header.jsp" %>
                    <section>
                        <h1> 문의하기 </h1>
                        <div class="register-btn btn"> 문의글 등록하기</div>
                    </section>

                    <c:if test="${empty list}">
                        <div class="title-2">
                            문의 내역이 없습니다.
                        </div>
                    </c:if>

                    <!-- 문의글 내역 -->
                    <c:if test="${not empty list}">
                        <ul class="inquiryMainTable">
                            <c:forEach var="list" items="${list}">
                                <li class="inquiryTable">
                                    <ul class="inner-inquiryTable table1">
                                        <ul class="table1-secondchild">
                                            <li class="inquiry-title" data-serial-num="${list.serialNumber}">
                                                [문의]&nbsp;${list.userId}</li>
                                            <li class="title"> 제목 : ${list.inquiryTitle}</li>
                                        </ul>
                                        <ul class="table1-secondchild detailAnswerclick"></ul>
                                        <li data-serial-num="0" class="if-setting"></li>
                                    </ul>
                                    <ul class="inner-inquiryTable table2">
                                        <li data-serial-num="${list.serialNumber}">${list.inquiryPrettierDate}</li>
                                        <c:if test="${list.answer == null}">
                                            <li class="answer-register">
                                                <p id="registerBtn"> [미응답] </p>
                                            </li>

                                        </c:if>
                                        <c:if test="${list.answer != null}">
                                            <li class="detail">[답변완료]</li>
                                        </c:if>
                                    </ul>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>

                    <!-- 페이지 버튼 만들기 -->
                    <div class="bottom-section">
                        <nav id="page-form" aria-label="Page navigation example">
                            <ul class="pagination pagination-lg pagination-custom">
                                <c:if test="$pm.prev">
                                    <li class="page-item">
                                        <a class="page-link"
                                            href="/member/inquiry?userId=${loginUser.userId}&pageNum=${pm.beginPage - 1}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                                    <li data-page-num="${n}" class="page-item"><a class="page-link"
                                            href="/member/inquiry?userId=${loginUser.userId}&pageNum=${n}">${n}</a></li>
                                </c:forEach>

                                <c:if test="${pm.next}">
                                    <li class="page-item">
                                        <a class="page-link"
                                            href="/member/inquiry?userId=${loginUser.userId}&pageNum=${pm.endPage + 1}"
                                            aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>


            </div>
            <!--================== script =================================-->
            <script>
                // 현재 위치한 페이지에 active 스타일 부여하기
                function appendPageActive() {

                    // 현재 내가 보고 있는 페이지 넘버
                    const curPageNum = '${pm.page.pageNum}';
                    // console.log("현재페이지: ", curPageNum);

                    // 페이지 li태그들을 전부 확인해서 
                    // 현재 위치한 페이지 넘버와 텍스트컨텐츠가 일치하는 li를 찾아서 class active 부여
                    const $ul = document.querySelector('.pagination');
                    console.log($ul);

                    for (let $li of [...$ul.children]) {
                        console.log(curPageNum);
                        console.log($li.dataset.pageNum);
                        if (curPageNum === $li.dataset.pageNum) {

                            $li.classList.add('active');
                            break;
                        }
                    }
                }
                // 즉시실행함수
                (function () {
                    appendPageActive();
                })();
            </script>

            <script>
                //문의글 상세보기 태그 만들기 함수
                function makeInquiryDOM(oneInquiry, $ul) {
                    const $li = document.createElement('li');
                    const $div = document.createElement('div');
                    $div.textContent = '내용 :'
                    $div.classList.add('detailTitle');
                    $li.textContent = oneInquiry.inquiry;
                    $li.dataset.serialNumber = oneInquiry.serialNumber;
                    $li.classList.add('inquiry-content');
                    $ul.append($div);
                    $ul.append($li);
                }

                // 답변 상세보기 태그 만들기 함수 makeAnswerDOM
                function makeAnswerDOM(oneInquiry, $ul) {
                    const $li = document.createElement('li');
                    const $div = document.createElement('div');
                    $div.textContent = '답변: :'
                    $div.classList.add('answerDetailTitle');
                    $li.textContent = oneInquiry.answer;
                    $li.dataset.serialNum = oneInquiry.serialNumber;
                    $li.classList.add('answer');
                    $ul.append($div);
                    $ul.append($li);

                }

                //글쓰기로 이동하기 버튼 이벤트
                const $writeBtn = document.querySelector('.register-btn');
                $writeBtn.addEventListener('click', e => {
                    location.href = '/member/inquiry-register';
                })

                const $table = document.querySelector(".inquiryMainTable");

                //답변 자세히 보기버튼이벤트
                const $detail = document.querySelector('.detail');
                console.log($detail);

                $table.addEventListener('click', e => {
                    if (!e.target.matches('.table2 li')) return;
                    console.log('detail 클릭:', e.target);
                    let serialNumber = e.target.parentElement.firstElementChild.dataset.serialNum;
                    let $ul = e.target.parentElement.parentElement.firstElementChild;
                    fetch('http://localhost:8383/member/findone-inquiry/' + serialNumber)
                        .then(res => res.json())
                        .then(oneInquiry => {
                            if (e.target.parentElement.parentElement.firstElementChild.lastElementChild.dataset.serialNum == "0") {
                                console.log('if문 :', e.target.parentElement.parentElement.firstElementChild.lastElementChild.dataset.serialNum);
                                makeAnswerDOM(oneInquiry, $ul);

                            } return;

                        });
                })



                //상세보기 요청 이벤트
                console.log($table);
                $table.addEventListener('click', e => {
                    // console.log(e.target);
                    if (!e.target.matches('.table1 li')) return;
                    console.log('li 클릭됨! -', e.target);

                    let serialNumber = e.target.parentElement.parentElement.firstElementChild.firstElementChild.dataset.serialNum;
                    let $ul = e.target.parentElement;
                    // console.log('글번호 :', serialNumber);
                    // location.href = '/member/findone-inquiry/' + serialNumber;
                    //비동기로 문의글 상세정보 가지고 오기              
                    fetch('http://localhost:8383/member/findone-inquiry/' + serialNumber)
                        .then(res => res.json())
                        .then(oneInquiry => {
                            if (e.target.parentElement.lastElementChild.dataset.serialNumber == oneInquiry.serialNumber) {
                                return;
                            };
                            makeInquiryDOM(oneInquiry, $ul);
                        });
                })
                // $table.onclick = e => {
                //     console.log(e.target);
                //     if (!e.target.matches('.inquiryTable li')) return;
                //     console.log('li 클릭됨! -', e.target);

                //     let serialNumber = e.target.parentElement.parentElement.firstElementChild.firstElementChild.dataset.serialNum;
                //     let $ul = e.target.parentElement;
                //     console.log('글번호 :', serialNumber);
                //     // location.href = '/member/findone-inquiry/' + serialNumber;
                //     //비동기로 문의글 상세정보 가지고 오기              
                //     fetch('http://localhost:8383/member/findone-inquiry/' + serialNumber)
                //         .then(res => res.json())
                //         .then(oneInquiry => {
                //             // console.log(oneInquiry);
                //             // console.log(oneInquiry.inquiry);
                //             makeInquiryDOM(oneInquiry,$ul);
                //         });
                // }


                const msg = '${msg}'
                if (msg == 'inquiry-modify-success') {
                    alert('문의 사항이 수정 되었습니다.');
                }

                if (msg == 'inquiry-delete-success') {
                    alert('문의 사항이 삭제 되었습니다.')
                }

                if (msg == 'inquiry-register-success') {
                    alert('문의 사항이 정상적으로 등록 되었습니다.')
                }
            </script>


        </body>

        </html>