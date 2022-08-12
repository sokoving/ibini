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
        <div class="select">
            <h3>플랫폼을 선택하세요!</h3>
            <select name="platform" id="platformselect">
                <option value="#">플랫폼을 선택하세요</option>
            </select>
        </div>
        <div class="radio-list">
            <label>플랫폼 추가를 원하시나요?</label>
            <input type="radio" class="radioBtn" name="check" value="platformInputX"> X
            <input type="radio" class="radioBtn" name="checked" value="platformInputO"> O
        </div>
        <div class="text-input" name="platformAdd">
            <label><p># 플랫폼을 추가하세요 : </p></label>
            <input type="text" id="platformInput">
            <button id="platformBtn">저장</button>
        </div>   
    </div>
    




    <script>

        const account = "ibini";
        // 나중에 꼭 수정해주기
        const url = "http://localhost:8383/platform/c1?account=" + account;

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


        
        
        // 저장 버튼 클릭 이벤트
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

        // 처음부터 화면에 보여주기
        showdomainList();
        savePlatformClickEvent();
        

        // jQuery
        // $(document).ready(function(){

        //     $('.text-input').hide();
        //     // alert("start")
        //     $('.radioBtn').click(function(){
        //         alert("hihihi")

        //         if($("input[name='checked']:checked")){
        //             $('.text-input').show();
        //             console.log($("input[name='checked']:checked").val());
        //             // alert($("input[name='checked']:checked").val());    
        //         }
                

        //     });
        // }); // jquery end


    </script>

</body>
</html>