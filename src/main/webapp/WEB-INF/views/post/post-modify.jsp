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
    <!-- css -->
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



        <!-- ??? ????????? ?????? ?????? -->
        <section class="post-modi-section">
            <div class="top-msg">* ?????? ?????? ?????? <br>?????? ????????? ???????????? ????????? ??????????????? ???????????????.(?????? ??????)</div>
            <div class="inner-section">
                <form id="modi-form" action="/post/modify" method="post" autocomplete="off"
                    enctype="multipart/form-data">

                    <!-- ?????? : ??????-->
                    <input type="hidden" name="account" id="" value="${account}">
                    <!-- ?????? : ???????????? ?????????(????????? ?????? ??????)-->
                    <input type="hidden" name="caId" value="1">
                    <input type="hidden" name="postNo" value="${p.postNo}">

                    <!-- ?????????, ??????, ??????, ??????-->
                    <div id="reg-1">
                        <!-- ????????? -->
                        <div class="img-wrap">
                            <div class="img-box">
                                <c:choose>
                                    <c:when test="${p.thumbImg != null}">
                                        <span class="box-msg hide">???????????? ????????? ?????????</span>
                                        <img class="post-img thumb-img" src="/loadFile?fileName=${p.thumbImg}"
                                            alt="????????? ?????????">
                                        <input class="thumbFileName-hidden-input" type="hidden" name="thumbFileName"
                                            value="${p.thumbImg}">
                                    </c:when>

                                    <c:otherwise>
                                        <span class="box-msg">???????????? ????????? ?????????</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <label class="file-box">
                                <div class="file-box-left">
                                    ?????? ??????
                                </div>
                                <div class="file-box-right">
                                    <c:choose>
                                        <c:when test="${p.originalThumbName != null}">
                                            ${p.originalThumbName}
                                        </c:when>
                                        <c:otherwise>
                                            ????????? ???????????? ????????????.
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <input type="file" name="files" id="ajax-file" class="file-input thumb-input">
                            </label>
                        </div>

                        <!-- ??????, ??????, ?????? -->
                        <div class="tw-wrap">
                            <div class="span-wrap">
                                <span class="reg-span">* ??? ??????</span>
                                <span class="explain-span title-msg"></span>
                            </div>
                            <input value="${p.postTitle}" class="white-box" type="text" name="postTitle"
                                placeholder="????????? ????????? ?????????">

                            <div class="span-wrap">
                                <span class="reg-span">* ??????</span>
                                <span class="explain-span writer-msg"></span>
                            </div>
                            <input value="${p.postWriter}" class="white-box" type="text" name="postWriter"
                                placeholder="????????? ????????? ?????????">

                            <div class="span-wrap">
                                <span class="reg-span">??????</span>
                                <span class="explain-span star-msg"></span>
                            </div>
                            <input value="${p.starRate}" class="white-box" type="text" name="starRate"
                                placeholder="1?????? 9 ????????? ????????? ????????? ?????????" maxlength="1"
                                oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
                        </div>
                    </div> <!-- // end reg-1 -->


                    <!-- ?????????, ?????? -->
                    <div id="reg-2">
                        <div class="plge-wrap">
                            <div class="select-container">

                                <div class="platformSelText">
                                    <span class="reg-span">?????????</span>
                                    <span class="platformInputShowEvent">????????? ????????? ???????????? ????????? ??????????????????</span>
                                </div>

                                <div class="select">
                                    <div class="platformSelBox">
                                        <select name="platformId" id="platformselect">
                                            <c:forEach var="plat" items="${platformList}">
                                                <option value="${plat.platformId}">${plat.platformName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="platformClick" name="platformAdd">
                                        <input type="text" id="platformInput">
                                        <button id="platformBtn">??????</button>
                                    </div>
                                </div>
                            </div>


                            <div class="genre-container">
                                <div class="genreSelectBox">
                                    <div id="genreClick">
                                        <span class="reg-span">??????</span>
                                        <span class="GenreInputShowEvent">?????? ????????? ???????????? ????????? ??????????????????</span>
                                    </div>

                                    <div class="genreSelAndInput">
                                        <div class="genreSelectBox">
                                            <select name="genreId" id="genreSelect">
                                                <c:forEach var="genre" items="${genreList}">
                                                    <option value="${genre.genreId}">${genre.genreName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="textClick" name="genreAdd">
                                            <input type="text" id="genreInput">
                                            <button id="genreBtn">??????</button>
                                        </div>
                                    </div>

                                </div>

                            </div>



                        </div> <!-- // end plge-wrap -->
                    </div> <!-- // end reg-2 -->


                    <!-- ?????? ??????, ?????? ?????? -->
                    <div id="reg-3">
                        <div class="span-wrap">
                            <span class="reg-span">?????? ??????</span>
                        </div>
                        <div class="radio-wrap pub-btn-group">
                            <label class="white-box radio-item">??????
                                <input class="ep-radio" type="radio" name="publishStatus" value="1">
                            </label>
                            <label class="white-box radio-item">??????
                                <input class="ep-radio" type="radio" name="publishStatus" value="2">
                            </label>
                            <label class="white-box radio-item">??????
                                <input class="ep-radio" type="radio" name="publishStatus" value="3">
                            </label>
                        </div>
                        <div class="span-wrap">
                            <span class="reg-span">?????? ??????</span>
                            <span class="explain-span ep-msg"></span>
                        </div>

                        <c:choose>
                            <c:when test="${p.publishCycle == ''}">
                                <input class="white-box" type="text" name="publishCycle" placeholder="??????) ???, ???, ??? 10???">
                            </c:when>
                            <c:otherwise>
                                <input value="${p.publishCycle}" class="white-box" type="text" name="publishCycle"
                                    placeholder="??????) ???, ???, ??? 10???">
                            </c:otherwise>
                        </c:choose>


                    </div> <!-- // end reg-3 -->

                    <!-- ?????? ??????, ?????? ??????, ?????? ????????? -->
                    <div id="reg-4">
                        <div class="span-wrap">
                            <span class="reg-span">?????? ??????</span>
                            <span class="explain-span ep-msg"></span>
                        </div>

                        <div class="radio-wrap ep-btn-group">
                            <label class="white-box radio-item">
                                <span>??????(???)</span>
                                <input class="ep-radio" type="radio" name="epId" value="0">
                            </label>
                            <label class="white-box radio-item">
                                <span>?????????(p)</span>
                                <input class="ep-radio" type="radio" name="epId" value="1">
                            </label>
                            <label class="white-box radio-item">
                                <span>??????</span>
                                <input class="ep-radio" type="radio" name="epId" value="2">
                            </label>
                            <label class="white-box radio-item">
                                <span>?????????(%)</span>
                                <input class="ep-radio" type="radio" name="epId" value="3">
                            </label>
                        </div>

                        <div class="ep-wrap">
                            <div class="ep-input-wrap">
                                <span class="reg-span">?????? ??????</span> <!-- ????????? ${p.epName}??????-->
                                <input value="${p.curEp}" class="white-box" type="text" name="curEp"
                                    placeholder="0~99999 ?????? ??????" maxlength="5"
                                    oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
                            </div>
                            <div class="ep-input-wrap">
                                <span class="reg-span">?????? ??????</span> <!-- ????????? ${p.epName}??????-->
                                <input value="${p.totalEp}" class="white-box" type="text" name="totalEp"
                                    placeholder="0~99999 ?????? ??????" maxlength="5"
                                    oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
                            </div>
                        </div>
                    </div>

                    <div id="reg-5">
                        <div class="span-wrap">
                            <span class="reg-span">????????????</span>
                            <span class="explain-span">[ ??? ??????????????? #??? ???????????? ???????????????. ]</span>
                        </div>
                        <input value="${p.oneLineTag}" class="white-box" type="text" name="tagName"
                            placeholder="??????) #??????1 #??????_2">
                    </div>

                    <div id="reg-6">
                        <span class="reg-span">????????? ????????????</span>
                        <label class="file-box">
                            <div class="file-box-left">
                                ?????? ??????
                            </div>
                            <div class="file-box-right upload-msg">
                                ????????? ???????????? ????????????.
                            </div>
                            <input type="file" name="files" id="ajax-file-multi" class="file-input imgs-input" multiple>
                        </label>
                        <div class="uploaded-list">
                            <!--
                                ?????? ?????? ????????? ????????? ???
                            <div class="upload-img-box">
                                <img class="upload-img"
                                    src="https://pbs.twimg.com/media/FbQJPxYUcAI11FU?format=jpg&name=large" alt="">
                                <i class="fas fa-times-circle upload-cancel-btn"></i>
                                <input type="hidden" name="filNames"
                                value="https://pbs.twimg.com/media/FbQJPxYUcAI11FU?format=jpg&name=large">
                            </div> -->


                            <c:if test="${imgList != null}">
                                <c:forEach var="img" items="${imgList}">
                                    <c:if test="${img.thumbnail != 'true'}">
                                        <div class="upload-img-box">
                                            <img class="upload-img" src="/loadFile?fileName=${img.fileName}"
                                                alt="${img.originalFileName}">
                                            <i class="fas fa-times-circle upload-cancel-btn"></i>
                                            <input type="hidden" name="fileNames" value=${img.fileName}>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </div>

                    </div>


                    <div id="reg-btn">
                        <button id="post-reg-btn" class="white-box">??????</button>
                        <button id="post-return-btn" class="white-box">??????</button>
                    </div>
                </form> <!-- // end modi-form -->
            </div> <!-- // end inner-section -->
        </section> <!-- // end section -->

    </div> <!-- end wrap -->



    <script>
        // start jQuery
        $(document).ready(function () {
            // jQueryTagTest("?????? ?????? ?????????", $('h1'));
            const account = "${account}";
            console.log("account : " + account);
            const postNo = "${postNo}";
            console.log("postNo : " + postNo);


            // selected??? ?????? ???????????? ?????????, ?????? ????????? 
            const platformId = "${p.platformId}",
                genreId = "${p.genreId}";

            // ?????????, ?????? ????????? ????????????
            showdomainList(platformId);
            savePlatformClickEvent();
            showGenreList(genreId);
            saveGenreClickEvent();


            // ?????? ???????????? ??????, ?????? ???????????? checked
            const pubId = "${p.publishStatus}",
                epId = "${p.epId}";
            setModiRadio(pubId, epId);


            // ???????????? ????????? ????????? ??????
            setUploadCount();

            // ????????? ?????? ?????????
            const $form = $('#modi-form');
            // console.log($form);
            $form.on({
                keydown: function (e) {
                    return checkKeydown(e);
                },
                keyup: function (e) {
                    checkKeyup(e, postNo);
                }
            });


            // ????????? ?????? ??? ?????? ?????????
            const $regBtn = $('#post-reg-btn');
            // jQueryTagTest($regBtn, "?????? ?????? ?????????");
            $regBtn.click(e => {
                e.preventDefault();
                if (!validateFormValue()) {
                    return;
                }
                beforeSubmit();
                $('#modi-form').submit();
            })



            // platform jquery ========================================================


            // ????????? ???????????????
            $('.platformClick').hide();
            $('.platformInputShowEvent').click(function () {
                // alert("platform");

                $('.platformClick').show();
            });



            // ?????? ???????????????
            $('.textClick').hide();
            $('.GenreInputShowEvent').click(function () {
                // alert("hihihi");

                $('.textClick').show();
            });

            // 1. ????????? value??? ????????????
            $('#platformselect').change(function () {

                // alert($(this).val());
                console.log("????????? ?????????id : " + $(this).val());
                $("#platformselect").val($(this).val()).prop("selected", true);
                // $('#platformselect option:eq($(this).val())').prop('selected', true);
                // $('#platformselect').val($(this).val()).prop("selected", true);
                console.log("selected : " + $("#platformselect option:selected").val());
                // alert($("#platformselect option:selected").val());

            });

            $('#genreSelect').change(function () {

                // alert($(this).val());
                console.log("genreSelect: " + $(this).val());
                // $('#genreSelect').val($(this).val()).attr("selected", "selected");
                $('#genreSelect').val($(this).val()).prop("selected", true);
                console.log("genreSelect selecded : " + $("#genreSelect option:selected").val());
                // alert($( "#genreSelect option:selected" ).val());

            });

            //========================????????? ??????====================//

            // ????????? ?????? ????????? ?????????
            $('.thumb-input').change(uploadAndRendeThumbnail);
            // ?????? ????????? ?????? ????????? ?????????
            $('.imgs-input').change(uploadAndRendeFiles);
            // ?????? ????????? ?????? ?????????
            $('.uploaded-list').click(delUploadImg);

            //==================================================//




        });
        // end jQuery

        // ????????? ?????? ??????
        const account = '${account}';
        const gAccount = '${account}';

        // console.log(account);
        // console.log(gAccount);

        // ????????? ??? ???????????????

        const url = "/platform/c1/" + account;

        const genreURL = "/genre/c1/" + gAccount;
    </script>

</body>

</html>