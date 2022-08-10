<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title></title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                crossorigin="anonymous">
            <!-- reset css -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
            <style>
                h1 {
                    font-size: 50px;
                    margin: 0 auto 0;
                    margin: 50px auto 0px;
                    /* background: gray; */
                    width: 80%;
                    text-align: center;
                }

                .login-menu {
                    width: 200px;
                    height: 200px;
                    margin: 100px auto;
                }

                a {
                    font-size: 50px;
                    background: yellow;
                }
            </style>
        </head>


        <body>

            <h1> My Page </h1>

            <c:if test="${loginUser != null}">
                <div class="login-menu"><a href="/member/my-info">내 정보</a></div>
            </c:if>

        </body>

        </html>