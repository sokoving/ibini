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
    <link rel="stylesheet" href="/css/platform.css" />


    <!-- jquery -->
    <script src="/js/jquery-3.3.1.min.js"></script>


    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- custom js -->
    <script src="/js/common.js" defer></script>
    <script src="/js/post-reg.js" defer></script>
    <script src="/js/post-platformAndGenre.js" defer></script>
    <script src="/js/upload.js" defer></script>


</head>

<body>

    <!-- header -->
    <%@ include file="../include/change-header.jsp" %>

    <div id="wrap">


        <!-- 새 포스트 등록 섹션 -->
        <section class="post-reg-section">
            <div class="top-msg">* 필수 입력 사항 <br>선택 사항은 입력하지 않으면 기본값으로 세팅됩니다.(수정 가능)</div>
            <div class="inner-section">
                <form id="write-form" action="#" method="post" autocomplete="off" enctype="multipart/form-data">

                    <!-- 히든 : 계정-->
                    <input type="hidden" name="account" id="" value="${account}">
                    <!-- 히든 : 카테고리 아이디(웹소설 일단 고정)-->
                    <input type="hidden" name="caId" value="1">
                    <!-- 히든 : favorite (등록할 때는 0)-->
                    <input type="hidden" name="favorite" value="0">

                    <!-- 이미지, 제목, 작가, 별점-->
                    <div id="reg-1">
                        <!-- 이미지 -->
                        <div class="img-wrap">
                            <div class="img-box">
                                <span class="box-msg">썸네일을 등록해 보세요</span>
                            </div>
                            <label class="file-box">
                                <div class="file-box-left">
                                    파일 선택
                                </div>
                                <div class="file-box-right">
                                    등록된 썸네일이 없습니다.
                                </div>
                                <input type="file" name="files" id="ajax-file" class="file-input thumb-input">
                            </label>
                        </div>

                        <!-- 제목, 작가, 별점 -->
                        <div class="tw-wrap">
                            <div class="span-wrap">
                                <span class="reg-span">* 책 제목</span>
                                <span class="explain-span title-msg"></span>
                            </div>
                            <input class="white-box" type="text" name="postTitle" value="${bookInfo.title}">

                            <div class="span-wrap">
                                <span class="reg-span">* 작가</span>
                                <span class="explain-span writer-msg"></span>
                            </div>
                            <input class="white-box" type="text" name="postWriter" value="${bookInfo.author}">

                            <div class="span-wrap">
                                <span class="reg-span">별점</span>
                                <span class="explain-span star-msg"></span>
                            </div>
                            <input class="white-box" type="text" name="starRate" placeholder="1에서 9 사이의 정수를 입력해 주세요"
                                maxlength="1"
                                oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
                        </div>
                    </div> <!-- // end reg-1 -->


                    <!-- 플랫폼, 장르 -->
                    <div id="reg-2">
                        <div class="plge-wrap">
                            <div class="select-container">

                                <div class="platformSelText">
                                    <span class="reg-span">플랫폼</span>
                                    <span class="platformInputShowEvent">새 플랫폼 추가하려면 여기 클릭<i
                                            class="far fa-hand-point-left ms-2"></i></span>
                                </div>

                                <div class="select">
                                    <div class="platformSelBox">
                                        <select name="platformId" id="platformselect">
                                            <option value="#">플랫폼을 선택하세요</option>
                                        </select>
                                    </div>

                                    <div class="platformClick" name="platformAdd">
                                        <input type="text" id="platformInput">
                                        <button id="platformBtn">저장</button>
                                    </div>
                                </div>
                            </div>


                            <div class="genre-container">
                                <div class="genreSelectBox">
                                    <div id="genreClick">
                                        <span class="reg-span">장르</span>
                                        <span class="GenreInputShowEvent">새 장르 추가하려면 여기 클릭<i
                                                class="far fa-hand-point-left ms-2"></i></span>
                                    </div>

                                    <div class="genreSelAndInput">
                                        <div class="genreSelectBox">
                                            <select name="genreId" id="genreSelect">
                                                <option value="#">장르를 선택하세요</option>
                                            </select>
                                        </div>
                                        <div class="textClick" name="genreAdd">
                                            <input type="text" id="genreInput">
                                            <button id="genreBtn">저장</button>
                                        </div>
                                    </div>

                                </div>

                            </div>



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
                            <span class="explain-span ep-msg"></span>
                        </div>
                        <input class="white-box" type="text" name="publishCycle" placeholder="예시) 월, 수, 금 10시">
                    </div> <!-- // end reg-3 -->

                    <!-- 회차 구분, 현재 회차, 현재 페이지 -->
                    <div id="reg-4">
                        <div class="span-wrap">
                            <span class="reg-span">회차 구분</span>
                            <span class="explain-span ep-msg"></span>
                        </div>

                        <div class="radio-wrap ep-btn-group">
                            <label class="white-box radio-item checked">
                                <span>회차(화)</span>
                                <input class="ep-radio" type="radio" name="epId" value="0" checked>
                            </label>
                            <label class="white-box radio-item">
                                <span>페이지(p)</span>
                                <input class="ep-radio" type="radio" name="epId" value="1">
                            </label>
                            <label class="white-box radio-item">
                                <span>권수</span>
                                <input class="ep-radio" type="radio" name="epId" value="2">
                            </label>
                            <label class="white-box radio-item">
                                <span>퍼센트(%)</span>
                                <input class="ep-radio" type="radio" name="epId" value="3">
                            </label>
                        </div>

                        <div class="ep-wrap">
                            <div class="ep-input-wrap">
                                <span class="reg-span">현재 회차</span> <!-- 회차는 ${p.epName}으로-->
                                <input class="white-box" type="text" name="curEp" placeholder="0~99999 사이 숫자"
                                    maxlength="5"
                                    oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
                            </div>
                            <div class="ep-input-wrap">
                                <span class="reg-span">전체 회차</span> <!-- 회차는 ${p.epName}으로-->
                                <input class="white-box" type="text" name="totalEp" placeholder="0~99999 사이 숫자"
                                    maxlength="5"
                                    oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
                            </div>
                        </div>
                    </div>

                    <div id="reg-5">
                        <div class="span-wrap">
                            <span class="reg-span">해시태그</span>
                            <span class="explain-span">[ 각 해시태그는 #를 기준으로 구별됩니다. ]</span>
                        </div>
                        <input class="white-box" type="text" name="tagName" placeholder="예시) #태그1 #태그_2">
                    </div>

                    <div id="reg-6">
                        <div class="span-wrap">
                            <span class="reg-span">이미지 첨부하기</span>
                            <span class="explain-span files-msg">[ 첨부 이미지는 5개까지 등록 가능합니다. ]</span>
                        </div>
                        <label class="file-box">
                            <div class="file-box-left">
                                파일 선택
                            </div>
                            <div class="file-box-right upload-msg">
                                첨부된 이미지가 없습니다.
                            </div>
                            <input type="file" name="files" id="ajax-file-multi" class="file-input imgs-input" multiple>
                        </label>
                        <div class="uploaded-list"> </div>

                    </div>


                    <div id="reg-btn">
                        <button id="post-reg-btn" class="white-box">등록</button>
                    </div>
                </form> <!-- // end write-form -->
            </div> <!-- // end inner-section -->
        </section> <!-- // end section -->

    </div> <!-- end wrap -->



    <script>
        // start jQuery
        $(document).ready(function () {

            const account = "${account}";
            console.log(account);

            // 플랫폼, 장르 선택창 불러오기
            showdomainList();
            savePlatformClickEvent();
            showGenreList();
            saveGenreClickEvent();



            // 입력창 키업 이벤트
            const $form = $('#write-form');
            // console.log($form);
            $form.on({
                keydown: function (e) {
                    return checkKeydown(e);
                },
                keyup: function (e) {
                    checkKeyup(e);
                }
            });


            // 포스트 입력 폼 제출 이벤트
            const $regBtn = $('#post-reg-btn');
            // jQueryTagTest($regBtn, "태그 잡기 테스트");
            $regBtn.click(e => {
                e.preventDefault();
                if (!validateFormValue()) {
                    return;
                }
                beforeSubmit();
                $('#write-form').submit();
            })



            // platform jquery ========================================================


            // 플랫폼 클릭이벤트
            $('.platformClick').hide();
            $('.platformInputShowEvent').click(function () {
                // alert("platform");

                $('.platformClick').show();
            });
            // 클릭시 삭제하기




            // 장르 클릭이벤트
            $('.textClick').hide();
            $('.GenreInputShowEvent').click(function () {
                // alert("hihihi");

                $('.textClick').show();
            });

            // 1. 플랫폼 value값 가져오기
            $('#platformselect').change(function () {

                // alert($(this).val());
                // console.log("선택한 플랫폼id : " + $(this).val());
                $("#platformselect").val($(this).val()).prop("selected", true);
                // $('#platformselect option:eq($(this).val())').prop('selected', true);
                // $('#platformselect').val($(this).val()).prop("selected", true);
                // console.log("selected : " + $("#platformselect option:selected").val());
                // alert($("#platformselect option:selected").val());

            });

            $('#genreSelect').change(function () {

                // alert($(this).val());
                // console.log("genreSelect: " + $(this).val());
                // $('#genreSelect').val($(this).val()).attr("selected", "selected");
                $('#genreSelect').val($(this).val()).prop("selected", true);
                // console.log("genreSelect selecded : " + $("#genreSelect option:selected").val());
                // alert($( "#genreSelect option:selected" ).val());

            });

            //========================이미지 첨부====================//

            // 썸네일 인풋 체인지 이벤트
            $('.thumb-input').change(uploadAndRendeThumbnail);
            // 첨부 이미지 인풋 체인지 이벤트
            $('.imgs-input').change(uploadAndRendeFiles);
            // 첨부 이미지 삭제 이벤트
            $('.uploaded-list').click(delUploadImg);

            //==================================================//




        });
        // end jQuery

        // 비동기 요청 경로
        const account = '${account}';
        const gAccount = '${account}';

        // console.log(account);
        // console.log(gAccount);

        const url = "/platform/c1/" + account;
        const genreURL = "/genre/c1/" + gAccount;
    </script>

</body>

</html>