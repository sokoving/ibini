<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
  <title>sign-in</title>
  <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a81368914c.js"></script>
  <link rel="stylesheet" href="/css/member-findpw.css">



  
</head>

<body>

  <img class="wave" src="/img/signin-1.png">
  <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png -->
  <div class="container">
    <div class="img">
      <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg">
    </div>
    <div class="login-content">


      <!-- 인증코드가 없는 경우 보여지는 웹브라우저 -->
      <c:if test="${empty code}">
        <form action="/member/findpw" name="findpw" method="post" id="findpw">
          <img src="/img/ibini_logo_4.png">
          <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg -->
          <h2 class="title"> 비밀번호 찾기</h2>
          <div class="input-div one">
            <div class="i">
              <!-- <i class="fas fa-user"></i> -->
            </div>
            <div class="div">
              <h5>userId</h5>
              <input type="text" name="userId" id="userId" class="input" maxlength="14">
            </div>
          </div>
          <div class="input-div pass">
            <div class="i">
              <!-- <i class="fas fa-lock"></i> -->
            </div>
            <div class="div">
              <h5>email</h5>
              <input type="text" class="input" id="email" name="email">
            </div>
          </div>

          <!-- 인증번호 버튼 -->
          <input type="submit" class="btn" value="인증번호 받기">

        </form>
      </c:if>

      <!-- 인증코드가 있는 경우 보여지는 웹브라우저 화면 -->
      <c:if test="${not empty code}">
        <form action="/member/checkcode" method="post">
          <img src="/img/ibini_logo_4.png">
          <input type="hidden" name="code" id="code" value="${code}">
          <input type="hidden" name="userId" value="${userId}">
          <div class="input-div two">
            <div class="i">
              <!-- <i class="fas fa-user"></i> -->
            </div>
            <div class="div">
              <h5>인증코드를 입력해주세요.</h5>
              <input type="text" class="input" name="inputcode" id="inputcode" class="inputcode" maxlength="8">
            </div>
          </div>

          <!-- 인증번호 버튼 -->
          <input type="submit" class="btn" value="인증코드 확인">
        </form>


      </c:if>


    </div>
  </div>




  <script>
    const code = '${code}';
    // console.log(code);

    const inputs = document.querySelectorAll(".input");


    function addcl() {
      let parent = this.parentNode.parentNode;
      parent.classList.add("focus");
    }

    function remcl() {
      let parent = this.parentNode.parentNode;
      if (this.value == "") {
        parent.classList.remove("focus");
      }
    }


    inputs.forEach(input => {
      input.addEventListener("focus", addcl);
      input.addEventListener("blur", remcl);
    });

    //Source :- https://github.com/sefyudem/Responsive-Login-Form/blob/master/img/avatar.svg

    const msg = '${msg}';
    if (msg === 'not-find-userId') {
      alert('존재하지 않는 회원 입니다.');
    }

    if (msg === 'email-discord') {
      alert('회원가입된 이메일과 일치하지 않습니다.');
    }

    if (msg === 'discord-code') {
      alert('인증코드가 일치하지 않습니다. 확인 후 다시 입력해주세요.');
    }
  </script>






</body>

</html>