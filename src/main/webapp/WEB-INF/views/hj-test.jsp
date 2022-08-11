<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>platform</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.slim.js"
        integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
        crossorigin="anonymous"></script>

<body>

    <!-- 1. 사용자가 플랫폼을 선택하기 -->
    <!-- 2. 사용자가 플랫폼 추가버튼 누르기 -->
    <!-- 3. 플랫폼 추가 태그 불러오기 -->
    <!-- 4. 입력한 플랫폼 추가 (디폴트 색상으로) -->
    <!-- 5. 목록(마이페이지)에서 수정버튼 누르면 수정삭제하기 -->
    <!-- 6. 수정할때 색깔 선택은 컬러 api 활용하기 -->


    <div class="radio-list">
        <input type="radio" name="check" value="platformInputX"> X
        <input type="radio" name="check" value="platformInputX"> O
    </div>
    <div class="text-input">
        # 플랫폼을 추가하세요 : <input type="text" id="platformInput">
        <button id="platformBtn">저장</button>
    </div>
    <div class="select">
        <select name="platform" id="platformselect">
            <option value="#">플랫폼을 선택하세요</option>
        </select>
    </div>



    <script>
        // jQuery
        $(document).ready(function(){
            alert("start")


        });




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
                alert('hi');
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

            alert($platformInput.value);
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
                        alert('등록 성공');
                        // 비워주기
                        $platformInput.value = '';
                        showdomainList();
                    } else {
                        alert('저장 실패');
                    }
                })

        }

        savePlatformClickEvent();


    </script>

</body>
</html>