<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
          <%@ include file="../include/static-head.jsp" %>

        </head>


        <body>
        <div id="wrap">
        <%@ include file="../include/header.jsp" %>

        <section>
            <h1> My Page </h1>

            <c:if test="${loginUser != null}">
                <div class="login-menu"><a href="/member/my-info">내 정보</a></div>
            </c:if>
        </section>
        </div>

        </body>

        </html>