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
        margin-top: 15px;
    }

    .btn:hover {
        background-position: right;
    }

    h2 {
        border-bottom: 2px solid;
        width: 400px;
        text-align: center;
        font-family: 'poppins', sans-serif;
    }

    h5 {
        /* border-bottom: 2px solid; */
        width: 440px;
        height: 40px;
        /* margin-bottom: 30px; */
        font-family: 'poppins', sans-serif;
        padding-top: 20px;
    }

    /* #nickmodify-btn {
        display: inline;
        margin-left: 15px;
        height: 35px;
        width: 120px;
        padding-bottom: 20px;
      } */

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
        margin-top: 100px;
        margin-left: 130px;
    }

    .thank-msg {
        margin-top: 30px;
        font-family: 'poppins', sans-serif;
        font-weight: 700;
        font-size: 38px;
    }

    #main-btn {
        width: 200px;
    }

    .c-red {
        color: red;
    }

    .c-blue {
        color: blue;
    }

    #user_name {
        border: 2px solid;
        border-radius: 10px;
        width: 400px;
        height: 40px;
        font-family: 'poppins', sans-serif;
    }

    #joinout-btn {
        margin-right: 5px;
        width: 200px;
    }

    #password {
        border: 2px solid;
        border-radius: 10px;
        width: 400px;
        height: 40px;
        font-family: 'poppins', sans-serif;
    }

    select::-ms-expand {
        display: none;
    }

    select {
        -o-appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
    }

    select {

        width: 150px;
        height: 35px;
        background: url('https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png') calc(100% - 5px) center no-repeat;
        background-size: 20px;
        padding: 5px 30px 5px 10px;
        border-radius: 4px;
        outline: 0 none;
    }

    select option {
        background: black;
        color: #fff;
        padding: 3px 0;
    }

    select#selbox {
        margin-top: 5px;
        width: 400px;
    }

    textarea {
        width: 400px;
        resize: vertical;
        margin-top: 5PX;
    }
</style>

</head>

<body>
  <div id="wrap">
    <%@ include file="../include/header.jsp" %>

    <section id="main-section">
      <img class="wave" src="/img/signin-1.png">
      <h2 class="title">회원탈퇴</h2>

      <section id="content-box">
          <div class="img">
              <img src="/img/ibini_logo_5.png">
              <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg -->
          </div>

          <div id="content">

              <!-- userName-->
              <!-- <h5>nick-name :&nbsp;&nbsp;&nbsp;${loginUser.userName} </h5> -->


              <form action="/member/join-out" name="joinoutForm" method="post" id="joinoutForm">
                  <input type="hidden" name="userId" value="${loginUser.userId}">

                  <h5>회원 탈퇴를 하시려면 패스워드를 입력해주세요.</h5>
                  <input type="password" size="17" maxlength="20" id="password" name="password"
                      required="required" aria-required="true" placeholder="password"></td>
                  <span id="nameChk"></span>

                  <div class="selectBox"></div>
                  <select id="selbox" name="reasonNum">
                      <option value="0">회원탈퇴 사유를 선택해주세요.</option>
                      <option value="1">서비스 이용이 불편</option>
                      <option value="2">관리 및 피드백이 잘 안됨</option>
                      <option value="3">에러가 많음</option>
                      <option value="4">직접입력</option>
                  </select>
                  <!-- //상단의 select box에서 '직접입력'을 선택하면 나타날 인풋박스 -->
                  <textarea type="text" id="selboxDirect" name="outReason" maxlength="400"></textarea>

              </form>


              <div class="btn-group">
                  <!-- 회원 탈퇴 버튼 -->
                  <input type="submit" id="joinout-btn" class="btn" value="회원탈퇴">
                  <!-- 돌아가기 버튼 -->
                  <input type="button" id="main-btn" class="btn" value="main"></a>
                  <!-- main-back-btn -->
              </div>
          </div>


</div>

<!-- <div class="thank-msg">ibinibooks를 이용해 주셔서 감사합니다.</div> -->

</div>
</section>
</section>
</div>

<script>
  $(function () {
      //직접입력 인풋박스 기존에는 숨어있다가
      $("#selboxDirect").hide();
      $("#selbox").change(function () {
          //직접입력을 누를 때 나타남
          if ($("#selbox").val() == "4") {
              $("#selboxDirect").show();
          } else {
              $("#selboxDirect").hide();
          }
      })
  })
</script>


  <script>
    const $regForm = document.getElementById('joinoutForm');
    const $input = document.getElementById('password');
    const $joinoutBtn = document.getElementById('joinout-btn');
    const msg = '${msg}';
    console.log(msg);

    $joinoutBtn.onclick = e => {
      console.log($input.value);
      if ($input.value == '') {
        alert('비밀번호를 입력해주세요.');
        return;
      }

      if (confirm('회원탈퇴를 하시면 지금 등록된 아이디와 이메일로 재가입이 불가능합니다. /n정말로 회원탈퇴를 진행 하시겠습니까?')) {
        $regForm.submit();
      }
    }

    if (msg === 'fail') {
      alert('현재 비밀번호가 일치하지 않습니다. 확인후 재입력해주세요.');
    }

    if (msg === 'not-reasonInput') {
      alert('탈퇴 사유를 입력해주세요');
    }

    
  </script>


  <script>
    const $mainBtn = document.getElementById('main-btn');
    $mainBtn.onclick = e => {
      location.href = '/';
    }
  </script>
</body>

</html>