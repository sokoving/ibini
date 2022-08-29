<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="../include/static-head.jsp" %>
                <style>
                    .btn {
                        cursor: pointer;
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
                            <section>
                                문의 내역이 없습니다.

                            </section>
                        </c:if>

                        <c:if test="${not empty list}">
                            <table class="inquiryTable">
                                <tr>
                                    <th>제목</th>
                                    <th>등록일자</th>
                                    <th>답변</th>
                                </tr>

                                <c:forEach var="list" items="${list}">
                                    <tr>
                                        <td data-serial-num="${list.serialNumber}">${list.inquiryTitle}</td>
                                        <td>${list.inquiryPrettierDate}</td>
                                        <c:if test="${empty list.answer}">
                                            <td>답변 대기중</td>
                                        </c:if>
                                        <c:if test="${not empty list.answer}">
                                            <td>답변완료 </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:if>
            </div>
       
            <script>
                //글쓰기로 이동하기 버튼 이벤트
                const $writeBtn = document.querySelector('.register-btn');
                $writeBtn.addEventListener('click', e => {
                    location.href = '/member/inquiry-register';
                })

                //상세보기 요청 이벤트
                const $table = document.querySelector(".inquiryTable");
                $table.addEventListener('click', e => {
                    if (!e.target.matches('.inquiryTable td')) return;
                    console.log('tr 클릭됨! -', e.target);

                    let serialNumber = e.target.parentElement.firstElementChild.dataset.serialNum;
                    console.log('글번호 :', serialNumber);
                    location.href = '/member/findone-inquiry/' + serialNumber;
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