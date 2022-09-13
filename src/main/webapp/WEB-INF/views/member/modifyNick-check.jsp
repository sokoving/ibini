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

    #Nickmodify-btn {
      margin-right: 5px;
      width: 200px;
    }
  </style>

</head>

<body>
  <!-- header -->
  <%@ include file="../include/change-header.jsp" %>
  <div id="wrap">


    <section id="main-section">
      <img class="wave" src="/img/signin-1.png">
      <h2 class="title">닉네임 수정</h2>

      <section id="content-box">
        <div class="img">
          <img src="/img/ibini_logo_5.png">
          <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg -->
        </div>

        <div id="content">

          <!-- userName-->
          <!-- <h5>nick-name :&nbsp;&nbsp;&nbsp;${loginUser.userName} </h5> -->


          <form action="/member/modifyNick-check" name="nickModifyForm" method="post" id="nickModifyForm">
            <input type="hidden" name="userId" value="${loginUser.userId}">

            <h5>수정하실 닉네임을 입력해주세요.</h5>
            <input type="text" maxlength="6" id="user_name" name="userName" required="required" aria-required="true"
              placeholder="한글로 최대 6자"></td>
            <span id="nameChk"></span>

          </form>

          <div class="btn-group">
            <!-- 닉네임 수정 버튼 -->
            <input type="submit" id="Nickmodify-btn" class="btn" value="닉네임 변경 하기">
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
    // 수정 닉네임 검증 - jquery
    $(document).ready(function () {
      //입력값 정규 표현식
      const getName = RegExp(/^[가-힣]+$/); // 한글로 써야 한다. 유니코드 시작과 끝 가 - 힣

      const checkArr = [false];

      //이름 입력값 검증.
      $('#user_name').on('keyup', function () {
        //이름값 공백 확인
        if ($("#user_name").val() === "") {
          $('#user_name').css('border-color', 'red');
          $('#nameChk').html('<b class="c-red">[이름은 필수정보!]</b>');
          checkArr[0] = false;
        }
        //이름값 유효성검사
        else if (!getName.test($("#user_name").val())) {
          $('#user_name').css('border-color', 'red');
          $('#nameChk').html('<b class="c-red">[닉네임은 한글로 작성해주세요.]</b>');
          checkArr[0] = false;
        } else {
          $('#user_name').css('border-color', 'skyblue');
          $('#nameChk').html('<b class="c-blue">[올바르게 작성 하셨습니다.]</b>');
          checkArr[0] = true;
        }

      });

      //닉네임 수정 양식 서버로 전송하는 클릭 이벤트
      const $regForm = $('#nickModifyForm');

      $('#Nickmodify-btn').on('click', e => {
        console.log('클릭이벤트 발생확인')
        if (!checkArr.includes(false)) {
          // console.log($regForm);
          $regForm.submit();

        } else {
          alert('입력란을 다시 확인하세요!');
        }
      })



    });
    console.log('${loginUser.userId}');

    const msg = '${msg}';
    console.log(msg);
    if (msg === 'discord') {
      alert('현재 비밀번호가 일치하지 않습니다. 확인후 재입력해주세요.');
    }

    if (msg === 'modify-fail') {
      alert('비밀번호 수정에 실패 했습니다.')
    }

    if (msg === 'nickModify-fail') {
      alert('닉네임 변경에 실패하였습니다.')
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