<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- RESET CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- css -->
    <link rel="stylesheet" href="/css/myPageSetting.css"/>
    <link rel="stylesheet" href="/css/myPage.css"/>


    <title>MYPAGE</title>
</head>
<style>

</style>
<body>
<!-- header -->
<%@ include file="../include/change-header.jsp" %>
    <div id="wrap">
        <div id="sideBar">
            <h2>MyPage</h2>
            <a href="/myPage" class="mypage-section-checked">User-Info</a>
            <a href="/member/inquiry?userId=${loginUser.userId}">Help</a>
            <h3>Setting</h3>
            <a href="/myPage/platform">Platform</a>
            <a href="/myPage/genre">Genre</a>
            <a href="/myPage/marklist">BookMark</a>
            <a href="/myPage/memolist">BookMemo</a>
        </div>
        <section id="user-Info">

            <div class="img">
                <img src="/img/ibini-WideLogo.png" alt="logo"
                     style="width: 25vw; min-width: 140px;">
            </div>
            <div class="Info-comment">
                <span class="nickName-Info"><span class="name">${loginUser.userName}</span> 님의 회원정보</span>
            </div>

            <div class="id">
                <div class="comment">
                    <span>USER ID</span>
                </div>
                <div class="userPage">
                    <span class="user-Id">${loginUser.userId}</span>
                </div>
            </div>
            <div class="nickName">
                <div class="comment">
                    <span>NICKNAME</span>
                    <button id="nickmodify-btn" type="button">닉네임 수정</button>
                </div>
                <div class="userPage">
                    <span class="user-nickName">${loginUser.userName}</span>
                </div>
            </div>
            <div class="Email">
                <div class="comment">
                    <span>Email</span>
                </div>
                <div class="userPage">
                    <span class="user-Email">${loginUser.email}</span>
                </div>
            </div>
            <div class="Date">
                <div class="comment">
                    <span>가입일</span>
                </div>
                <div class="userPage">
                    <span class="user-Date">${loginUser.prettierDate}</span>
                </div>
            </div>
            <div id="info-Btn">
                <button type="button" id="modify-btn">비밀번호 수정</button>
                <button type="button" id="main-btn">메인</button>
                <c:if test="${loginMethod != 'KAKAO'}">
                <button type="button" id="joinOut-btn">회원탈퇴</button>
                </c:if>
            </div>
            <div class="thanksTo">
                <span>IBINI BOOKS를 이용해주셔서 감사합니다.</span>
            </div>

        </section>

    </div>
    <script>
        // console.log('loginUser : ', loginUser);
        let date = '${loginUser.prettierDate}';
        console.log('date : ', date);

        let elementById = document.getElementById('nickmodify-btn');
        console.log(elementById);
        const $nickModifyBtn = document.getElementById('nickmodify-btn');
        console.log($nickModifyBtn);

        const $modifyBtn = document.getElementById('modify-btn');
        console.log($modifyBtn);



        if('${loginMethod}' != 'KAKAO'){ 
        const $joinOutBtn = document.getElementById('joinOut-btn');
        console.log($joinOutBtn);
        $joinOutBtn.onclick = e => {
        location.href = '/member/join-out';
         }
       }

        const $mainBtn = document.getElementById('main-btn');
        console.log($mainBtn);

        $nickModifyBtn.onclick = e => {
            location.href = '/member/modifyNick-check';
        }

        $modifyBtn.onclick = e => {
            location.href = '/member/modifyPw-check';
        }


        $mainBtn.onclick = e => {
            location.href = '/';
        }

        const msg = '${msg}';
        console.log(msg);
        if (msg === 'modify-success') {
            alert('비밀번호 변경 성공!');
        }

        if (msg === 'nickModify-success') {
            alert('닉네임 수정 성공!')
        }
    </script>

</body>
</html>