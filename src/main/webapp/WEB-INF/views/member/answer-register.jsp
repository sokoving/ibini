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
                        <form action="/member/admin/answer-register" method="post" id="answer-register-form">
                            <input type="hidden" name="serialNumber" value="${inquiry.serialNumber}">

                            <div>제목 : ${inquiry.inquiryTitle}"></div> 
                            <div>등록일자 : ${inquiry.inquiryPrettierDate}</div>
                            <div>문의 내용 : ${inquiry.inquiry}</div>

                            <input type="text" name="answer" id="answer" placeholder="답변내용을 작성하세요.">

                            <div class="answer-register-btn btn">답변 작성</div>
                            <div class="list-btn btn"> 목록보기 </div>
                        </form>
                    </section>

                    <script>
                       console.log('${inquiry.serialNumber}');
                       console.log('${inquiry}');

                        $answerBtn = document.querySelector('.answer-register-btn');
                        $listBtn = document.querySelector('.list-btn');
                        $form = document.getElementById('answer-register-form');


                        $answerBtn.onclick = e => {
                            $form.submit();
                        }

                        console.log($listBtn);

                        $listBtn.onclick = e => {
                            location.href = '/member/inquiry?userId=${loginUser.userId}';
                        }

                    </script>
        </body>

        </html>