<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <%@ include file="../include/static-head.jsp" %>
  <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a81368914c.js"></script>

  <style>
    .wave {
      position: fixed;
      bottom: 0;
      left: 0;
      height: 100%;
      z-index: -1;
    }

    section {
      border: none;
    }

    .img {
      display: flex;
      justify-content: flex-end;
      align-items: center;
    }

    .img img {
      width: 300px;
    }


    .btn {
      display: block;
      width: 35%;
      height: 50px;
      border-radius: 20px;
      outline: none;
      border: none;
      background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
      background-size: 200%;
      /* font-size: 1.2rem; */
      color: #fff;
      font-family: 'Poppins', sans-serif;
      text-transform: uppercase;
      /* margin: 1rem 0; */
      cursor: pointer;
      transition: .5s;
      text-align: center;
    }

    .btn:hover {
      background-position: right;
    }



    h2 {
      border-bottom: 2px solid;
      width: 420px;
      text-align: center;
      font-family: 'poppins', sans-serif;
    }

    h5 {
      border-bottom: 2px solid;
      width: 400px;
      height: 40px;
      margin-bottom: 40px;
      font-family: 'poppins', sans-serif;
    }

    #nickmodify-btn {
      display: inline;
      margin-left: 15px;
      height: 35px;
      width: 120px;
      padding-bottom: 20px;

    }

    #main-section {
      margin: 200px auto 0;
    }

    #content-box {
      display: flex;
      margin-top: 0;
      border: none;
      padding: 0px;
    }

    #content {
      margin-left: 130px;
    }

    .thank-msg {
      margin-top: 30px;
      font-family: 'poppins', sans-serif;
      font-weight: 700;
      font-size: 38px;
    }

    #modify-btn {
      margin-right: 5px;
      width: 130px;
    }

    #joinOut-btn {
      margin-right: 5px;
      width: 130px;
    }

    #main-btn {
      width: 130px;
    }

    div.btn-group {
      margin-top: 50px;
    }
  </style>

</head>

<body>
<!-- header -->
<%@ include file="../include/change-header.jsp" %>

  <div id="wrap">



    <section id="main-section">
      <img class="wave" src="/img/signin-1.png">
      <h2 class="title">${loginUser.userName}님의&nbsp;&nbsp;&nbsp;회원정보</h2>

      <section id="content-box">
        <div class="img">
          <img src="/img/ibini_logo_5.png">
          <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg -->
        </div>

        <div id="content">
          <!-- userId -->
          <h5>userId :&nbsp;&nbsp;&nbsp;${loginUser.userId}</h5>

          <!-- userName-->
          <h5>nick-name :&nbsp;&nbsp;&nbsp;${loginUser.userName}

            <!-- 닉네임 수정 버튼 -->
            <input type="button" id="nickmodify-btn" class="btn" value="닉네임 수정">
          </h5>

          <!-- email-->
          <h5>email:&nbsp;&nbsp;&nbsp;${loginUser.email}</h5>

          <!-- 가입일자-->
          <h5>join-date :&nbsp;&nbsp;&nbsp;${loginUser.prettierDate}</h5>

          <div class="btn-group">
            <!-- 비밀번호 수정 -->
            <input type="button" id="modify-btn" class="btn" value="비밀번호 수정">

            <!-- 회원 탈퇴 -->
            <input type="button" id="joinOut-btn" class="btn" value="회원 탈퇴">

            <!-- 돌아가기 버튼 -->
            <input type="button" id="main-btn" class="btn" value="main"></a>
            <!-- main-back-btn -->
          </div>

          <div class="thank-msg">ibinibooks를 이용해 주셔서 감사합니다.</div>

        </div>
      </section>
    </section>
  </div>

  <script>
    const date = '${loginUser.prettierDate}';
    console.log(date);

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