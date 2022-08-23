<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ibini books</title>

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <!-- linear icons -->
    <!-- https://linearicons.com/free#cdn -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <!-- naver font -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">



    <!-- slick css || https://kenwheeler.github.io/slick/  -->
    <link rel="stylesheet" href="/css/slick-1.8.1.css">

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- custom css -->
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/post-reg.css">


    <!-- jquery -->
    <script src="/js/jquery-3.3.1.min.js"></script>


    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- custom js -->
    <script src="/js/common.js" defer></script>
    <script src="/js/post-reg.js" defer></script>

</head>

<body>

    <div id="wrap">
        <%@ include file="../include/header.jsp" %>


        <!-- 새 포스트 등록 섹션 -->
        <section class="post-reg-section">
            <div class="inner-section">
                <form id="write-form" action="/post/write" method="post" autocomplete="off"
                    enctype="multipart/form-data">

                    <!-- 임시 : 계정명(나중에 로그인 적용되면 빼기) -->
                    <input type="hidden" name="account" id="" value="ibini">

                    <!-- 히든 : 카테고리 아이디(웹소설 일단 고정)-->
                    <input type="hidden" name="caId" value="1">

                    <!-- 이미지, 제목, 작가, 별점-->
                    <div id="reg-1">
                        <!-- 이미지 -->
                        <div class="img-wrap">
                            <label>
                                <div class="img-box">
                                    클릭으로 <br> 이미지 추가하기
                                    <!-- <input class="file-input" type="file" name="#"> -->
                                </div>
                            </label>
                        </div>

                        <!-- 제목, 작가, 별점 -->
                        <div class="tw-wrap">
                            <div class="span-wrap">
                                <span class="reg-span">책 제목</span>
                                <span class="explain-span">제목을 입력해 주세요</span>
                            </div>
                            <input class="white-box title-input" type="text" name="postTitle" placeholder="제목을 입력해 주세요">

                            <div class="span-wrap">
                                <span class="reg-span">작가</span>
                                <span class="explain-span">작가를 입력해 주세요</span>
                            </div>
                            <input class="white-box writer-input" type="text" name="postWriter"
                                placeholder="작가를 입력해 주세요">

                            <div class="span-wrap">
                                <span class="reg-span">별점</span>
                                <span class="explain-span">1~5 사이의 정수를 입력해 주세요</span>
                            </div>
                            <input class="white-box title-input" type="number" name="starRate" placeholder="예시) 5">


                        </div>
                    </div> <!-- // end reg-1 -->

                    <!-- 플랫폼, 장르 -->
                    <div id="reg-2">
                        <div class="plge-wrap">

                            <!-- 플랫폼 영역 -->
                            <div class="span-wrap">
                                <span class="reg-span">플랫폼</span>
                                <span class="explain-span">새 이름을 입력하고 버튼을 누르면 플랫폼이 추가됩니다 ↓</span>
                            </div>

                            <div class="select-add-wrap">
                                <!-- 플랫폼 선택 -->
                                <div class="divided-select">
                                    <select class="white-box" name="platformId">
                                        <option value="0">플랫폼을 선택하세요</option>
                                        <option value="1">카카오페이지</option>
                                        <option value="2">네이버시리즈</option>
                                        <option value="3">리디북스</option>
                                        <option value="4">다음웹툰</option>
                                        <option value="5">네이버웹툰</option>
                                    </select>
                                </div>

                                <!-- 새 플랫폼 추가 -->
                                <div class="divided-input">
                                    <input class="white-box" type="text" placeholder="새 플랫폼을 추가해 보세요">
                                </div>
                                <div class="divided-btn">
                                    <div class="white-box icon-box ">
                                        <span class="fas fa-plus-square"></span>
                                    </div>
                                </div>
                            </div> <!-- // end (platform) select-add-wrap -->

                            <!-- 장르 영역 -->
                            <div class="span-wrap">
                                <span class="reg-span">장르</span>
                                <span class="explain-span">새 이름을 입력하고 버튼을 누르면 장르가 추가됩니다 ↓</span>
                            </div>

                            <div class="select-add-wrap">
                                <!-- 장르 선택 -->
                                <div class="divided-select">
                                    <select class="white-box" name="genreId" id="">
                                        <option value="0">장르를 선택하세요</option>
                                        <option value="1">판타지</option>
                                        <option value="2">로맨스</option>
                                        <option value="3">무협</option>
                                        <option value="4">아포칼립스</option>
                                        <option value="5">공포</option>
                                    </select>
                                </div>

                                <!-- 새 장르 추가 -->
                                <div class="divided-input">
                                    <input class="white-box" type="text" placeholder="새 장르를 추가해 보세요">
                                </div>
                                <div class="divided-btn">
                                    <div class="white-box icon-box ">
                                        <span class="fas fa-plus-square"></span>
                                    </div>
                                </div>
                            </div> <!-- // end (platform) select-add-wrap -->
                        </div> <!-- // end plge-wrap -->
                    </div> <!-- // end reg-2 -->


                    <!-- 연재 상태, 연재 요일 -->
                    <div id="reg-3">
                        <div class="span-wrap">
                            <span class="reg-span">연재 상태</span>
                        </div>
                        <div class="radio-wrap pub-btn-group">
                            <label class="white-box radio-item checked">연재
                                <input class="ep-radio" type="radio" name="publishStatus" value="1" checked>
                            </label>
                            <label class="white-box radio-item">휴재
                                <input class="ep-radio" type="radio" name="publishStatus" value="2">
                            </label>
                            <label class="white-box radio-item">완결
                                <input class="ep-radio" type="radio" name="publishStatus" value="3">
                            </label>
                        </div>
                        <div class="span-wrap">
                            <span class="reg-span">연재 일시</span>
                        </div>
                        <input class="white-box" type="text" name="publishCycle" placeholder="예시) 월, 금 10시">
                    </div> <!-- // end reg-3 -->

                    <!-- 회차 구분, 현재 회차, 현재 페이지 -->
                    <div id="reg-4">
                        <div class="span-wrap">
                            <span class="reg-span">회차 구분</span>
                        </div>

                        <div class="radio-wrap ep-btn-group">
                            <label class="white-box radio-item checked">회차(화)
                                <input class="ep-radio" type="radio" name="epId" value="0" checked>
                            </label>
                            <label class="white-box radio-item">페이지(p)
                                <input class="ep-radio" type="radio" name="epId" value="1">
                            </label>
                            <label class="white-box radio-item">권수
                                <input class="ep-radio" type="radio" name="epId" value="2">
                            </label>
                            <label class="white-box radio-item">퍼센트(%)
                                <input class="ep-radio" type="radio" name="epId" value="3">
                            </label>
                        </div>

                        <div class="ep-wrap">
                            <div class="ep-input-wrap">
                                <span class="reg-span">현재 회차</span> <!-- 회차는 ${p.epName}으로-->
                                <input class="white-box" type="number" name="curEp">
                            </div>
                            <div class="ep-input-wrap">
                                <span class="reg-span">전체 회차</span> <!-- 회차는 ${p.epName}으로-->
                                <input class="white-box" type="number" name="totalEp">
                            </div>
                        </div>
                    </div>

                    <div id="reg-5">
                        <div class="span-wrap">
                            <span class="reg-span">해시태그</span>
                        </div>
                        <input class="white-box" type="text" name="tagName" placeholder="예시) #태그1 #태그_2">
                    </div>

                    <div id="reg-6">
                        <span class="reg-span">이미지 첨부하기</span>
                        <label>
                            <div class="white-box upload-input">
                                    <span class="upload-right">파일 선택</span>
                                    <!-- <span class="upload-left">클릭으로 이미지를 등록해 보세요</span> -->
                            </div>
                                <!-- <input class="file-input" type="file"> -->
                        </label>
                    </div>



                    <div id="reg-btn">
                        <button class="white-box">등록</button>
                    </div>


                </form> <!-- // end write-form -->





            </div> <!-- // end inner-section -->
        </section> <!-- // end section -->

    </div> <!-- end wrap -->



    <script>
        // start jQuery
        $(document).ready(function () {
            // jQueryTagTest("h1", "태그 잡기 테스트");

            // 포스트 입력 폼 제출 이벤트
            const $regBtn = $('#post-reg-btn');
            // jQueryTagTest($regBtn, "태그 잡기 테스트");
            $regBtn.click(e => {
                $('#post-reg-form').submit();
            })




        });
        // end jQuery
    </script>


</body>

</html>