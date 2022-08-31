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
                        <form action="/member/inquiry-register" method="post" id="inquiry-register-form">
                            <input type="hidden" name="userId" value="${loginUser.userId}">

                            <input type="text" name="inquiryTitle" id="inquiryTitle" placeholder="제목">
                            <input type="text" name="inquiry" id="inquiry" maxlength="800" placeholder="문의글 내용" >

                            <div class="register-btn btn">문의글 등록하기</div>
                            <div class="list-btn btn"> 목록보기 </div>
                        </form>
                    </section>

                    <script>
                       console.log('${loginUser.userId}');

                        $registerBtn = document.querySelector('.register-btn');
                        $listBtn = document.querySelector('.list-btn');
                        $form = document.getElementById('inquiry-register-form');


                        $registerBtn.onclick = e => {
                            $form.submit();
                        }

                        console.log($listBtn);

                        $listBtn.onclick = e => {
                            location.href = '/member/inquiry?userId=${loginUser.userId}';
                        }

                        const msg = '${msg}';
                        if(msg == 'inquiry-register-fail'){
                            alert('문의 글 등록에 실패하였습니다.');
                        }

                    </script>
        </body>

        </html>