<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html class="html">
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="keywords" content="Yulian Brito, Yulian, Brito, Frontend Developer, Sign Up Sign In 1"/>
                <meta name="author" content="Yulian Brito"/>
                <title>Sign Up / Sign In 1</title>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"/>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                crossorigin="anonymous">
            <!-- reset css -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
            <style>
                 /* ===========================
                   General Styles
               ============================ */

               *, :after, :before{
                 box-sizing: border-box;
               }

               .html{
                 position: relative;
               }

               .body{
                 padding: 0;
                 margin: 0;
                 font-family: 'Montserrat', sans-serif;
                 min-height: 100vh;
                 display: flex;
                 align-items: center;
                 justify-content: center;
                 perspective: 1000px;
                 background: #f3f3f3;
               }

               /* ===========================
                   Choose Form
               ============================ */

               .form-container{
                 position: absolute;
                 margin: auto;
                 top: 0;
                 right: 0;
                 bottom: 0;
                 left: 0;
                 width: 380px;
                 height: 585px;
                 overflow: hidden;
                 box-shadow: 0 20px 20px rgba(0, 0, 0, .2), 0px 0px 50px rgba(0, 0, 0, .2);
                 border-radius: 30px;
                 background: #f3f3f3;
               }

               .form-container__arrow{
                 position: absolute;
                 margin: auto;
                 top: 20px;
                 right: initial;
                 bottom: initial;
                 left: -120px;
                 width: 10px;
                 height: 10px;
                 color: #8dabfb;
                 z-index: 10;
                 opacity: 1;
                 -webkit-transition: left 2s;
                 -moz-transition: left 2s;
                 -o-transition: left 2s;
                 transition: left 2s;
                 cursor: pointer;
               }

               .overlay{
                 position: absolute;
                 margin: initial;
                 top: initial;
                 right: initial;
                 bottom: initial;
                 left: initial;
                 width: inherit;
                 height: inherit;
                 -webkit-animation: 1.5s fadeInTitle ease;
                 -moz-animation: 1.5s fadeInTitle ease;
                 -o-animation: 1.5s fadeInTitle ease;
                 animation: 1.5s fadeInTitle ease;
                 -webkit-transition: opacity 2s;
                 -moz-transition: opacity 2s;
                 -o-transition: opacity 2s;
                 transition: opacity 2s;
                 background: #3ba4fa url(https://i.ibb.co/dkW0tm9/img-1.png) center no-repeat;
                 background-size: contain;
               }

               @keyframes fadeInTitle{
                 0%{
                   opacity: 0;
                 }
                 25%{
                   opacity: 0;
                 }
                 100%{
                   opacity: 1;
                 }
               }

               .choose-form{
                 position: absolute;
                 margin: initial;
                 top: initial;
                 right: initial;
                 bottom: initial;
                 left: initial;
                 width: inherit;
                 height: inherit;
                 z-index: 5;
               }

               .title{
                 position: absolute;
                 margin: auto;
                 top: -62px;
                 right: 0;
                 bottom: 0;
                 left: 0;
                 width: inherit;
                 height: 100px;
                 text-align: center;
                 color: #fff;
                 text-shadow: 0 0.3rem 0.5rem #555;
                 -webkit-animation: 1.5s fadeInTitle ease;
                 -moz-animation: 1.5s fadeInTitle ease;
                 -o-animation: 1.5s fadeInTitle ease;
                 animation: 1.5s fadeInTitle ease;
                 -webkit-transition: opacity 2s;
                 -moz-transition: opacity 2s;
                 -o-transition: opacity 2s;
                 transition: opacity 2s;
               }

               .title__h1{
                 font-weight: 700;
                 letter-spacing: .05rem;
                 font-size: 2rem;
               }

               .buttons{
                 text-align: center;
                 position: absolute;
                 margin: auto;
                 top: 296px;
                 right: 0;
                 bottom: 0;
                 left: 0;
                 width: inherit;
                 height: 110px;
                 -webkit-animation: 1.5s fadeInTitle ease;
                 -moz-animation: 1.5s fadeInTitle ease;
                 -o-animation: 1.5s fadeInTitle ease;
                 animation: 1.5s fadeInTitle ease;
                 -webkit-transition: opacity 2s;
                 -moz-transition: opacity 2s;
                 -o-transition: opacity 2s;
                 transition: opacity 2s;
               }

               .buttons__signup{
                 position: absolute;
                 margin: auto;
                 top: -40px;
                 right: 0;
                 bottom: 0;
                 left: 0;
                 padding: 7px 0;
                 border: none;
                 border-radius: 10px;
                 width: 200px;
                 height: 30px;
                 display: block;
                 outline: none;
                 text-align: inherit;
                 text-transform: uppercase;
                 text-decoration: none;
                 letter-spacing: 0.1em;
                 font-size: 12px;
                 font-weight: 500;
                 color: #fff;
                 background: #4f73d9;
                 box-shadow: 0 15px 30px rgba(79, 115, 217, .36);
                 -webkit-transition:  bottom 2s;
                 -moz-transition:  bottom 2s;
                 -o-transition:  bottom 2s;
                 transition: bottom 2s;
                 cursor: pointer;
               }

               .buttons__signup:hover{
                 -webkit-transition: .3s linear;
                 -moz-transition: .3s linear;
                 -o-transition: .3s linear;
                 transition: .3s linear;
                 box-shadow: 0 0 0 rgba(233, 30, 99, 0);
               }

               .buttons__signup--login{
                 top: 40px;
                 -webkit-transition:  bottom 1s;
                 -moz-transition:  bottom 1s;
                 -o-transition:  bottom 1s;
                 transition: bottom 1s;
               }

               /* ===========================
                   Login Form
               ============================ */

               .login-form{
                 position: absolute;
                 margin: auto;
                 top: 0;
                 right: 0;
                 bottom: 0;
                 left: 0;
                 width: inherit;
                 height: 400px;
                 text-align: center;
                 opacity: 0;
                 -webkit-transition: opacity 2s;
                 -moz-transition: opacity 2s;
                 -o-transition: opacity 2s;
                 transition: opacity 2s;
               }

               .form-wrapper{
                 margin: 0 auto;
                 width: 250px;
                 height: 250px;
                 display: block;
               }

               .form-wrapper__label{
                 display: block;
                 text-align: left;
                 text-transform: uppercase;
                 text-decoration: initial;
                 letter-spacing: .1em;
                 font-size: 12px;
                 font-weight: 600;
                 color: #8dabfb;
               }

               .form-wrapper__input{
                 margin: 5px 0 10px 0;
                 width: 250px;
                 height: 30px;
                 outline: none;
                 border: none;
                 background: none;
                 font-size: 12px;
                 border-bottom: 1px solid #8dabfb;
                 opacity: .8;
               }

               .form-wrapper__input::placeholder{
                 color: #8dabfb;
                 opacity: .8;
               }

               .login-form__forgot-password{
                 display: block;
                 text-align: right;
                 text-transform: uppercase;
                 text-decoration: none;
                 letter-spacing: .05em;
                 font-size: 12px;
                 font-weight: 500;
                 color: #8dabfb;
               }

               .login-form__forgot-password:hover{
                 opacity: 0.5;
                 -webkit-transition: .3s linear;
                 -moz-transition: .3s linear;
                 -o-transition: .3s linear;
                 transition: .3s linear;
               }

               .buttons__signup--login-form{
                 -webkit-transition: none;
                 -moz-transition: none;
                 -o-transition: none;
                 transition: none;
                 top: -66px;
               }

               .social-media{
                 position: absolute;
                 margin: auto;
                 top: initial;
                 right: 0;
                 bottom: 0;
                 left: 0;
                 width: inherit;
                 height: 150px;
               }

               .title__h2{
                 margin: 25.63px;
                 margin-bottom: 1rem;
                 font-size: 11px;
                 font-weight: 700;
                 text-transform: uppercase;
                 color: #8dabfb;
               }

               .title__h2::before{
                 content: "";
                 position: absolute;
                 margin: auto;
                 top: 30px;
                 right: initial;
                 bottom: 0;
                 left: 0;
                 width: 65px;
                 height: initial;
                 border-top: 1px solid #8dabfb;
                 opacity: .8;
               }

               .title__h2::after{
                 content: "";
                 position: absolute;
                 margin: auto;
                 top: 30px;
                 right: 0;
                 bottom: 0;
                 left: initial;
                 width: 65px;
                 height: initial;
                 border-top: 1px solid #8dabfb;
                 opacity: .8;
               }

               .buttons__signup--social{
                 position: relative;
                 margin: 10px auto;
                 top: 5px;
                 text-align: center;
                 -webkit-transition: none;
                 -moz-transition: none;
                 -o-transition: none;
                 transition: none;
                 background: #3ba4fa;
                 box-shadow: 0 15px 30px rgba(59, 164, 250, .36);
               }

               /* ===========================
                   Register Form
               ============================ */

               .buttons__signup--sign-up-form{
                 top: 5px;
                 -webkit-transition: none;
                 -moz-transition: none;
                 -o-transition: none;
                 transition: none;
               }

               /* ===========================
                   Responsive
               ============================ */

               @media (max-height: 599px){
                 .form-container{
                   margin: 1rem auto;
                   position: relative;
                   width: 300px;
                   height: 460px;
                 }

                 .form-wrapper{
                   margin-top: 24px;
                 }

                 .buttons__signup--login-form{
                   top: -17px;
                 }

                 .buttons__signup--sign-up-form{
                   top: 54px;
                 }
               }

               @media (max-width: 400px){
                 .form-container{
                   width: 320px;
                 }
               }

               @media (max-width: 320px){
                 .form-container{
                   width: 300px;
                   height: 460px;
                 }

                 .form-wrapper{
                   margin-top: 24px;
                 }

                 .buttons__signup--login-form{
                   top: -17px;
                 }

                 .buttons__signup--sign-up-form{
                   top: 54px;
                 }
               }
            </style>
        </head>


