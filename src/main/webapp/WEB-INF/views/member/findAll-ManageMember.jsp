<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="../include/static-head.jsp" %>
            <link rel="stylesheet" href="/css/findAll-manageMember.css">
            <style>


                tr{
                    border-color: black;
                }


            </style>
        </head>


        <body>
            <div id="wrap">
                <%@ include file="../include/header.jsp" %>
                    <section>
                    </section>
                    <h1 style="margin: 20px 0 20px 0; "> 회원관리 페이지  </h1>
                    <div class="sub-title">
                    <h5 class="sub-title1"> [현재 회원 : ${ints[0]}명] </h5>
                    <h5 class="sub-title2"> [탈퇴한 회원 : ${ints[1]}명]</h5>
                    <h5 class="sub-title3"> <a class="btn" href="/member/reason-break-away">탈퇴사유관리</a></h5>
                    </div>
                    <!-- <div class="register-btn btn"> 문의글 등록하기</div> -->

                    <c:if test="${empty mmList}">
                        <div class="title-2">
                            현재 가입한 회원이 없습니다. </div>


                    </c:if>
                    <c:if test="${not empty mmList}">
                        <table class="table table-success table-striped mainAdminTable"
                           style="text-align: center;">
                            <tr>
                                <th>ID</th>
                                <th>e-mail</th>
                                <th>가입상태</th>
                            </tr>
                            <c:forEach var="list" items="${mmList}">
                                <tr>
                                    <td>${list.userId}</td>
                                    <td>${list.email}</td>
                                    <c:if test="${list.userCondition == 'true'}">
                                    <td style="color:#0d6efd; font-weight: 700;">${list.userCondition}</td>
                                    </c:if>
                                    <c:if test="${list.userCondition == 'false'}">
                                    <td style="color:#d11b1ba3; font-weight: 700;">${list.userCondition}</td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                            
                        </table>
                    </c:if>
                    

                    <!--================== script =================================-->


        </body>

        </html>