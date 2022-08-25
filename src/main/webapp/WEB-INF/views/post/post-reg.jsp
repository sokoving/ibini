
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
    <link rel="stylesheet" href="/css/platform.css"/>


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
                <form id="write-form" action="/post/write/${account}" method="post" autocomplete="off" >

                    <!-- 임시 : 계정명(나중에 로그인 적용되면 빼기) -->
                    <input type="hidden" name="account" id="" value="${account}">

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
                            <div class="select-container">

                                    <div class="platformSelText">
                                        <h3>플랫폼</h3>
                                        <span class="platformInputShowEvent">플랫폼 추가를 원하시면 여기를 클릭해주세요</span>
                                    </div>

                                    <div class="select">
                                        <div class="platformSelBox">
                                            <select name="platformId" id="platformselect" >
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
                                        <h3>장르</h3>
                                        <span class="GenreInputShowEvent">장르 추가를 원하시면 여기를 클릭해주세요</span>
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

        const account = '${account}';
        const gAccount = '${account}'

        console.log(account);
        console.log(gAccount);

        // 나중에 꼭 수정해주기
        // const url = "http://localhost:8383/platform/c1?account=" + account;
        const url = "http://localhost:8383/platform/c1/" + account;

        // const genreURL = "http://localhost:8383/genre/c1?account=" + account;

        const genreURL = "http://localhost:8383/genre/c1/" + gAccount;

        // 1. 저장하기!
            // 1. 버튼 클릭시 핸들러 작동
            // 2. 핸들러 함수로 value값 가져오기
            // 3. 전송할데이터 배열
            // 4. 요청 정보 객체
            // 5. fetch 전송하기 -> 220811 완료
        // 2. 돔 만들기
            // 1. select -> option || ul -> li 생성 후 js로 select처럼 만들기
            // 1-1. select로 돔 구현함
            // 1-2. 저장이후에 보여주는 함수 만들기 + 비동기 GET요청?
        // 3. 저장한 리스트 화면에 랜더링
            // 1. 뱃지 글자색 + 뱃지 배경색 디비에서 불러오기 -> before switch
        // 4. 파일 라디오 버튼 체인지에 따라 생성하고 수정하기 - 아코디언도 가능?

        // 플랫폼 저장 & 랜더링 기능 =======================================================

        // makePlatformDom - 돔생성하기
        function makePlatformDom(domainList) {

            // 플랫폼 셀렉트 아래에 option 추가하기
            const platformselect = document.querySelectorAll('#platformselect'); // length = 1

            let tag = '';

            for (let key in domainList) {

                // console.log(domainList[key].platformName);
                // console.log(domainList[key].platformId);

                let platformName = domainList[key].platformName;
                let platformId = domainList[key].platformId;

                // option 생성할 필요가 없다 -> select 아래에 넣어주니까!!
                // var option = document.createElement("option");
                // tag 더해주기
                tag += `<option id="platform`+platformId+`" value="` + platformId + `">` + platformName + `</option>`;

            }

            document.getElementById('platformselect').innerHTML = tag;

        }

        function showdomainList() {
            console.log(url);
            fetch(url)
            .then(res => res.json())
            .then(domainList => {
                console.log(domainList);
                makePlatformDom(domainList);

            });

        }




        // 플랫폼 저장 버튼 클릭 이벤트
        function savePlatformClickEvent(){
            document.getElementById('platformBtn').onclick = savePlatformHandler
        }

        //플랫폼 저장 핸들러
        function savePlatformHandler(e){

            e.preventDefault();
            // 입력창
            const $platformInput = document.getElementById("platformInput");

            console.log($platformInput.value);
            // [수정] 서버로 전송할 데이터 -> account 로그인 정보 넘겨주는거 받는걸로수정!
            const platformData = {

                "platformName": $platformInput.value,
                "account" : account
            }
            console.log(platformData);

            // POST 요청정보 객체
            const reqInfo = {
                method : "POST"
                , headers : {
                    'content-type' : 'application/json'
                }
                , body : JSON.stringify(platformData)

            };
            console.log(reqInfo);

            fetch(url, reqInfo)
                .then(res => res.text())
                .then(msg=>{
                    if(msg==="insert-success"){
                        alert('새로운 플랫폼이 등록 완료되었습니다.');
                        // 비워주기
                        $platformInput.value = '';
                        // select 해주기
                        showdomainList();
                    } else {
                        alert('새로운 플랫폼 저장을 실패했습니다.');
                    }
                })

        }





        // 장르 저장 / 리스트 출력 =======================================================

        function showGenreList() {
            console.log(genreURL);
            fetch(genreURL)
            .then(res => res.json())
            .then(genreList => {
                console.log(genreList);
                makeGenreDom(genreList);

            });

        }


        // 장르 돔 생성
        function makeGenreDom(genreList) {

            // 플랫폼 셀렉트 아래에 option 추가하기
            const genreSelect = document.querySelectorAll('#genreSelect'); // length = 1

            let tag = '';

            for (let key in genreList) {

                console.log(genreList[key].genreId);
                console.log(genreList[key].genreName);

                let genreId = genreList[key].genreId;
                let genreName = genreList[key].genreName;


                // option 생성할 필요가 없다 -> select 아래에 넣어주니까!!
                // var option = document.createElement("option");
                // tag 더해주기
                tag += `<option value="` + genreId + `">` + genreName + `</option>`;

            }

            document.getElementById('genreSelect').innerHTML = tag;

        }

        // 장르 클릭이벤트
        function saveGenreClickEvent(){
            document.getElementById('genreBtn').onclick = saveGenreHandler
        }

        function saveGenreHandler(e){
            
            e.preventDefault();
            
            const $genreInput = document.getElementById("genreInput");

            console.log($genreInput.value);

            // 요청정보
            const genreData = {
                    "account": gAccount ,
                    "genreName": $genreInput.value
                }

            console.log(genreData);

            // POST 요청정보 객체
            const reqInfo = {
                method : "POST"
                , headers : {
                    'content-type' : 'application/json'
                }
                , body : JSON.stringify(genreData)

            };
            console.log(reqInfo);

            fetch(genreURL, reqInfo)
                .then(res => res.text())
                .then(msg=>{
                    if(msg==="insert-success"){
                        alert('새로운 장르가 등록 완료되었습니다.');
                        // 비워주기
                        $genreInput.value = '';
                        // select 해주기
                        showGenreList();
                    } else {
                        alert('새로운 장르 저장을 실패했습니다.');
                    }
                })

        }




    // 즉시실행함수 ==========================================================


    (function(){


        // 플랫폼
        showdomainList();
        savePlatformClickEvent();

        // 장르
        showGenreList();
        saveGenreClickEvent();


    })();




        // 장르 jquery ==========================================================
        $(document).ready(function(){

            // 플랫폼 클릭이벤트
            $('.platformClick').hide();
            $('.platformInputShowEvent').click(function(){
                    // alert("platform");

                    $('.platformClick').show();
            });


            // 장르 클릭이벤트
            $('.textClick').hide();
            $('.GenreInputShowEvent').click(function(){
                    // alert("hihihi");

                    $('.textClick').show();
            });         
            //     // 2. 선택된 값 넘기기

        }); // jquery end

        // 1. 플랫폼 value값 가져오기 
        $(document).ready(function(){       
            
            // $('#selTest').change(function(){
                
            //     console.log($(this).val());
            //     // ($(this).val()); 
            //     $("#selTest").val($(this).val()).prop("selected", true);
            //     // $('#platformselect option:eq($(this).val())').prop('selected', true);
            //     // $('#platformselect').val($(this).val()).prop("selected", "selected");
            //     // alert($("#selTest option:selected").val());
                
            // });

            $('#platformselect').change(function(){
                
                // alert($(this).val());
                console.log("선택한 플랫폼id : "+ $(this).val());
                $("#platformselect").val($(this).val()).prop("selected", true);
                // $('#platformselect option:eq($(this).val())').prop('selected', true);
                // $('#platformselect').val($(this).val()).prop("selected", true);
                console.log("selected : " + $("#platformselect option:selected").val());
                // alert($("#platformselect option:selected").val());
                
            });

            $('#genreSelect').change(function(){
                
                // alert($(this).val());
                console.log("genreSelect: "+$(this).val());
                // $('#genreSelect').val($(this).val()).attr("selected", "selected");
                $('#genreSelect').val($(this).val()).prop("selected", true);
                console.log("genreSelect selecded : "+$( "#genreSelect option:selected" ).val());
                // alert($( "#genreSelect option:selected" ).val());
                
            });



            
        }); // jquery end

        

    </script>

</body>

</html>