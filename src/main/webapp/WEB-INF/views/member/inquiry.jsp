<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="../include/static-head.jsp" %>
                <link rel="stylesheet" href="/css/inquiry.css">
        </head>


        <body>
            <div id="wrap">
                <%@ include file="../include/header.jsp" %>
                    <section>
                        <h1> 문의하기 </h1>
                        <!-- 모달 버튼 -->
                        <div class="inquiry-register"> <a id="registerBtn" type="button" class="btn btn-primary"
                                data-bs-toggle="modal" data-bs-target="#inquiryregisterModal"
                                data-bs-whatever="" href="#" style="background-color: #ffd668; ">

                                [문의글 등록하기] </a> </div>

                        <!-- 모달 팝업 모달 문의글 쓰기 -->
                        <div class="modal fade" id="inquiryregisterModal" tabindex="-1"
                            aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                                <input type="hidden" id="user-id" name="userId" value="${loginUser.userId}">
                                                
                                                <div for="recipient-name" class="col-form-label"> 제목: </div>
                                                <input type="text" id="inquirytitle" name="inquiryTitle" 
                                                 style="border: 1px solid gray; width: 465px;">
                                                <!-- <div class="form-control" id="recipient-name"></div> -->
                                            </div>
                                            <div class="mb-3">
                                                <label for="message-text" class="col-form-label">문의사항:</label>
                                                <textarea class="form-control" id="message-text" name="inquiry"
                                                    maxlength="800"></textarea>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Close</button>
                                        <button type="button" id="register-success"
                                            class="btn btn-primary">작성완료</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 모달 적용 전 문의글 등록 -->
                        <!-- <div class="register-btn btn"> 문의글 등록하기 </div> -->
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

                                                <li class="title">                                                 
                                                    <c:if test="${list.newInquiryArticle}">
                                                    <span class="badge rounded-pill bg-danger">new</span>
                                                    </c:if>
                                                    제목 : ${list.inquiryTitle}
                                                </li>
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
                                                    <span class="badge rounded-pill bg-danger" style="line-height: 1.3; height: 27px; margin-right: 3px;">new</span>
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
            <!-- 문의글 등록 검증 jQuery -->

            <!-- // 문의글 등록하기 모달 -->
            <!--   // 부트 모달 스트랩 스크립트 [답변 등록] -->
            <script>
                var inquiryregisterModal = document.getElementById('inquiryregisterModal')

                inquiryregisterModal.addEventListener('show.bs.modal', function (event) {

                    // **** Button that triggered the modal
                    var button = event.relatedTarget // 클릭된 버튼 태그

                    // **** Extract info from data-bs-* attributes
                    // var recipient = button.getAttribute('data-bs-whatever') // 클릭된 버튼태그의 데이터속성

                    // **** If necessary, you could initiate an AJAX request here
                    // **** and then do the updating in a callback.
                    //
                    // **** Update the modal's content.
                    var modalTitle = inquiryregisterModal.querySelector('.modal-title') // 모달창의 제목 <h5> 태그
                    var modalBodyInput = inquiryregisterModal.querySelector('.modal-body input') // 모달 폼안에있는 input데이터
                    // console.log('modalBodyInput :',modalBodyInput); // 모달 폼안에있는 input데이터

                    modalTitle.textContent = '[문의글 작성]';

                    $userIdInput = document.getElementById('user-id');
                    $inquiryTitleInput = document.getElementById('inquirytitle');
                    $contentTextInput = document.getElementById('message-text');
                    console.log($contentTextInput);

                })

                  //문의사항 등록 비동기 처리 이벤트
                            document.getElementById('register-success').onclick = e => {
                            console.log(e.target);
                            const userId = '${loginUser.userId}';
                            console.log(userId);

                            //서버로 전송할 데이터들
                            const inquiryData = {
                                userId: $userIdInput.value,
                                inquiryTitle: $inquiryTitleInput.value,
                                inquiry : $contentTextInput.value
                            };

                            if(inquiryData.inquiryTitle.trim() === ''){
                                alert('제목을 입력해주세요');
                                return;
                            }

                            if(inquiryData.inquiry.trim() === ''){
                                alert('문의사항을 입력해주세요.');
                                return;
                            }
                            
                            console.log('검증 : ',inquiryData.inquiryTitle);


                            // POST요청을 위한 요청 정보 객체
                            const reqInfo = {
                                method: 'POST',
                                headers: {
                                    'content-type': 'application/json'
                                },
                                body: JSON.stringify(inquiryData)
                            };

                            console.log(reqInfo);

                            const $modal = document.querySelector('.modal');
                            console.log('modal?:', $modal);

                            fetch('http://localhost:8383/member/inquiry-register/', reqInfo)
                                .then(res => res.text())
                                .then(msg => {
                                    if (msg === 'inquiry-register-success') {
                                        alert('문의 사항이 등록 되었습니다.');
                                        $modal.hide; // 모달창 닫기
                                        // showReplies(); // 댓글 새로불러오기
                                        location.href = '/member/inquiry?userId='+userId;
                                    } else {
                                        alert('문의 사항이 등록되지 않았습니다. 입력 내용을 확인해주세요.');
                                    }
                                });
                        }



                // //글쓰기로 이동하기 버튼 이벤트
                // const $writeBtn = document.querySelector('.register-btn');
                // $writeBtn.addEventListener('click', e => {
                //     location.href = '/member/inquiry-register';
                // })



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

                // 그런데 체크박스를 동적으로 만들어주는 경우에는 위와 같은 태그가 먹지 않았다. 
                // 찾아보니 동적 태그일 경우에는 document.ready의 이벤트가 작동하지 않는다. 
                // document.ready 는 화면이 최초에 로드되었을 때에 화면 안에 있는 태그들에 이벤트를 걸기 때문에, 
                // 로드되었을 때 존재하지 않는 태그에 대해서는 이벤트를 걸 수 없는 것이다


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
                            console.log(e.target.parentElement.parentElement.parentElement.lastElementChild);
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

                                            // 문의글조회+답글조회 될때 접기 버튼 태그 만들기
                                            const $ulClose = e.target.parentElement.parentElement.nextElementSibling.nextElementSibling;
                                            // const $ulClose = e.target.parentElement.parentElement.parentElement.parentElement.lastElementChild;

                                        } return;

                                    });
                            }

                        });

                })

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