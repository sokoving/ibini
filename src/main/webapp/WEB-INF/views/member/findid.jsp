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
  <link rel="stylesheet" href="/css/member-findid.css">



  
</head>

<body>

  <!-- <img class="wave" src="/img/signin-1.png"> -->
  <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png -->
  <div class="container">
    <div class="img">
      <img src="/img/ibiniLogo.png">
    </div>
    <div class="login-content">


      <!-- 등록된 eamil로 아이디 찾기 -->
      <c:if test="${userid == null}">
        <form action="/member/findid" name="findid" method="post" id="findid">
          <img src="/img/ibini_logo_4.png">
          <!-- https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg -->
          <h2 class="title"> 아이디 찾기</h2>
          <div class="input-div one">
            <div class="i">
              <!-- <i class="fas fa-user"></i> -->
            </div>
            <div class="div">
              <h5>e-mail</h5>
              <input type="text" name="email" id="email" class="input" maxlength="30">
            </div>
          </div>
          

          <!-- 아이디 찾기 버튼 -->
          <input type="submit" class="btn" style="padding: 0;" value="아이디 찾기">

        </form>
      </c:if>


      <!-- id찾기 성공시 출력되는 화면 -->
      <c:if test="${userid != null}">
        <div>
          <img src="/img/ibini_logo_4.png">
          <div class="input-div two">
            <div class="i">
              <!-- <i class="fas fa-user"></i> -->
            </div>
            <div class="div">
              <h5>회원님의 아이디 : "${userid}" </h5>
            </div>
          </div>

          <!-- 로그인 페이지로 이동 -->
          <a href="/member/sign-in" class="btn"> 로그인 </a>
          <a href="/member/findpw" class="btn"> 비밀번호 찾기 </a>
        </div>
        </c:if>
    </div>
  </div>




  <script>
    const userid = '${userid}';
    // console.log(userid);

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
    if (msg === 'not-found-userid') {
      alert('입력하신 e-mail과 일치하는 id를 찾지 못했습니다. 확인후 다시 입력해주세요.');
    }

  </script>






</body>

</html>