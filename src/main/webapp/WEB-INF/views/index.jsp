<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>

  <%@ include file="./include/static-head.jsp" %>
</head>


<body>
  <!-- header -->
    <%@ include file="./include/change-header.jsp" %>
    <div id="wrap">

          <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="/img/ibini_logo_5.png" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5>IBINI BOOKS</h5>
                  <p>읽은 웹소설을 등록해주세요!</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="/img/localhost_8383_post_detail_14.png" class="d-block w-100" alt="디테일페이지이미지">
                <div class="carousel-caption d-none d-md-block">
                  <h5>IBINI BOOKS</h5>
                  <p>여러 정보를 한 눈에 확인 할 수 있습니다.</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="/img/ibini-WideLogo.png" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5>IBINI BOOKS</h5>
                  <p>연관성 있는 웹소설들을 한눈에 확인하세요!</p>
                </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
            </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
          </div>

        <div id="content-wrap">
            <h1> Welcome~ This is ibini's index page!! </h1>

            <a href="/list">포스트 전체 목록</a> <br>
            <a href="/post/write/${account}">새 포스트 쓰기</a> <br>
            <a href="/upload-form">파일 업로드 테스트</a> <br>
            <a href="/api/findtitle">검색및 기능등록 테스트</a>
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