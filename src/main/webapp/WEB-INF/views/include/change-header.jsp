<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<header>
    <div id="headerWrap">
        <div class="logo">
            <span class="logo-font">IBINI BOOKS</span>
        </div>
        <div class="infoBar">
<%--            이름 --%>

                <c:if test="${loginUser.auth == 'COMMON'}">
                    <span class="userName">${loginUser.userName} 님</span>
                </c:if>
                <c:if test="${loginUser.auth == 'ADMIN'}">
                    <span class="userName">[${loginUser.userName}] 님</span>
                </c:if>

            <!-- 일반회원이 보는 헤드 메뉴 -->
            <c:if test="${loginUser.auth == 'COMMON' || empty loginUser}">
                    <c:if test="${loginUser == null}">
                        <span class="logIn" onclick="location.href='/member/sign-in'">logIn</span>
                        <span class="myPage" onclick="location.href='/member/sign-up'">Sign-up</span>
                    </c:if>

                    <c:if test="${loginUser != null}">
                        <span class="logIn" onclick="location.href='/myPage'">MyPage</span>
                        <span class="myPage" onclick="location.href='/member/sign-out'">Log-out</span>
                    </c:if>
            </c:if>

            <!-- 관리자가 보는 헤드 메뉴 -->
            <c:if test="${loginUser.auth == 'ADMIN'}">
                <ul>
                    <li><a href="#">관리자메뉴</a></li>
                    <li><a href="/member/admin/findall-inquiry">문의하기</a></li>

                    <c:if test="${loginUser != null}">
                        <li><a href="/member/sign-out">로그아웃</a></li>
                    </c:if>
                </ul>
            </c:if>

        </div>
    </div>
</header> <!-- end header -->
<style>
    @font-face {
        font-family: 'NanumSquareRound';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    header{
        height: 40px;
        /*border-bottom: 1px solid #ffca3d;*/
        box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 3px 0px, rgba(0, 0, 0, 0.078) 0px 1px 2px 0px;
        background-color: black;
        /*background-color: #ffca3d;*/
        font-family: 'NanumSquareRound', sans-serif;
    }
    #headerWrap{
        display: flex;
        width: 1000px;
        margin: 0 auto;
        height: 40px;

    }
    #headerWrap .logo {
        width: 60%;
        padding: 0 20px;
        margin: auto 0;
    }
    #headerWrap .logo .logo-font{
        font-size: 30px;
        font-weight: 700;
        color: #ffca3d;
    }

    #headerWrap .infoBar{
        width: 40%;
        display: flex;
    }
    #headerWrap .infoBar .userName{
        margin: auto 0;
        padding-left: 70px;
        width: 50%;
        font-weight: 700;
        color: #ffca3d;
    }
    #headerWrap .infoBar .logIn{
        width: 25%;
        margin: auto 0;
        font-weight: 700;
        color: #ffca3d;
    }
    #headerWrap .infoBar .myPage{
        width: 25%;
        margin: auto 0;
        font-weight: 700;
        color: #ffca3d;
    }

</style>