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
                        /* padding-left: 80px; */
                    }

                    .table2 li {
                        /* background: violet; */
                        text-align: right;
                        padding-right: 20px;
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
                        /* padding-left: 80px; */
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
                        width: 820px;
                    }

                    /* 답변 상세보기시 출력되는 답변: */
                    .answerDetailTitle {
                        margin-left: 100px;
                        margin-top: 20px;
                    }

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

                    /* 새로운 글 표시 */

                    .newMark.inquirynewmark {
                        display: flex;
                    }

                    .newMark.answernewmark {
                        display: flex;
                        justify-content: right;
                    }

                    /* 접기 버튼 */
                    .close-btn {
                        margin-top: auto;
                        border: 1px solid;
                        width: 50px;
                        text-align: center;
                        cursor: pointer;
                    }

                    .hidden{
                        display: none;
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
                                            <div class="newMark inquirynewmark">
                                                <c:if test="${list.newInquiryArticle}">
                                                    <span class="badge rounded-pill bg-danger">new</span>
                                                </c:if>
                                                <li class="title"> 제목 : ${list.inquiryTitle}</li>
                                            </div>
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
                                            <div class="newMark answernewmark">
                                                <c:if test="${list.newAnswerArticle}">
                                                    <span class="badge rounded-pill bg-danger">new</span>
                                                </c:if>
                                                <li class="detail">[답변완료]</li>

                                            </div>
                                        </c:if>
                                    </ul>
                                    <div class="close-btn hidden">접기</div>
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
                    $div.textContent = '답변:'
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
                    $div.textContent = '답변:'
                    $div.classList.add('answerDetailTitle');
                    $li.textContent = oneInquiry.answer;
                    $li.dataset.serialNum = oneInquiry.serialNumber;
                    $li.classList.add('answer');
                    $ul.append($div);
                    $ul.append($li);


                }

                // 접기 버튼 태그 만들기 함수 makeCloseDOM
                function makeCloseDOM($ul) {
                    const $btn = document.createElement('button');
                    $btn.textContent = '접기';
                    $btn.classList.add('close-btn');
                    $btn.type = 'button';
                    $ul.append($btn);
                }

                // ===== 조회 화면 접기 이벤트 =====

                $table.addEventListener('click', e => {


                    console.log('if문 전 close-btn 클릭됨!', e.target);
                    if (!e.target.matches('.close-btn')) return;
                    console.log('close-btn 클릭됨!', e.target);

                    // 노드 삭제를 위해 타겟의 부모요소 선택 [문의글만 있는 경우]
                    const $parentNode = e.target.parentElement.firstElementChild.firstElementChild;
                    // console.log('삭제대상의 부모:', $parentNode);

                    // 삭제할 노드 선택 [문의글만 있는 경우 - 문의 제목]
                    const $removeTargetT = e.target.parentElement.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;
                    // console.log('???',$removeTargetT);
                    // 삭제할 노드 선택 [문의글만 있는 경우 - 문의 내용]
                    const $removeTargetC = e.target.parentElement.firstElementChild.firstElementChild.lastElementChild;
                    // console.log('삭제대상:', $removeTarget);

                    //삭제 글만 있는 경우 조건식
                    // console.log($removeTarget.classList.contains('inquiry-content'));

                    // 노드 삭제를 위해 타겟의 부모요소 선택 [문의글과 답변이 있는 경우]
                    const $parentNodeA = e.target.parentElement.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling;
                    // console.log('삭제대상의 부모:', $parentNodeA);

                    // 삭제할 노드 선택 [문의글과 답변이 있는 경우 - 답변 제목]
                    const $removeTargetAT = e.target.parentElement.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild;
                    // console.log('???',$removeTargetAT);

                    // 삭제할 노드 선택 [문의글과 답변이 있는 경우 - 답변 내용]
                    const $removeTargetAC = e.target.parentElement.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.lastElementChild;
                    // console.log('삭제대상:', $removeTargetA);

                    // 문의글과 답변이 있는 경우 조건식
                    // console.log($removeTargetA.classList.contains('answer'));

                    //부모노드.removeChild(삭제할노드)

                    // 접기 버튼 숨기기위해 노드 설정
                    const $closeBtn = e.target

                    if($removeTargetC.classList.contains('inquiry-content')){
                        $parentNode.removeChild($removeTargetT);
                        $parentNode.removeChild($removeTargetC);
                        $closeBtn.classList.add('hidden');
                    };

                    console.log('if문 돌기전',$removeTargetAC.classList.contains('answer'))
                    if($removeTargetAC.classList.contains('answer')) {
                        console.log('if문 돌고',$removeTargetAC.classList.contains('answer'))
                        $parentNodeA.removeChild($removeTargetAT);
                        $parentNodeA.removeChild($removeTargetAC);
                        $closeBtn.classList.add('hidden');

                    };



                })


                // const $table2 = document.querySelector('.table2');
                // console.log($table2);
                // $table2.addEventListener('click',e=>{
                //     console.log('타겟 :',e.target);
                // })

                // 그런데 체크박스를 동적으로 만들어주는 경우에는 위와 같은 태그가 먹지 않았다. 
                // 찾아보니 동적 태그일 경우에는 document.ready의 이벤트가 작동하지 않는다. 
                // document.ready 는 화면이 최초에 로드되었을 때에 화면 안에 있는 태그들에 이벤트를 걸기 때문에, 
                // 로드되었을 때 존재하지 않는 태그에 대해서는 이벤트를 걸 수 없는 것이다

                // const $closeBtn = document.querySelector('.close-btn');
                // console.log($closeBtn);


                // ===== 상세보기 요청 이벤트 - 상세보기 클릭시 답변도 나오게 하기 =====
                // close-btn 태그를 만들 위치를 정하기 위한 checkArr
                console.log($table);
                $table.addEventListener('click', e => {

                    // console.log(e.target);
                    if (!e.target.matches('.table1 li')) return;
                    // console.log('li 클릭됨! -', e.target);
                    // console.log('일련번호 확인 : ', e.target.parentElement.parentElement.parentElement.firstElementChild.firstElementChild);

                    let serialNumber = e.target.parentElement.parentElement.parentElement.firstElementChild.firstElementChild.dataset.serialNum;
                    let $ul = e.target.parentElement.parentElement;
                    // console.log(e.target.parentElement.lastElementChild);
                    // console.log('글번호 :', serialNumber);
                    // location.href = '/member/findone-inquiry/' + serialNumber;

                    //비동기로 문의글 상세정보 가지고 오기              
                    fetch('http://localhost:8383/member/findone-inquiry/' + serialNumber)
                        .then(res => res.json())
                        .then(oneInquiry => {
                            console.log(e.target.parentElement.parentElement.parentElement.lastElementChild);
                            if (e.target.parentElement.parentElement.lastElementChild.dataset.serialNumber == oneInquiry.serialNumber) {
                                return;
                            };
                            makeInquiryDOM(oneInquiry, $ul);
                            // 접기 버튼 활성화 시키기
                            const $closeBtn = e.target.parentElement.parentElement.parentElement.nextElementSibling.nextElementSibling
                            $closeBtn.classList.remove('hidden');

                            // // 상세보기만 한 경우 close-btn 태그 만들기
                            // if (oneInquiry.answer == null) {
                            //     const $ul = e.target.parentElement.parentElement;
                            //     makeCloseDOM($ul);
                            // }

                            // 답변 상세보기
                            if (oneInquiry.answer != null) {
                                let $ul = e.target.parentElement.parentElement.nextElementSibling.nextElementSibling;
                                fetch('http://localhost:8383/member/findone-inquiry/' + serialNumber)
                                    .then(res => res.json())
                                    .then(oneInquiry => {
                                        // console.log('if문 가동전 비교 타겟:',e.target.parentElement.lastElementChild);
                                        // console.log('if문 가동전 타겟의 넘버:',e.target.parentElement.lastElementChild.dataset.serialNum);
                                        // console.log('if문 가동전 시리얼 넘버:',serialNumber)
                                        console.log('if문 가동전 :', e.target.parentElement.parentElement.nextElementSibling.nextElementSibling);
                                        if (e.target.parentElement.parentElement.nextElementSibling.nextElementSibling.dataset.serialNum == "0") {
                                            console.log('if문 :', e.target.parentElement.parentElement.nextElementSibling.nextElementSibling.dataset.serialNum);
                                            makeAnswerDOM(oneInquiry, $ul);

                                            // 문의글조회+답글조회 될때 접기 버튼 태그 만들기
                                            const $ulClose = e.target.parentElement.parentElement.nextElementSibling.nextElementSibling;
                                            // const $ulClose = e.target.parentElement.parentElement.parentElement.parentElement.lastElementChild;
                                            // makeCloseDOM($ulClose);

                                        } return;
                                        // e.target.parentElement.parentElement.firstElementChild.lastElementChild.dataset.serialNum == oneInquiry.serialNumber
                                    });
                            }

                            // // close-btn 태그 생성
                            // console.log('체크배열 확인 : ', checkArr);
                            // console.log('상세보기만 있을때 삽입태그 위치:', document.e.target.parentElement.parentElement);
                            // console.log('둘다 있을때 삽입태그 위치:', e.target.parentElement.parentElement.nextElementSibling.nextElementSibling);
                            // if (!checkArr.includes(false)) {

                            //     console.log('close-btn if문 상세보기만')
                            // } else {                                
                            //     console.log('close-btn if문 답변도같이')
                            // }


                        });

                })

                // const $table = document.querySelector(".inquiryMainTable");

                // //답변 자세히 보기버튼이벤트
                // const $detail = document.querySelector('.detail');
                // console.log($detail);

                // $table.addEventListener('click', e => {
                //     if (!e.target.matches('.table2 .detail')) return;
                //     console.log('detail 클릭:', e.target);
                //     let serialNumber = e.target.parentElement.parentElement.firstElementChild.dataset.serialNum;
                //     // console.log('답변 자세히 보기 시리얼넘버:', serialNumber);
                //     let $ul = e.target.parentElement.parentElement.parentElement.firstElementChild;
                //     // console.log(e.target.parentElement.parentElement.firstElementChild.dataset.serialNum);
                //     fetch('http://localhost:8383/member/findone-inquiry/' + serialNumber)
                //         .then(res => res.json())
                //         .then(oneInquiry => {
                //             // console.log('if문 가동전 비교 타겟:',e.target.parentElement.lastElementChild);
                //             // console.log('if문 가동전 타겟의 넘버:',e.target.parentElement.lastElementChild.dataset.serialNum);
                //             // console.log('if문 가동전 시리얼 넘버:',serialNumber)
                //             if (e.target.parentElement.parentElement.parentElement.firstElementChild.lastElementChild.dataset.serialNum == "0") {
                //                 console.log('if문 :', e.target.parentElement.parentElement.parentElement.firstElementChild.lastElementChild.dataset.serialNum);
                //                 makeAnswerDOM(oneInquiry, $ul);

                //             } return;
                //             // e.target.parentElement.parentElement.firstElementChild.lastElementChild.dataset.serialNum == oneInquiry.serialNumber

                //         });                })


                // //상세보기 요청 이벤트
                // console.log($table);
                // $table.addEventListener('click', e => {
                //     // console.log(e.target);
                //     if (!e.target.matches('.table1 li')) return;
                //     console.log('li 클릭됨! -', e.target);
                //     console.log('일련번호 확인 : ', e.target.parentElement.parentElement.parentElement.firstElementChild.firstElementChild);

                //     let serialNumber = e.target.parentElement.parentElement.parentElement.firstElementChild.firstElementChild.dataset.serialNum;
                //     let $ul = e.target.parentElement.parentElement;
                //     // console.log(e.target.parentElement.lastElementChild);
                //     // console.log('글번호 :', serialNumber);
                //     // location.href = '/member/findone-inquiry/' + serialNumber;
                //     //비동기로 문의글 상세정보 가지고 오기              
                //     fetch('http://localhost:8383/member/findone-inquiry/' + serialNumber)
                //         .then(res => res.json())
                //         .then(oneInquiry => {
                //             if (e.target.parentElement.parentElement.lastElementChild.dataset.serialNumber == oneInquiry.serialNumber) {
                //                 return;
                //             };
                //             makeInquiryDOM(oneInquiry, $ul);
                //         });
                // })


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