<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="../include/static-head.jsp" %>
            <link rel="stylesheet" href="/css/member-findAll-manageMember.css">

        </head>


        <body>
              <!-- header -->
            <%@ include file="../include/change-header.jsp" %>
            <div id="wrap">
                    <section>
                    </section>
                    <h1 style="margin-top: 100px;"> 회원 탈퇴사유 관리  </h1>
                    <div class="sub-title">
                    <h5 class="sub-title1"> 현재 회원 : ${ints[0]} </h5>
                    <h5 class="sub-title2"> 탈퇴한 회원 : ${ints[1]}</h5>
                    </div>
                    <!-- <div class="register-btn btn"> 문의글 등록하기</div> -->

                    <c:if test="${empty outReasonList}">
                        <div class="title-2">
                            탈퇴한 회원이 없습니다. </div>


                    </c:if>
                    <c:if test="${not empty outReasonList}">
                        <table class="table table-success table-striped mainAdminTable"
                        style="text-align: center;">
                            <tr>
                                <th>ID</th>
                                <th>탈퇴사유</th>
                            </tr>
                            <c:forEach var="list" items="${outReasonList}">
                                <tr>
                                    <td>${list.userId}</td>
                                    <td>${list.outReason}</td>
                                </tr>
                            </c:forEach>
                            
                        </table>
                    </c:if>
                    

                    <!--================== script =================================-->


        </body>

        </html>