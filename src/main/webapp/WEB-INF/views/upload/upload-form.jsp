<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

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
    <script src="/js/upload.js" defer></script>

    <!-- jquery -->
    <script src="/js/jquery-3.3.1.min.js"></script>

    <style>
        .fileDrop {
            width: 800px;
            height: 400px;
            border: 1px dashed gray;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5em;
        }

        .uploaded-list {
            display: flex;
        }

        .img-sizing {
            display: block;
            width: 100px;
            height: 100px;
        }
    </style>

</head>

<body>


    <div id="wrap">

        <%@ include file="../include/header.jsp" %>


        <!-- 새 포스트 등록 섹션 -->
        <section class="post-reg-section">
            <div class="inner-section">
                <form id="write-form" action="/upload" method="post" autocomplete="off" enctype="multipart/form-data">

                    <!-- 히든 : 계정-->
                    <input type="hidden" name="account" id="" value="${account}">
                    <!-- postNo(임시) -->
                    <input type="hidden" name="postNo" id="" value=30>


                    <!-- 이미지, 제목, 작가, 별점-->
                    <div id="reg-1">
                        <!-- 이미지 -->
                        <div class="img-wrap">
                            <div class="img-box">
                                <span class="box-msg">썸네일을 등록해 보세요</span>
                                <!-- <span class="box-msg hide">썸네일을 등록해 보세요</span> -->
                                <!-- <img class="post-img" src="https://pbs.twimg.com/media/FagFBNhUsAUzvho?format=jpg&name=4096x4096" alt=""> -->
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
                                <span class="reg-span">책 제목</span>
                                <span class="explain-span">제목을 입력해 주세요</span>
                            </div>
                            <input class="white-box title-input" type="text" name="postTitle" placeholder="제목을 입력해 주세요" disabled>

                            <div class="span-wrap">
                                <span class="reg-span">작가</span>
                                <span class="explain-span">작가를 입력해 주세요</span>
                            </div>
                            <input class="white-box writer-input" type="text" name="postWriter"
                                placeholder="작가를 입력해 주세요" disabled>

                            <div class="span-wrap">
                                <span class="reg-span">별점</span>
                                <span class="explain-span">1~5 사이의 정수를 입력해 주세요</span>
                            </div>
                            <input class="white-box title-input" type="number" name="starRate" placeholder="예시) 5" disabled>


                        </div>
                    </div> <!-- // end reg-1 -->

                    <div id="reg-6">
                        <span class="reg-span">이미지 첨부하기</span>
                        <label class="file-box">
                            <div class="file-box-left">
                                파일 선택
                            </div>
                            <div class="file-box-right">
                                첨부된 이미지가 없습니다.
                            </div>
                            <!-- <input class="file-input" type="file" name="#" multiple> -->
                        </label>
                    </div>


                    <div id="reg-btn">
                        <button class="white-box">등록</button>
                    </div>
                </form> <!-- // end write-form -->
            </div> <!-- // end inner-section -->
        </section> <!-- // end section -->

    </div> <!-- end wrap -->


    <!-- 파일 업로드를 위한 form - 동기 처리-->
    <!-- 폼이 제출하고 있는 형식 명시 : enctype="multipart/form-data" -->
    <form action="/upload" method="post" enctype="multipart/form-data">
        <!-- multiple 속성 : 복수 파일 업로드 -->
        <input type="file" name="file" multiple>
        <button type="submit">업로드</button>
    </form>

    <!-- 비동기 통신을 통한 실시간 파일 업로드 처리 -->
    <div class="fileDrop">
        <span>DROP HERE!!</span>
    </div>

    <!-- 
        - 파일 정보를 서버로 보내기 위해서는 <input type="file"> 이 필요
        - 해당 input태그는 사용자에게 보여주어 파일을 직접 선택하게 할 것이냐
          혹은 드래그앤 드롭으로만 처리를 할 것이냐에 따라 display를 상태를 결정
     -->
    <!-- 동기 통신과 다른 점은 form이 없다는 것, 파일 정보를 담을 input창은 필요하지만 사용자 눈에 보일 필요는 없다 -->
    <div class="uploadDiv">
        <!-- <input type="file" name="files" id="ajax-file" style="display:none;"> -->
    </div>

    <!-- 업로드된 이미지의 썸네일을 보여주는 영역 -->
    <div class="uploaded-list">

    </div>


    <script>
        // start jQuery(jQuery 즉시실행 함수, jQuery 구문 시작)
        $(document).ready(function () {

            const account = "${account}";
            console.log(account);

            // 포스트 입력 폼 제출 이벤트
            const $regBtn = $('#post-reg-btn');
            // jQueryTagTest($regBtn, "태그 잡기 테스트");
            $regBtn.click(e => {
                $('#post-reg-form').submit();
            })



            // 썸네일 인풋 체인지 이벤트
            const $thumbInput = $('.thumb-input');

            $thumbInput.change(e => {
                console.log('체인지 이벤트 작동!');
                // 선택된 파일 정보를 서버로 전송
                // 1. 드롭된 파일 데이터 읽기
                const files = e.originalEvent.target.files;
                console.log('input file data: ', files);

                // 파일 오리지널 이름
                const fileOriginName = files[0].name;
                console.log('fileOriginName : ', fileOriginName);

                // 파일이 이미지가 아니라면 이벤트 종료
                if(!isImageFile(fileOriginName)){
                    alert('이미지 파일만 업로드 가능합니다.');
                    return;
                }

                // 2. 읽은 파일 데이터를 input[type=file]태그에 저장
                const $fileInput = $('#ajax-file');
                $fileInput.prop('files', files); // 첫번째 파라미터는 input의 name 속성과 맞추기
                console.log($fileInput[0].files);

                // 3. 파일 데이터를 비동기 전송하기 위해서는 FormData객체가 필요
                const formData = new FormData();
                // 4. 전송할 파일들을 전부 FormData안에 포장
                for (let file of $fileInput[0].files) {
                    formData.append('files', file);
                }

                // 5. 비동기 요청 전송
                const reqInfo = {
                    method: 'POST',
                    body: formData
                };
                fetch('/ajax-upload', reqInfo)
                    .then(res => {
                        console.log(res.status);
                        return res.json();
                    })
                    .then(fileNames => {
                        console.log(fileNames);
                        showThumbImg(fileNames, fileOriginName);
                    });


            }); // end 썸네일 인풋 체인지 이벤트




        }); // end jQuery
    </script>


</body>

</html>