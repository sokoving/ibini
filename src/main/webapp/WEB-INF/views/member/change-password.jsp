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
      border-bottom: 2px solid gray;
      width: 420px;
      text-align: center;
      font-family: 'poppins', sans-serif;
    }

    h5 {
      /* border-bottom: 2px solid; */
      width: 400px;
      height: 40px;
      /* margin-bottom: 30px; */
      font-family: 'poppins', sans-serif;
      padding-top: 22px;
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
      color: rgb(209 69 69);
    font-weight: 700;
    }

    .c-blue {
      color: #3ad338;
      font-weight: 700;
    }

    #user_name {
      border: 2px solid;
      border-radius: 10px;
      width: 400px;
      height: 40px;
      font-family: 'poppins', sans-serif;
    }

    #pWmodify-btn {
      margin-right: 5px;
      width: 200px;
    }
  </style>

</head>

<body>
<%@ include file="../include/change-header.jsp" %>

  <div id="wrap">

    <section id="main-section">
      <img class="wave" src="/img/signin-1.png">
      <h2 class="title">비밀번호 수정</h2>

      <section id="content-box">
        <div class="img">
          <img src="/img/ibini_logo_5.png">
          <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg -->
        </div>

        <div id="content">

          <!-- userName-->
          <!-- <h5>nick-name :&nbsp;&nbsp;&nbsp;${loginUser.userName} </h5> -->


          <form action="/member/change-password" name="pWmodifyForm" method="post" id="pWmodifyForm">
            <input type="hidden" name="userId" id="originPw" value="${userId}">


            <h5>수정할 비밀번호를 입력해주세요.</h5>
            <input type="password" size="17" maxlength="20" id="password" name="password"
              class="form-control tooltipstered" maxlength="20" required="required" aria-required="true"
              placeholder="영문과 특수문자를 포함한 최소 8자">
            <span id="pwChk"></span>

            <h5>비밀번호를 재확인해주세요.</h5>
            <input type="password" size="17" maxlength="20" id="password_check" name="pw_check"
              class="form-control tooltipstered" maxlength="20" required="required" aria-required="true"
              placeholder="비밀번호가 일치해야합니다.">
            <span id="pwChk2"></span>



          </form>

          <div class="btn-group">
            <!-- 비밀번호 수정 버튼 -->
            <input type="submit" id="pWmodify-btn" class="btn" value="비밀번호 수정하기">
            <!-- 돌아가기 버튼 -->
            <input type="button" id="main-btn" class="btn" value="main"></a>
            <!-- main-back-btn -->
          </div>
        </div>

        <!-- <div class="thank-msg">ibinibooks를 이용해 주셔서 감사합니다.</div> -->

  </div>
  </section>
  </section>
  </div>

  <script>
    console.log('${userId}');



    const msg = '${msg}';
    console.log(msg);

    if (msg === 'modify-fail') {
      alert('비밀번호 수정에 실패 했습니다.')
    }


    //비밀번호 폼 검증 - jquery
    $(document).ready(function () {
      //입력값 검증 정규표현식
      const getPwCheck = RegExp(
        // 영문 숫자가 들어가야하고 특수기호를 하나라도 포함해야 하고 또는 시작을 특수문자로 해도 되고
        // 영문과 숫자가 들어가야한다.
        /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);

      // 입력값 검증 배열
      const checkArr = [false, false];

      //패스워드 입력값 검증.
      $('#password').on('keyup', function () {
        //비밀번호 공백 확인
        if ($("#password").val() === "") {
          $('#password').css('border-color', 'red');
          $('#pwChk').html('<b class="c-red">[패스워드는 필수정보!]</b>');
          checkArr[0] = false;
        }
        //비밀번호 유효성검사
        else if (!getPwCheck.test($("#password").val()) || $("#password").val().length < 8) {
          $('#password').css('border-color', 'red');
          $('#pwChk').html('<b class="c-red">[특수문자 포함 8자이상]</b>');
          checkArr[0] = false;
        } else {
          $('#password').css('border-color', 'skyblue');
          $('#pwChk').html('<b class="c-blue">[참 잘했어요]</b>');
          checkArr[0] = true;
        }

      });

      //패스워드 확인란 입력값 검증.
      $('#password_check').on('keyup', function () {
        //비밀번호 확인란 공백 확인
        if ($("#password_check").val() === "") {
          $('#password_check').css('border-color', 'red');
          $('#pwChk2').html('<b class="c-red">[패스워드확인은 필수정보!]</b>');
          checkArr[1] = false;
        }
        //비밀번호 확인란 유효성검사
        else if ($("#password").val() !== $("#password_check").val()) {
          $('#password_check').css('border-color', 'red');
          $('#pwChk2').html('<b class="c-red">[위에랑 똑같이!!]</b>');
          checkArr[1] = false;
        } else {
          $('#password_check').css('border-color', 'skyblue');
          $('#pwChk2').html('<b class="c-blue">[참 잘했어요]</b>');
          checkArr[1] = true;
        }

      });


      //수정된 비밀번호를 서버로 전송하는 클릭 이벤트
      const $regForm = $('#pWmodifyForm');

      $('#pWmodify-btn').on('click', e => {
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
    const $mainBtn = document.getElementById('main-btn');
    $mainBtn.onclick = e => {
      location.href = '/';
    }
  </script>

</body>

</html>