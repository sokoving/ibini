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
                    <h1 style="margin-top: 20px;"> 회원관리 페이지  </h1>
                    <h2> 현재 회원 : ${ints[0]} </h2>
                    <h2> 탈퇴한 회원 : ${ints[1]}</h2>
                    <!-- <div class="register-btn btn"> 문의글 등록하기</div> -->

                    <c:if test="${empty mmList}">
                        <div class="title-2">
                            현재 가입한 회원이 없습니다. </div>

                    </c:if>
                    <c:if test="${not empty mmList}">
                        <table class="mainAdminTable">
                            <tr>
                                <th>ID</th>
                                <th>e-mail</th>
                                <th>가입상태</th>
                            </tr>
                            <c:forEach var="list" items="${mmList}">
                                <tr>
                                    <td>${list.userId}</td>
                                    <td>${list.email}</td>
                                    <td>${list.userCondition}</td>
                                </tr>
                            </c:forEach>
                            
                        </table>
                    </c:if>
                    

                    <!--================== script =================================-->


        </body>

        </html>