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


    <title>MYPAGE</title>
</head>
<style>
    @font-face {
        font-family: 'NanumSquareRound';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    #wrap {
        /* background: rgb(78, 135, 182); */
        display: flex;
        width: 1000px;
        margin: 50px auto;
        font-family: 'NanumSquareRound';
        /*padding: 50px 0;*/
    }

    #wrap #user-Info{
        background-color: #eeedeb;
        width: 80%;
        padding: 30px;
        border-radius: 10px;
    }


    /** img */
    #wrap #user-Info .img{
        padding: 20px 25%;
    }
    #wrap #user-Info .img img{
        margin: 0 auto;
    }




    #wrap #user-Info .Info-comment{
        padding: 10px;
        margin-bottom: 30px;
        border-bottom: 2px solid #000;

    }
    #wrap #user-Info .Info-comment .nickName-Info{
        font-size: 28px;
        font-weight: 700;
    }
    #wrap #user-Info .Info-comment .name{
        font-size: 45px;
        font-weight: 700;
    }

    /* total Page CSS */
    #wrap #user-Info .userPage{
        background-color: #fffaee;
        padding: 10px;
        border-radius: 10px;
    }

    #wrap .comment{
        padding: 0 10px;
        /* background: rgb(52, 148, 108); */
        margin: 8px 0;
    }


    /** user id css*/
    #wrap .id{
        margin-bottom: 20px;
    }


    /* nickName CSS  */
    #wrap #user-Info .nickName{
        margin-bottom: 20px;
    }
    /* 닉네임 BtnCss */
    #nickBtn{
        background-color: rgb(0, 0, 0);
        border-radius: 10px;
        border: 0px;
        padding: 5px 10px;
        color: #ffca3d;
        font-weight: 700;
        box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 2px 0px;
    }
    #nickBtn:hover{
        background-color: #ffca3d;
        color: #000;
        border: 0px;
        box-shadow: rgba(0, 0, 0, 0.2) 0px 1px 2px 0px;
    }
    #wrap .nickName .comment span{
        margin-right: 20px;
    }

    /* Email CSS */
    #wrap #user-Info .Email{
        margin-bottom: 20px;
    }

    #wrap #user-Info .Date{
        margin-bottom: 20px;
    }
    #wrap #user-Info #info-Btn{
        width: 40%;
        margin: 0 auto;
        justify-content: space-around;
    }
    #wrap .thanksTo{
        padding: 20px;
        margin-top: 50px;
    }




</style>
<body>
<!-- header -->
<%@ include file="../include/change-header.jsp" %>
    <div id="wrap">
        <div id="sideBar">
            <h2>MyPage</h2>
            <a href="/myPage">User-Info</a>
            <a href="">Help</a>
            <h3>Setting</h3>
            <a href="/myPage/platform">Platform</a>
            <a href="/myPage/genre">Genre</a>
            <a href="">BookMark</a>
            <a href="">BookMemo</a>
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
                <button type="button" id="joinOut-btn">회원탈퇴</button>
            </div>
            <div class="thanksTo">
                <span>IBINI BOOKS를 이용해주셔서 감사합니다.</span>
            </div>

        </section>

    </div>
    <script>

        let date = '${loginUser.prettierDate}';
        console.log('date : ', date);

        let elementById = document.getElementById('nickmodify-btn');
        console.log(elementById);
        const $nickModifyBtn = document.getElementById('nickmodify-btn');
        console.log($nickModifyBtn);

        const $modifyBtn = document.getElementById('modify-btn');
        console.log($modifyBtn);

        const $joinOutBtn = document.getElementById('joinOut-btn');
        console.log($joinOutBtn);

        const $mainBtn = document.getElementById('main-btn');
        console.log($mainBtn);

        $nickModifyBtn.onclick = e => {
            location.href = '/member/modifyNick-check';
        }

        $modifyBtn.onclick = e => {
            location.href = '/member/modifyPw-check';
        }

        $joinOutBtn.onclick = e => {
            location.href = '/member/join-out';
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