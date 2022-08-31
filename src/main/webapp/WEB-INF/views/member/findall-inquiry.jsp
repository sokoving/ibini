<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="../include/static-head.jsp" %>
                <style>
                    /* header section 초기화 */
                    section {
                        width: 0;
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
                        width: 70px;
                        border: 2px solid;
                    }

                    .add-btn {
                        margin-top: 80px;
                    }

                    .register-btn {
                        width: 200px;
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

                    .table2 li {
                        /* background: violet; */
                        text-align: right;
                        padding-right: 20px;
                    }

                    .detail {
                        cursor: pointer;
                    }

                    /* 미응답 li태그 */
                    .answer-register {
                        cursor: pointer;
                    }

                    /* 미응답 모달 버튼 */
                    .btn-primary {
                        width: 100px;
                    }

                    .inquiryMainTable li{
                        margin-bottom: 5px;
                    }

                    /* ========== 문의 - 아이디 - 제목 - 내용 - 답변 ========== */
                    /* 문의/아이디 표시 li 태그 */
                    .inquiry-title{
                    }
                    
                    /* 제목 li 태그 */
                    .table1 .title {
                        padding-left: 80px;
                    }

                    /* 문의글 상세보기시 출력되는 태그 li */
                    .inquiry-content {
                        margin-left: 80px;
                        width: 850px;
                        border: 1px solid;
                        padding: 15px;
                        
                    }

                    /* 답변 상세보기시 출력되는 태그 li */
                    .answer {
                        margin-left: 110px;
                        border: 1px solid;
                    }


                </style>

        </head>


        <body>
            <div id="wrap">
                <%@ include file="../include/header.jsp" %>
                    <section>
                    </section>
                    <h1 style="margin-top: 20px;"> 문의사항 관리페이지 </h1>
                    <!-- <div class="register-btn btn"> 문의글 등록하기</div> -->

                    <c:if test="${empty list}">
                        <div class="title-2">
                            문의 내역이 없습니다. </div>

                    </c:if>

                    <c:if test="${not empty list}">
                        <ul class="inquiryMainTable">
                            <c:forEach var="list" items="${list}">
                                <li class="inquiryTable">
                                    <ul class="inner-inquiryTable table1">
                                        <ul class="table1-secondchild">
                                            <li class="inquiry-title" data-serial-num="${list.serialNumber}">[문의]&nbsp;${list.userId}</li>
                                            <li class="title"> 제목 : ${list.inquiryTitle}</li>
                                        </ul>
                                        <ul class="table1-secondchild detailAnswerclick"></ul>
                                        <li data-serial-num="0" class="if-setting"></li>
                                    </ul>
                                    <ul class="inner-inquiryTable table2">
                                        <li data-serial-num="${list.serialNumber}">${list.inquiryPrettierDate}</li>
                                        <c:if test="${list.answer == null}">
                                            <li class="answer-register"> <a id="registerBtn" type="button"
                                                    class="btn btn-primary" data-bs-toggle="modal"
                                                    data-bs-target="#answerregisterModal" data-bs-whatever=""
                                                    href="#"> [미응답] </a> </li>
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
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </li>

                          <c:forEach var="n" begin = "1" end = "10" step="1">
                          <li class="page-item"><a class="page-link" href="#">${n}</a></li>
                          </c:forEach>

                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </a>
                          </li>
                        </ul>
                      </nav>

                    <div class="modal fade" id="answerregisterModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">답변 작성하기</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label">문의글 제목:</label>
                                            <div class="form-control" id="recipient-name"></div>
                                        </div>
                                        <input type="hidden" id="hidden-serialNumber" name="serialNumber">
                                        <div class="mb-3">
                                            <label for="message-text" class="col-form-label">답글 작성:</label>
                                            <textarea class="form-control" id="message-text" name="answer"
                                                maxlength="800"></textarea>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Close</button>
                                    <button type="button" id="register-success" class="btn btn-primary">작성완료</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        // 부트 모달 스트랩 스크립트
                        var answerregisterModal = document.getElementById('answerregisterModal')
                        answerregisterModal.addEventListener('show.bs.modal', function (event) {

                            // Button that triggered the modal
                            var button = event.relatedTarget
                            // Extract info from data-bs-* attributes
                            var recipient = button.getAttribute('data-bs-whatever')
                            // If necessary, you could initiate an AJAX request here
                            // and then do the updating in a callback.
                            //
                            // Update the modal's content.
                            var modalTitle = answerregisterModal.querySelector('.modal-title')
                            var modalBodyInput = answerregisterModal.querySelector('.modal-body input')

                            modalTitle.textContent = '답변 작성하기 ' + recipient
                            modalBodyInput.value = recipient

                            // 모달을 띄울 때 다음 작업(수정완료처리)을 위해 댓글번호를 모달에 달아두자.
                            const $modal = document.querySelector('.modal');
                            console.log('$modal');

                        })

                        // 답변등록 화면 열기 처리 이벤트                
                        const $modal = $('#answerregisterModal');

                        document.getElementById('registerBtn').onclick = e => {
                            console.log('답변 등록 버튼 클릭');
                              console.log(e.target.parentElement.parentElement.parentElement.firstElementChild.firstElementChild.lastElementChild.textContent);
                             console.log(e.target.parentElement.parentElement.firstElementChild.dataset.serialNum);
                            const title = e.target.parentElement.parentElement.parentElement.firstElementChild.firstElementChild.lastElementChild.textContent;
                            const serialNumber = e.target.parentElement.parentElement.firstElementChild.dataset.serialNum;
                            document.getElementById('recipient-name').textContent = title;
                            document.getElementById('hidden-serialNumber').value = serialNumber;
                        }

                        //답글 달기 비동기 처리 이벤트
                        $serialNumInput = document.getElementById('hidden-serialNumber');
                        $contentInput = document.getElementById('message-text');

                        document.getElementById('register-success').onclick = e => {
                            console.log(e.target);
                            // const serialNumber = e.target.closest('.table1').firstElementChild.dataset.serialNum;

                            //서버로 전송할 데이터들
                            const answerDate = {
                                serialNumber: $serialNumInput.value,
                                answer: $contentInput.value
                            };


                            // POST요청을 위한 요청 정보 객체
                            const reqInfo = {
                                method: 'POST',
                                headers: {
                                    'content-type': 'application/json'
                                },
                                body: JSON.stringify(answerDate)
                            };

                            console.log(reqInfo);



                            fetch('http://localhost:8383/member/admin/answer-register/', reqInfo)
                                .then(res => res.text())
                                .then(msg => {
                                    if (msg === 'answer-register-success') {
                                        alert('답변 등록 성공!!');
                                        $modal.modal('hide'); // 모달창 닫기
                                        // showReplies(); // 댓글 새로불러오기
                                        location.href = '/member/admin/findall-inquiry';
                                    } else {
                                        alert('답변 등록 실패 실패!!');
                                    }
                                });
                        }

                    </script>

            </div>

            <script>
                //문의글 상세보기 태그 만들기 함수
                function makeInquiryDOM(oneInquiry, $ul) {
                    const $li = document.createElement('li');
                    $li.textContent = oneInquiry.inquiry;
                    $li.dataset.serialNumber = oneInquiry.serialNumber;
                    $li.classList.add('inquiry-content');
                    $ul.append($li);
                }

                // 답변 상세보기 태그 만들기 함수 makeAnswerDOM
                function makeAnswerDOM(oneInquiry, $ul) {
                    const $li = document.createElement('li');
                    $li.textContent = oneInquiry.answer;
                    $li.dataset.serialNum = oneInquiry.serialNumber;
                    $li.classList.add('answer');
                    $ul.append($li);

                }

                // //글쓰기로 이동하기 버튼 이벤트
                // const $writeBtn = document.querySelector('.register-btn');
                // $writeBtn.addEventListener('click', e => {
                //     location.href = '/member/inquiry-register';
                // })

                const $table = document.querySelector(".inquiryMainTable");

                //답변 자세히 보기버튼이벤트
                const $detail = document.querySelector('.detail');
                console.log($detail);

                $table.addEventListener('click', e => {
                    if (!e.target.matches('.table2 li')) return;
                    console.log('detail 클릭:', e.target);
                    let serialNumber = e.target.parentElement.firstElementChild.dataset.serialNum;
                    let $ul = e.target.parentElement.parentElement.firstElementChild;
                    console.log(e.target.parentElement.parentElement.firstElementChild.lastElementChild.dataset.serialNum);
                    fetch('http://localhost:8383/member/findone-inquiry/' + serialNumber)
                        .then(res => res.json())
                        .then(oneInquiry => {
                            // console.log('if문 가동전 비교 타겟:',e.target.parentElement.lastElementChild);
                            // console.log('if문 가동전 타겟의 넘버:',e.target.parentElement.lastElementChild.dataset.serialNum);
                            // console.log('if문 가동전 시리얼 넘버:',serialNumber)
                            if (e.target.parentElement.parentElement.firstElementChild.lastElementChild.dataset.serialNum == "0") {
                                console.log('if문 :', e.target.parentElement.parentElement.firstElementChild.lastElementChild.dataset.serialNum);
                                makeAnswerDOM(oneInquiry, $ul);

                            } return;



                            // e.target.parentElement.parentElement.firstElementChild.lastElementChild.dataset.serialNum == oneInquiry.serialNumber

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
                    // console.log(e.target.parentElement.lastElementChild);
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