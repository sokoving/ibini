<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <%@ include file="../include/static-head.jsp" %>
  <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a81368914c.js"></script>
  <link rel="stylesheet" href="/css/member-join-out.css">

 

</head>

<body>
 <!-- header -->
 <%@ include file="../include/change-header.jsp" %>
  <div id="wrap">


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
    // console.log(msg);

    $joinoutBtn.onclick = e => {
      // console.log($input.value);
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