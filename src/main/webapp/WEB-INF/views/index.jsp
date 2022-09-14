<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>

  <%@ include file="./include/static-head.jsp" %>
</head>

<style>
  #carouselExampleControlsNoTouching {
    padding-top: 50px;
  }
</style>

<body>
  <!-- header -->
    <%@ include file="./include/change-header.jsp" %>
    <div id="wrap">

      <div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="/img/003.png" class="d-block w-100" alt="슬라이드1">
          </div>
          <div class="carousel-item">
            <img src="/img/004.png" class="d-block w-100" alt="슬라이드2">
          </div>
          <div class="carousel-item">
            <img src="/img/005.png" class="d-block w-100" alt="슬라이드3">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>


        <div id="content-wrap">
            <a href="/list">포스트 전체 목록</a> <br>
            <a href="/post/write/${account}">새 포스트 쓰기</a> <br>
            <a href="/myPage/myPage">마이페이지</a> <br>
        </div>
    </div>


  



    <script>
      const auth = '${loginUser.auth}';
      console.log(auth);

      

        const msg = '${msg}';
        if (msg === 'join-out-success') {
            alert('회원탈퇴가 정상적으로 처리 되었습니다.');
            }

        if (msg === 'modify-success') {
        alert('비밀번호 변경 완료');
        }

        if (msg === 'modify-fail') {
        alert('비밀번호 변경 실패');
        }


    </script>

</body>

</html>