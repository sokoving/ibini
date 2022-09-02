<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="../include/static-head.jsp" %>
            <link rel="stylesheet" href="/css/inquiry-all.css">
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
                                            
                                            <!-- 모달 버튼 -->
                                            <li class="answer-register"> <a id="registerBtn" type="button"
                                                    class="btn btn-primary" data-bs-toggle="modal"
                                                    data-bs-target="#answerregisterModal"
                                                    data-bs-whatever="${list.serialNumber}" href="#">
                                                    [미응답] </a> </li>
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
                        <nav aria-label="Page navigation example">
                            <ul class="pagination pagination-lg pagination-custom">
                                <c:if test="$pm.prev">
                                    <li class="page-item">
                                        <a class="page-link"
                                            href="/member/admin/findall-inquiry?&pageNum=${pm.beginPage - 1}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                                    <li class="page-item" data-page-num="${n}"><a class="page-link"
                                            href="/member/admin/findall-inquiry?&pageNum=${n}">${n}</a></li>
                                </c:forEach>

                                <c:if test="${pm.next}">
                                    <li class="page-item">
                                        <a class="page-link"
                                            href="/member/admin/findall-inquiry?&pageNum=${pm.endPage - 1}"
                                            aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>


                    <!-- 모달 팝업 모달 답변 쓰기 -->
                    <div class="modal fade" id="answerregisterModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel"></h5>
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


                    <!--================== script =================================-->
                    <!-- page script -->
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

                    </script>


                    <!--   // 부트 모달 스트랩 스크립트 [답변 등록] -->
                    <script>
                        var answerregisterModal = document.getElementById('answerregisterModal')

                        answerregisterModal.addEventListener('show.bs.modal', function (event) {

                            // Button that triggered the modal
                            var button = event.relatedTarget
                            console.log('button :',button); // 클릭된 버튼 태그
                            
                            // Extract info from data-bs-* attributes
                            var recipient = button.getAttribute('data-bs-whatever')
                            console.log('recipient :',recipient); // 클릭된 버튼 태그의 데이터 속성

                            // console.log('모달 클릭시 해당영역의 제목:',button.parentElement.parentElement.parentElement.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.textContent);
                            const titleContent = button.parentElement.parentElement.parentElement.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.textContent;
                            console.log('타이틀내용 :',titleContent); // 클릭된 버튼으로 부터 제목태그 가지고 오기  
                        
                            document.getElementById('recipient-name').textContent = titleContent;
                            console.log('recipient-name:',document.getElementById('recipient-name'));
                            // 제목이 들어가는 div 태그

                            // If necessary, you could initiate an AJAX request here
                            // and then do the updating in a callback.

                            // Update the modal's content.
                            var modalTitle = answerregisterModal.querySelector('.modal-title')
                            console.log('modalTitle :',modalTitle); //<h5> 태그 타이틀 ex)[문의번호 답변 작성]

                            var modalBodyInput = answerregisterModal.querySelector('.modal-body input')
                            console.log('modalBodyInput :',modalBodyInput); // 모달 폼안에있는 input데이터


                            modalTitle.textContent = '[답변 작성] - 문의 번호 [' + recipient + ']';
                            modalBodyInput.value = recipient //hidden 으로 숨겨놓은 serialNumber의 값을 넣기

                            $serialNumInput = document.getElementById('hidden-serialNumber');
                            $contentInput = document.getElementById('message-text');
                            console.log($contentInput);

                            // 모달을 띄울 때 다음 작업(수정완료처리)을 위해 댓글번호를 모달에 달아두자.
                        })

                        //답글 달기 비동기 처리 이벤트
                        document.getElementById('register-success').onclick = e => {
                            console.log(e.target);
                            // const serialNumber = e.target.closest('.table1').firstElementChild.dataset.serialNum;

                            //서버로 전송할 데이터들
                            const answerDate = {
                                serialNumber: $serialNumInput.value,
                                answer: $contentInput.value
                            };

                            if(answerDate.answer.trim() === ''){
                                alert('답변을 입력해주세요');
                                return;
                            }

                            console.log('answerDate:',answerDate);


                            // POST요청을 위한 요청 정보 객체
                            const reqInfo = {
                                method: 'POST',
                                headers: {
                                    'content-type': 'application/json'
                                },
                                body: JSON.stringify(answerDate)
                            };

                            console.log(reqInfo);

                            const $modal = document.querySelector('.modal');
                            console.log('modal?:', $modal);

                            fetch('http://localhost:8383/member/admin/answer-register/', reqInfo)
                                .then(res => res.text())
                                .then(msg => {
                                    if (msg === 'answer-register-success') {
                                        alert('답변 등록 성공!!');
                                        $modal.hide; // 모달창 닫기
                                        // showReplies(); // 댓글 새로불러오기
                                        location.href = '/member/admin/findall-inquiry';
                                    } else {
                                        alert('답변 등록 실패 실패!!');
                                    }
                                });
                        }

                        // // 댓글 목록을 서버로부터 비동기요청으로 불러오는 함수
                        // function showReplies(pageNum = 1) {

                        //     fetch(URL + '?boardNo=' + bno + '&pageNum=' + pageNum)
                        //         .then(res => res.json())
                        //         .then(replyMap => {
                        //             // console.log(replyMap.replyList);
                        //             makeReplyDOM(replyMap);
                        //         });
                        // }

                    </script>

            </div>

            <!-- 문의/답변 상세 조회 script -->
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

                // 접기 버튼 태그 만들기 함수 makeCloseDOM
                function makeCloseDOM($ul) {
                    const $btn = document.createElement('div');
                    $btn.textContent = '접기';
                    $btn.classList.add('close-btn');
                    $ul.append($btn);
                }

                // ===== 조회 화면 접기 이벤트 =====
                const $table = document.querySelector(".inquiryMainTable");

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

                    // 접기 버튼 숨기기위해 노드 설정
                    const $closeBtn = e.target
                    // console.log('?????? : ',$closeBtn);

                    //부모노드.removeChild(삭제할노드) 노드 삭제하기 문법

                    if ($removeTargetC.classList.contains('inquiry-content')) {
                        $parentNode.removeChild($removeTargetT);
                        $parentNode.removeChild($removeTargetC);
                        $closeBtn.classList.add('hidden');

                    };

                    console.log('if문 돌기전', $removeTargetAC.classList.contains('answer'))
                    if ($removeTargetAC.classList.contains('answer')) {
                        console.log('if문 돌고', $removeTargetAC.classList.contains('answer'))
                        $parentNodeA.removeChild($removeTargetAT);
                        $parentNodeA.removeChild($removeTargetAC);
                        $closeBtn.classList.add('hidden');

                    };
                })

                // ===== 상세보기 요청 이벤트 - 상세보기 클릭시 답변도 나오게 하기 =====
                $table.addEventListener('click', e => {

                    // console.log(e.target);
                    if (!e.target.matches('.table1 li')) return;
                    // console.log('li 클릭됨! -', e.target);
                    // console.log('일련번호 확인 : ', e.target.parentElement.parentElement.parentElement.firstElementChild.firstElementChild);

                    let serialNumber = e.target.parentElement.parentElement.parentElement.firstElementChild.firstElementChild.dataset.serialNum;
                    let $ul = e.target.parentElement.parentElement;
                    // console.log(e.target.parentElement.lastElementChild);
                    // console.log('글번호 :', serialNumber);

                    //비동기로 문의글 상세정보 가지고 오기              
                    fetch('http://localhost:8383/member/findone-inquiry/' + serialNumber)
                        .then(res => res.json())
                        .then(oneInquiry => {
                            if (e.target.parentElement.parentElement.lastElementChild.dataset.serialNumber == oneInquiry.serialNumber) {
                                return;
                            };
                            makeInquiryDOM(oneInquiry, $ul);

                            // 접기 버튼 활성화 시키기
                            const $closeBtn = e.target.parentElement.parentElement.parentElement.nextElementSibling.nextElementSibling
                            $closeBtn.classList.remove('hidden');

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

                                        } return;
                                        // e.target.parentElement.parentElement.firstElementChild.lastElementChild.dataset.serialNum == oneInquiry.serialNumber
                                    });
                            }

                        });
                })

                    // ============== 즉시실행함수 =================
                    (function () {
                        appendPageActive();
                    })();


                // ======== msg alert ========
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