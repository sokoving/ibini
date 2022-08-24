<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>

          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
          <title>sign-in</title>
          <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
          <script src="https://kit.fontawesome.com/a81368914c.js"></script>



          <style>
            * {
              padding: 0;
              margin: 0;
              box-sizing: border-box;
            }

            body {
              font-family: 'Poppins', sans-serif;
              overflow: hidden;
            }

            .wave {
              position: fixed;
              bottom: 0;
              left: 0;
              height: 100%;
              z-index: -1;
            }

            .container {
              width: 100vw;
              height: 100vh;
              display: grid;
              grid-template-columns: repeat(2, 1fr);
              grid-gap: 7rem;
              padding: 0 2rem;
            }

            .img {
              display: flex;
              justify-content: flex-end;
              align-items: center;
            }

            .login-content {
              display: flex;
              justify-content: flex-start;
              align-items: center;
              text-align: center;
            }

            .img img {
              width: 500px;
            }

            form {
              width: 360px;
            }

            .login-content img {
              height: 100px;
            }

            .login-content h2 {
              margin: 15px 0;
              color: #333;
              text-transform: uppercase;
              font-size: 2.9rem;
            }

            .login-content .input-div {
              position: relative;
              display: grid;
              grid-template-columns: 7% 93%;
              margin: 25px 0;
              padding: 5px 0;
              border-bottom: 2px solid #d9d9d9;
            }

            .login-content .input-div.one {
              margin-top: 0;
            }

            .i {
              color: #d9d9d9;
              display: flex;
              justify-content: center;
              align-items: center;
            }

            .i i {
              transition: .3s;
            }

            .input-div>div {
              position: relative;
              height: 45px;
            }

            .input-div>div>h5 {
              position: absolute;
              left: 10px;
              top: 50%;
              transform: translateY(-50%);
              color: #999;
              font-size: 18px;
              transition: .3s;
            }

            .input-div:before,
            .input-div:after {
              content: '';
              position: absolute;
              bottom: -2px;
              width: 0%;
              height: 2px;
              background-color: #38d39f;
              transition: .4s;
            }

            .input-div:before {
              right: 50%;
            }

            .input-div:after {
              left: 50%;
            }

            .input-div.focus:before,
            .input-div.focus:after {
              width: 50%;
            }

            .input-div.focus>div>h5 {
              top: -5px;
              font-size: 15px;
            }

            .input-div.focus>.i>i {
              color: #38d39f;
            }

            .input-div>div>input {
              position: absolute;
              left: 0;
              top: 0;
              width: 100%;
              height: 100%;
              border: none;
              outline: none;
              background: none;
              padding: 0.5rem 0.7rem;
              font-size: 1.2rem;
              color: #555;
              font-family: 'poppins', sans-serif;
            }

            .input-div.pass {
              margin-bottom: 4px;
            }

            a {
              display: block;
              text-align: right;
              text-decoration: none;
              color: #999;
              font-size: 0.9rem;
              transition: .3s;
            }

            /* a:hover {
              color: #38d39f;
            } */

            .btn {
              display: block;
              width: 100%;
              height: 50px;
              border-radius: 25px;
              outline: none;
              border: none;
              background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
              background-size: 200%;
              font-size: 1.2rem;
              color: #fff;
              font-family: 'Poppins', sans-serif;
              text-transform: uppercase;
              margin: 1rem 0;
              cursor: pointer;
              transition: .5s;
              text-align: center;
            }

            .btn:hover {
              background-position: right;
            }


            @media screen and (max-width: 1050px) {
              .container {
                grid-gap: 5rem;
              }
            }

            @media screen and (max-width: 1000px) {
              form {
                width: 290px;
              }

              .login-content h2 {
                font-size: 2.4rem;
                margin: 8px 0;
              }

              .img img {
                width: 400px;
              }
            }

            @media screen and (max-width: 900px) {
              .container {
                grid-template-columns: 1fr;
              }

              .img {
                display: none;
              }

              .wave {
                display: none;
              }

              .login-content {
                justify-content: center;
              }
            }

            #autologin-forgotpassword{
                display: flex;
                             
            }

            #auto-login{
                font-family: 'Poppins', sans-serif;  
                margin-right: 20px; 
            }

            #forgotPw{
                margin-right: 30px;           
            }

            .sign-up-btn{
                display: block;
              width: 100%;
              height: 50px;
              border-radius: 25px;
              outline: none;
              border: none;
              background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
              background-size: 200%;
              font-size: 1.2rem;
              color: #fff;
              font-family: 'Poppins', sans-serif;
              text-transform: uppercase;
              margin: 1rem 0;
              cursor: pointer;
              transition: .5s;
              text-align: center;
              padding-top: 10px;
            }


            #custom-login-btn img{
              display: block;
              width: 100%;
              height: 50px;
              border-radius: 25px;
              outline: none;
              border: none;
              /* background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f); */
              background-size: 200%;
              font-size: 1.2rem;
              color: #fff;
              font-family: 'Poppins', sans-serif;
              text-transform: uppercase;
              margin: 1rem 0;
              cursor: pointer;
              transition: .5s;
            }

          </style>
        </head>

        <body>

          <img class="wave" src="/img/signin-1.png">
          <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png -->
          <div class="container">
            <div class="img">
              <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg">
            </div>
            <div class="login-content">
              <form action="/member/sign-in" name="sign-in" method="post" id="signInFrom">
                
                <img src="/img/ibini_logo_4.png">
                <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg -->
                <h2 class="title">Welcome</h2>
                <div class="input-div one">
                  <div class="i">
                    <i class="fas fa-user"></i>
                  </div>
                  <div class="div">
                    <h5>account</h5>
                    <input type="text" name="account" id="signInId" class="input" maxlength="14">
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

                <!-- 비밀번호 찾기 링크 -->
                <a href="/member/findpw" id="forgotPw">Forgot Password?</a>
                </div>

                <!-- 로그인 버튼 -->
                <input type="submit" class="btn" value="Sign-In">

                <!-- 회원가입 링크 -->
                <a class="sign-up-btn" href="/member/sign-up">Sign-Up</a>

                  <!-- 카카오계정 로그인 링크 -->
                  <a id="custom-login-btn"
                  href="https://kauth.kakao.com/oauth/authorize?client_id=${kakaoAppKey}&redirect_uri=http://localhost:8383${kakaoRedirect}&response_type=code">
                      <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
                          width="350" />
                  </a>


              </form>
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
              alert('축하합니다. 회원가입에 성공했습니다.');
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

          </script>






        </body>

        </html>