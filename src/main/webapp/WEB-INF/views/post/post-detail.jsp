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
    <link rel="stylesheet" href="/css/detail.css">



    <!-- jquery -->
    <script src="/main/resources/static/js/jquery-3.3.1.min.js"></script>



    <!-- libraries -->
    <!-- slick js -->
    <script src="/main/resources/static/js/slick-1.8.1.min.js" defer></script>

    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- custom js -->
    <script src="/js/common.js" defer></script>
    <script src="/static/js/detail.js" defer></script>


</head>

<body>


    <div id="wrap">
        <header>
            <div class="inner-header">

                <h1><img src="/main/resources//static//img//ibini_logo_4.png" alt=""></h1>

                <nav>
                    <div class="inner-nav">
                        <div> <a href="#">로그아웃</a> </div>
                        <div><a href="#">마이페이지</a></div>
                    </div>
                </nav>

            </div> <!-- end inner-header -->
        </header> <!-- end header -->


        <section>
            <div id="inner-section">


                <!-- 이미지, 포스트 정보 영역 -->
                <div id="img-post-wrap">
                    <!-- 이미지 영역 -->
                    <div id="img-wrap">

                        <!-- 썸네일 이미지 -->
                        <div id="thumb-img">
                            <img class="post-img"
                                src="https://pbs.twimg.com/media/FaVPI-LVEAAoybZ?format=jpg&name=large" alt="썸네일 이미지">
                        </div>

                        <!-- 첨부 이미지 목록 -->
                        <div id="img-arr-wrap">
                            <button type="button" data-role="none" class="slick-prev slick-arrow" aria-label="Previous"
                                role="button">
                                <i class="fas fa-angle-up"></i>
                            </button>

                            <!-- 슬릭 이미지 목록 -->
                            <div class="img-box-wrap">
                                <div class="img-box">
                                    <img class="post-img"
                                        src="https://pbs.twimg.com/media/FaVPI-LVEAAoybZ?format=jpg&name=large" alt="">
                                </div>
                                <div class="img-box">
                                    <img class="post-img"
                                        src="https://pbs.twimg.com/media/FaVPI-LVEAAoybZ?format=jpg&name=large" alt="">
                                </div>
                                <div class="img-box">
                                    <img class="post-img"
                                        src="https://pbs.twimg.com/media/FaVPI-LVEAAoybZ?format=jpg&name=large" alt="">
                                </div>
                            </div>

                            <button type="button" data-role="none" class="slick-next slick-arrow" aria-label="Next"
                                role="button" style="display: block;">
                                <i class="fas fa-angle-down"></i>
                            </button>
                        </div>

                    </div>

                    <!-- 포스트 정보 영역 -->
                    <div id="post-box">
                        <!-- 별점, 플랫폼, 카테고리 -->
                        <div id="star-plat-ca-wrap">
                            <span class="star-span">⭐⭐⭐</span>
                            <sapn class="pc-span pl-span">카카오 페이지</sapn>
                            <span class="pc-span ca-span">웹소설</span>
                        </div>



                        <!-- 책 제목 -->
                        <div id="post-title">
                            <span class="title-span">
                                신기방기 뿡뿡방기
                            </span>
                        </div>

                        <!-- 작가 이름 -->
                        <div id="post-writer">
                            <span class="writer-span">
                                윤정한
                            </span>
                        </div>

                        <!-- 회차 구분 및 읽기 진행도 -->
                        <div id="ep-wrap">
                            <span class="ep-span cur-ep">50</span>
                            /
                            <span class="ep-span total-ep">100</span>
                            <span class="ep-span ep-id">페이지</span>
                        </div>

                        <!-- 해시태그 영역 -->
                        <div id="hash-wrap">
                            <span class="hash-span">#태그1</span>
                            <span class="hash-span">#태그태그태그</span>
                            <span class="hash-span">#태그_테스트</span>
                            <span class="hash-span">#태그2</span>
                            <span class="hash-span">#태그_3</span>
                            <span class="hash-span">#태그태그</span>
                            <span class="hash-span">#태그_읽는중</span>
                            <span class="hash-span">#태그_그게거거거거</span>
                            <span class="hash-span">#태그_태그_태그</span>
                            <span class="hash-span">#태그_뾰잉뾰이이이잉</span>

                        </div> <!-- // end hash-wrap -->

                    </div>
                </div> <!-- // end img-post-wrap -->




                <!-- 버튼 영역 -->
                <div id="btn-wrap">

                </div> <!-- // end btn-wrap -->


                <!-- 연관 포스트 영역 -->
                <div id="post-link-wrap">

                </div> <!-- // end post-link-wrap -->

            </div> <!-- // end inner-section -->
        </section> <!-- // end section -->


    </div> <!-- end wrap -->



    <script>
        // start jQuery
        $(document).ready(function () {
            // jQueryTagTest("태그 잡기 테스트", $('h1'));



        });
        // end jQuery
    </script>


</body>

</html>