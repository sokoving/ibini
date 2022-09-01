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
                        <form action="/member/inquiry-modify" method="post" id="inquiry-modify-form">
                            <input type="hidden" name="serialNumber" value="${inquiry.serialNumber}">

                            <input type="text" name="inquiryTitle" id="inquiryTitle" placeholder="제목" value="${inquiry.inquiryTitle}">
                            <input type="text" name="inquiry" id="inquiry" placeholder="문의글" value="${inquiry.inquiry}">

                            <div>답변 : ${inquiry.answer}</div>

                            <div class="modify-btn btn">수정하기</div>
                            <div class="list-btn btn"> 목록보기 </div>
                        </form>
                    </section>

                    <script>
                       console.log('${inquiry.serialNumber}');
                       console.log('${inquiry}');

                        $modBtn = document.querySelector('.modify-btn');
                        $listBtn = document.querySelector('.list-btn');
                        $form = document.getElementById('inquiry-modify-form');


                        $modBtn.onclick = e => {
                            $form.submit();
                        }

                        console.log($listBtn);

                        $listBtn.onclick = e => {
                            location.href = '/member/inquiry?userId=${loginUser.userId}';
                        }

                    </script>
        </body>

        </html>