<body class="body">

  <!-- Choose Form -->

    <section class="form-container">
      <span id="arrowClick" class="form-container__arrow"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i></span>
      <div class="overlay"></div>
      <div class="choose-form">
        <div class="title">
          <h1 class="title__h1">Welcome<br>Start for free</h1>
        </div>
        <div class="buttons">
          <a id="signUp" class="buttons__signup" href="#">Sign up</a>
          <a id="login" class="buttons__signup buttons__signup--login" href="#">Login</a>
        </div>
      </div>

  <!-- Login Form -->

      <div class="login-form">
        <div class="form-wrapper">
          <form method="post">
            <label class="form-wrapper__label" for="login-username">account</label>
            <input id="login-username" class="form-wrapper__input" type="text" placeholder="Username" name="account" required>
            <label class="form-wrapper__label" for="login-password">Password</label>
            <input id="login-password" class="form-wrapper__input" type="password" placeholder="Password" name="password" pattern=".{3,}" title="Password must contain at least 3 characters" required>
            <a class="login-form__forgot-password" href="#">Forgot password?</a>
            <button class="buttons__signup buttons__signup--login-form" type="submit" href="#">Login</button>
          </form>

  <!-- Social-Media -->

          <div class="social-media">
            <h6 class="title__h2">Or connect with</h6>
            <a class="buttons__signup buttons__signup--social" href="#"><i class="fab fa-facebook-f" aria-hidden="true"></i>&nbsp;facebook</a>
            <a class="buttons__signup buttons__signup--social" href="#"><i class="fab fa-google" aria-hidden="true"></i>&nbsp;google</a>
          </div>
        </div>
      </div>

  <!-- Register Form -->

      <div class="login-form login-form--register">
        <div class="form-wrapper">
          <form method="post">
            <label class="form-wrapper__label" for="signup-email">Email</label>
            <input id="signup-email" class="form-wrapper__input" type="email" placeholder="example@hotmail.com" name="email" required>
            <label class="form-wrapper__label" for="signup-username">Username</label>
            <input id="signup-username" class="form-wrapper__input" type="text" placeholder="Username" name="username" required>
            <label class="form-wrapper__label" for="signup-password">Password</label>
            <input id="signup-password" class="form-wrapper__input" type="password" placeholder="Password" name="password" pattern=".{3,}" title="Password must contain at least 3 characters" required>
            <button class="buttons__signup buttons__signup--sign-up-form" type="submit">Sign up</button>
          </form>

  <!-- Social-Media -->

          <div class="social-media">
            <h2 class="title__h2">Or connect with</h2>
            <a class="buttons__signup buttons__signup--social" href="#"><i class="fab fa-facebook-f" aria-hidden="true"></i>&nbsp;facebook</a>
            <a class="buttons__signup buttons__signup--social" href="#"><i class="fab fa-google" aria-hidden="true"></i>&nbsp;google</a>
          </div>
        </div>
      </div>
    </section>

  </body>
