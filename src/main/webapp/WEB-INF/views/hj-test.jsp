<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- RESET CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<!-- css -->
<link rel="stylesheet" href="/css/platform.css"/>
<title>platform</title>
</head>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>

<body>

    <!-- 1. 사용자가 플랫폼을 선택하기 -->
    <!-- 2. 사용자가 플랫폼 추가버튼 누르기 -->
    <!-- 3. 플랫폼 추가 태그 불러오기 -->
    <!-- 4. 입력한 플랫폼 추가 (디폴트 색상으로) -->
    <!-- 5. 목록(마이페이지)에서 수정버튼 누르면 수정삭제하기 -->
    <!-- 6. 수정할때 색깔 선택은 컬러 api 활용하기 -->

    <div class="select-container">
        
        <div class="platformSelText">
            <h3>플랫폼</h3>
            <span class="platformInputShowEvent">플랫폼 추가를 원하시면 여기를 클릭해주세요</ㄴ>
        </div>

        <div class="select">    
            <div class="platformSelBox">
                <select name="platform" id="platformselect">
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
                    <select name="genre" id="genreSelect">
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
    




    <script>

        const account = "ibini";
        // 나중에 꼭 수정해주기
        const url = "http://localhost:8383/platform/c1?account=" + account;

        const genreURL = "http://localhost:8383/genre/c1?account=" + account;

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
                tag += `<option value=" ` + platformId + `">` + platformName + `</option>`;

            }

            document.getElementById('platformselect').innerHTML = tag;

        }

        function showdomainList() {
            
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
                tag += `<option value=" ` + genreId + `">` + genreName + `</option>`;

            }

            document.getElementById('genreSelect').innerHTML = tag;

        }

        // 장르 클릭이벤트
        function saveGenreClickEvent(){
            document.getElementById('genreBtn').onclick = saveGenreHandler
        }

        function saveGenreHandler(e){
            const $genreInput = document.getElementById("genreInput");

            console.log($genreInput.value);

            // 요청정보
            const genreData = {
                    "account": account ,
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


        }); // jquery end


    </script>

</body>
</html>