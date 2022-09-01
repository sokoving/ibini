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

        <body>
            <div id="wrap">
                <%@ include file="../include/header.jsp" %>

                    <section>
                        <div>제목 : ${inquiry.inquiryTitle}</div>
                        <div>등록일자 : ${inquiry.inquiryPrettierDate}</div>
                        <div>문의 내용 : ${inquiry.inquiry} </div>
                        <div>답변 : ${inquiry.answer}</div>

                        <c:if test="${loginUser.auth == 'COMMON'}">
                            <div class="modify-btn btn">수정하기</div>
                            <div class="delete-btn btn">삭제하기</div>
                            <div class="list-btn btn"> 목록보기 </div>
                        </c:if>

                        <c:if test="${loginUser.auth == 'ADMIN'}">
                            <div class="answer-btn btn">답변 등록하기</div>
                            <div class="delete-btn btn">삭제하기</div>
                            <div class="list-btn btn"> 목록보기 </div>

                        </c:if>

                    </section>

                    <script>                        
                        
                        $modBtn = document.querySelector('.modify-btn');
                        $delBtn = document.querySelector('.delete-btn');
                        $listBtn = document.querySelector('.list-btn');
                        $answerBtn = document.querySelector('.answer-btn');                

                        const serialNum = '${inquiry.serialNumber}';
                        console.log(serialNum);

                        //관리자일때 문의사항에 답변 등록 하기
                        $answerBtn.onclick = e =>{
                            location.href = '/member/admin/answer-register?serialNumber=' + serialNum;
                        }

                        //회원일때 문의사항 수정하기
                        $modBtn.onclick = e => {
                            location.href = '/member/inquiry-modify?serialNumber=' + serialNum;
                        }

                        //회원일때 문의사항 삭제하기
                        $delBtn.onclick = e => {
                            confirm('문의 글을 정말 삭제 하시겠습니까?')
                            location.href = '/member/inquiry-delete?serialNumber=' + serialNum;
                        }

                        console.log($listBtn);

                        $listBtn.onclick = e => {
                            location.href = '/member/inquiry?userId=${loginUser.userId}';
                        }

                    </script>
        </body>

        </html>