</html>




  <script>

window.addEventListener("load",start)

function start(){

/* ===========================
    Elements Selectors
============================ */

  const elm = {
    arrow: document.querySelector(".form-container__arrow"),
    overlay: document.querySelector(".overlay"),
    title: document.querySelector(".title"),
    signUpButton: document.querySelector(".buttons__signup"),
    loginButton: document.querySelector(".buttons__signup--login"),
    loginForm: document.querySelector(".login-form"),
    registerForm: document.querySelector(".login-form--register")
  }

/* ===========================
    Properties Object
============================ */

  const props = {
    left: "left: 20px;",
    bottom: "bottom: -500px;",
    transition1: "transition: bottom 1s;",
    transition2: "transition: bottom 2s;",
    opacity0: "opacity: 0;",
    opacity1: "opacity: 1;",
    trnsDelay: "transition-delay: 1s;",
    zIndex: "z-index: 6;",
    left0: "left: 0;",
    trnsDelay0: "transition-delay: 0s;",
    zIndex0: "z-index: 0;",
    leftM120: "left: -120px;"
  }

/* ===========================
    Elements Array
============================ */

  const elms = [elm.arrow, elm.overlay, elm.title, elm.signUpButton, elm.loginButton, elm.loginForm, elm.registerForm]

  function transition (elements, props){
    for (let i = 0; i < elements.length; i++){
      elements[i].setAttribute("style", `${props[i]}`)
    }
  }

/* ===========================
    Events
============================ */

  document.getElementById("signUp").onclick = function (){

    const properties = [props.left, props.opacity0, props.opacity0, `${props.transition1} ${props.bottom}`, `${props.transition2} ${props.bottom}`, props.opacity0, `${props.opacity1} ${props.trnsDelay} ${props.zIndex}`]

    transition(elms, properties)
  }

  document.getElementById("login").onclick = function (){

    const properties = [props.left, props.opacity0, props.opacity0, `${props.transition1} ${props.bottom}`, `${props.transition2} ${props.bottom}`, `${props.opacity1} ${props.trnsDelay} ${props.zIndex}`, props.opacity0]

    transition(elms, properties)
  }

  document.getElementById("arrowClick").onclick = function (){

    const properties = [props.leftM120, props.opacity1, props.opacity1, props.opacity1, props.opacity1, `${props.opacity0} ${props.trnsDelay0} ${props.zIndex0}`, `${props.opacity0} ${props.trnsDelay0} ${props.zIndex0}`]

    transition(elms, properties)
  }
}

  </script>

  <script>
    $(document).ready(function () {
    });
  </script>

       <script>
                  const msg = '${msg}';
                  if(msg === 'success') {
                      alert('회원탈퇴가 정상적으로 처리 되었습니다. 이용해주셔서 감사합니다.');
                  }
              </script>

</body>

</html>
<!-- 
        <body>

            <h1> Welcome~ This is ibini's index page!! </h1>

            <c:if test="${loginUser == null}">
                <div class="login-menu"><a href="/member/sign-in">sign-in</a></div>
                <div class="login-menu"><a href="/member/sign-up">sign-up</a></div>
            </c:if>

            <c:if test="${loginUser != null}">
                <div class="login-menu"><a href="/member/my-page">My page</a></div>
                <div class="login-menu"><a href="/member/sign-out">sign-out</a></div>
            </c:if>


        </body>

        </html> -->