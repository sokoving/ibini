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
      <!-- jquery -->
      <script src="/js/jquery-3.3.1.min.js"></script>
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

        .main-back-btn {
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


        .c-red {
          color: red;
        }

        .c-blue {
          color: blue;
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
          <form action="/member/sign-up" name="sign-in" method="post" id="signUpForm">

            <img src="/img/ibini_logo_4.png">
            <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg -->
            <h2 class="title">회원가입</h2>

            <!-- userId -->
            <div class="input-div one">
              <div class="i">
                <!-- <i class="fas fa-user"></i> -->
              </div>
              <div class="div">
                <h5>userId</h5>
                <input type="text" name="userId" id="signInId" class="input" maxlength="14" required="required"
                  aria-required="true">
              </div>
            </div>
            <span id="idChk"></span>

            <!-- password -->
            <div class="input-div pass">
              <div class="i">
                <!-- <i class="fas fa-lock"></i> -->
              </div>
              <div class="div">
                <h5>Password</h5>
                <input type="password" class="input" size="17" maxlength="20" id="password" name="password"
                  required="required" aria-required="true">
              </div>
            </div>
            <span id="pwChk"></span>

            <!-- password check-->
            <div class="input-div pass">
              <div class="i">
                <!-- <i class="fas fa-lock"></i> -->
              </div>
              <div class="div">
                <h5>Password cehck</h5>
                <input type="password" class="input" size="17" maxlength="20" id="password_check" name="pw_check"
                  required="required" aria-required="true">
              </div>
            </div>
            <span id="pwChk2"></span>

            <!-- userName-->
            <div class="input-div pass">
              <div class="i">
                <!-- <i class="fas fa-lock"></i> -->
              </div>
              <div class="div">
                <h5>userName</h5>
                <input type="text" class="input" maxlength="6" id="user_name" name="userName" required="required"
                  aria-required="true">
              </div>
            </div>
            <span id="nameChk"></span>

            <!-- email-->
            <div class="input-div pass">
              <div class="i">
                <!-- <i class="fas fa-lock"></i> -->
              </div>
              <div class="div">
                <h5>e-mail</h5>
                <input type="email" class="input" id="user_email" name="email" required="required" aria-required="true">
              </div>
            </div>
            <span id="emailChk"></span>


            <!-- 회원가입 버튼 -->
            <input type="button" id="signup-btn" class="btn" value="Sign-Up">

            <!-- 돌아가기 버튼 -->
            <a class="main-back-btn" href="/">main</a>

          </form>
        </div>
      </div>

      <script>
        //회원가입 폼 검증 - jquery
        $(document).ready(function () {
          //입력값 검증 정규표현식
          const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/); // ^ : ~로 시작하는 $ : 끝나는 {4~14} : 최소~최대
          const getPwCheck = RegExp(
            // 영문 숫자가 들어가야하고 특수기호를 하나라도 포함해야 하고 또는 시작을 특수문자로 해도 되고
            // 영문과 숫자가 들어가야한다.
            /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
          const getName = RegExp(/^[가-힣]+$/); // 한글로 써야 한다. 유니코드 시작과 끝 가 - 힣
          const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
          // 영어로 시작하고 + 골뱅이 + 영문 + . + 영문

          // 입력값 검증 배열
          //1.아이디, 2.비번, 3.비번확인, 4.이름 , 5.이메일
          const checkArr = [false, false, false, false, false];

          //1. 아이디 검증
          const $idInput = $('#signInId');
          $idInput.on('keyup', e => {
            // 아이디를 입력하지 않은 경우
            if ($idInput.val().trim() === '') {
              $idInput.css('border-color', 'red');
              $('#idChk').html('<b class = "c-red">[아이디는 필수 정보 입니다.]</b>')
              checkArr[0] = false;
            }

            // 아이디를 패턴에 맞지 않게 입력 하였을 경우
            // test() 메서드는 정규표현식을 검증하여 입력값이 표현식과
            // 일치하면 true, 일치하지 않으면 false를 리턴
            else if (!getIdCheck.test($idInput.val())) {
              $idInput.css('border-color', 'red');
              $('#idChk').html('<b class = "c-red">[영문,숫자로 4~14자 사이로 작성하세요!]</b>')
              checkArr[0] = false;
            }

            // 아이디 중복 확인 검증
            else {

              fetch('/member/check?type=userId&value=' + $idInput.val())
                .then(res => 
                res.text())
                .then(flag => {
                  console.log('flag:', flag);

                  if (flag === 'true') {
                    $idInput.css('border-color', 'red');
                    $('#idChk').html('<b class = "c-red">[중복된 아이디 입니다.]</b>')
                    checkArr[0] = false;

                  } // 정상적으로 입력한 경우
                  else {
                    $idInput.css('border-color', 'skyblue');
                    $('#idChk').html('<b class = "c-blue">[허용 가능한 아이디 입니다.]</b>')
                    checkArr[0] = true;
                  }
                });

            }

          }); //end id check event

          //패스워드 입력값 검증.
          $('#password').on('keyup', function () {
            //비밀번호 공백 확인
            if ($("#password").val() === "") {
              $('#password').css('border-color', 'red');
              $('#pwChk').html('<b class="c-red">[패스워드는 필수정보!]</b>');
              checkArr[1] = false;
            }
            //비밀번호 유효성검사
            else if (!getPwCheck.test($("#password").val()) || $("#password").val().length < 8) {
              $('#password').css('border-color', 'red');
              $('#pwChk').html('<b class="c-red">[특수문자 포함 8자이상]</b>');
              checkArr[1] = false;
            } else {
              $('#password').css('border-color', 'skyblue');
              $('#pwChk').html('<b class="c-blue">[참 잘했어요]</b>');
              checkArr[1] = true;
            }

          });

          //패스워드 확인란 입력값 검증.
          $('#password_check').on('keyup', function () {
            //비밀번호 확인란 공백 확인
            if ($("#password_check").val() === "") {
              $('#password_check').css('border-color', 'red');
              $('#pwChk2').html('<b class="c-red">[패스워드확인은 필수정보!]</b>');
              checkArr[2] = false;
            }
            //비밀번호 확인란 유효성검사
            else if ($("#password").val() !== $("#password_check").val()) {
              $('#password_check').css('border-color', 'red');
              $('#pwChk2').html('<b class="c-red">[위에랑 똑같이!!]</b>');
              checkArr[2] = false;
            } else {
              $('#password_check').css('border-color', 'skyblue');
              $('#pwChk2').html('<b class="c-blue">[참 잘했어요]</b>');
              checkArr[2] = true;
            }

          });

          //이름 입력값 검증.
          $('#user_name').on('keyup', function () {
            //이름값 공백 확인
            if ($("#user_name").val() === "") {
              $('#user_name').css('border-color', 'red');
              $('#nameChk').html('<b class="c-red">[이름은 필수정보!]</b>');
              checkArr[3] = false;
            }
            //이름값 유효성검사
            else if (!getName.test($("#user_name").val())) {
              $('#user_name').css('border-color', 'red');
              $('#nameChk').html('<b class="c-red">[이름은 한글로 ~]</b>');
              checkArr[3] = false;
            } else {
              $('#user_name').css('border-color', 'skyblue');
              $('#nameChk').html('<b class="c-blue">[참 잘했어요]</b>');
              checkArr[3] = true;
            }

          });

          //이메일 입력값 검증.
          const $emailInput = $('#user_email');
          $emailInput.on('keyup', function () {
            //이메일값 공백 확인
            if ($emailInput.val() == "") {
              $emailInput.css('border-color', 'red');
              $('#emailChk').html('<b class="c-red">[이메일은 필수정보에요!]</b>');
              checkArr[4] = false;
            }
            //이메일값 유효성검사
            else if (!getMail.test($emailInput.val())) {
              $emailInput.css('border-color', 'red');
              $('#emailChk').html('<b class="c-red">[이메일 형식 몰라?]</b>');
              checkArr[4] = false;
            } else {

              //이메일 중복확인 비동기 통신
              fetch('/member/check?type=email&value=' + $emailInput.val())
                .then(res => res.text())
                .then(flag => {
                  //console.log(flag);
                  if (flag === 'true') {
                    $emailInput.css('border-color', 'red');
                    $('#emailChk').html(
                      '<b class="c-red">[이메일이 중복되었습니다!]</b>');
                    checkArr[4] = false;
                  } else {
                    $emailInput.css('border-color', 'skyblue');
                    $('#emailChk').html(
                      '<b class="c-blue">[사용가능한 이메일입니다.]</b>'
                    );
                    checkArr[4] = true;
                  }
                });
            }

          });

          //회원가입 양식 서버로 전송하는 클릭 이벤트
          const $regForm = $('#signUpForm');

          $('#signup-btn').on('click', e => {
            console.log('클릭이벤트 발생확인')
            if (!checkArr.includes(false)) {
              // console.log($regForm);
              $regForm.submit();

            } else {
              alert('입력란을 다시 확인하세요!');
            }
          })




        });
      </script>




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

      </script>

    </body>

    </html>