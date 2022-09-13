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
      <link rel="stylesheet" href="/css/member-sign-in.css">

    </head>

    <body>

      <img class="wave" src="/img/signin-1.png">
      <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png -->
      <div class="container">
        <div class="img">
          <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg">
        </div>
        <div class="login-content">

          <!-- 로그인 창 -->
          <c:if test="${kakaoMsg != 'exist-userId-emailVerification-false'}">
          <form action="/member/sign-in" name="sign-in" method="post" id="signInFrom">

            <img src="/img/ibini_logo_4.png">
            <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg -->
            <h2 class="title">Welcome</h2>


              <div class="input-div one">
                <div class="i">
                  <i class="fas fa-user"></i>
                </div>
                <div class="div">
                  <h5>userId</h5>
                  <input type="text" name="userId" id="signInId" class="input" maxlength="14">
                </div>
              </div>
              <div class="input-div pass">
                <div class="i">
                  <i class="fas fa-lock"></i>
                </div>
                <div class="div">
                  <h5>Password</h5>
                  <input type="password" class="input" maxlength="20" id="signInPw" name="password">
                </div>
              </div>

              <div id="autologin-forgotpassword">
                <!-- 자동 로그인 체크 박스 -->
                <label for="auto-login" id="auto-login">
                  <span>
                    <i class="fas fa-sign-in-alt"></i>
                    자동 로그인
                    <input type="checkbox" id="auto-login" name="autoLogin">
                  </span>
                </label>
                <div>
                  <!-- 아이디 찾기 링크 -->
                  <a href="/member/findid" id="forgotId">아이디를 잊으셨나요? </a>
                  <!-- 비밀번호 찾기 링크 -->
                  <a href="/member/findpw" id="forgotPw">password를 잊으셨나요?</a>
                </div>
              </div>


              <!-- 로그인 버튼 -->
              <input type="submit" class="btn" value="Sign-In">

              <!-- 회원가입 링크 -->
              <a class="sign-up-btn" href="/member/sign-up">Sign-Up</a>

              <!-- 카카오계정 로그인 링크 -->
              <a id="custom-login-btn"
                href="https://kauth.kakao.com/oauth/authorize?client_id=${kakaoAppKey}&redirect_uri=http://localhost:8383${kakaoRedirect}&response_type=code">
                <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="350" />
              </a>
          </form>
          </c:if>


          <!-- 카카오 로그인 연동 확인 -->
          <c:if test="${kakaoMsg == 'exist-userId-emailVerification-false'}">
            <form action="/kakao/email-verification" name="confirm" method="post" id="confirmForm">
              <img src="/img/ibini_logo_4.png">
              <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg -->
              <h2 class="title">Welcome</h2>
              <div class="input-div one">
                <div class="i">
                  <i class="fas fa-user"></i>
                </div>
                <div class="div">
                  <h5></h5>
                  <input type="text" name="userId" id="userId" class="input" maxlength="14" value="${member.userId}">
                </div>
              </div>
              <div class="input-div pass">
                <div class="i">
                  <i class="fas fa-lock"></i>
                </div>
                <div class="div">
                  <h5>Password</h5>
                  <input type="password" class="input" maxlength="20" id="userPassword" name="password">
                </div>
              </div>
              <!-- 연동하기 버튼 -->
              <input type="submit" class="btn" value="연동하기">

              <!-- 돌아가기 버튼 -->
              <a class="sign-up-btn" href="/member/sign-in">로그인 페이지로 돌아가기</a>
            </form>
          </c:if>

        </div>
      </div>




      <script>
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
        if (msg === 'reg-success') {
          alert('회원가입에 성공했습니다. \nibini에 오신걸 환영 합니다.');
        }

        const loginMsg = '${loginMsg}';
        if (loginMsg === 'NO_ACC') {
          alert('존재하지 않는 회원 입니다.');
        } else if (loginMsg === 'NO_PW') {
          alert('비밀번호가 틀렸습니다.');
        }

        const warningMsg = '${message}';
        console.log(warningMsg);
        if (warningMsg == 'no-login') {
          alert('로그인 후 사용할 수 있습니다.')
        }

        const kakaomsg = '${kakaoMsg}';
        console.log(kakaomsg);
        if (kakaomsg == 'exist-userId-emailVerification-false') {
          alert('이미 가입된 이메일 입니다. 카카오 로그인 연동하시겠습니까?')
        }

        if (msg == 'verification-fail') {
          alert('비밀번호가 일치 하지 않습니다. 다시 확인해주세요.')
        }

        if (msg == 'verification-success') {
          alert('카카오계정과 연동에 성공 하였습니다. 로그인 후 서비스를 이용해주세요.')
        }

        if (msg == 'modify-success') {
          alert('비밀번호 변경에 성공하였습니다.')
        }
      </script>






    </body>

    </html>