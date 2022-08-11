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
        <button>저장</button>
    </div>
    <div class="select">
        <select name="platform" id="platformselect">
            <option value="#">플랫폼을 선택하세요</option>
        </select>
    </div>



    <script>

        const account = "ibini";
        const url = "http://localhost:8383/platform/c1";

        // 1. 저장하기!
        // 2. 돔 만들기
        // 3. 저장한 리스트 화면에 랜더링
        // 4.

        function makePlatformDom(domainList) {
            const $platformselect = document.getElementById('platformselect');
            domainList.forEach(req => {
                // 옵션 생성하기
                var option = document.createElement("option");
                // 옵션 생성 후 value 설정

                // test contest 생성
            });
        }


        fetch( url + '?account=' + account)
        .then(res => res.json())
        .then(domainList => {
            console.log(domainList);
            alert('hi');
        });

        function savePlatformClickEvent(){
            document.getElementById('platformInput').onclick = savePlatformHandler
        }

        function savePlatformHandler()

        savePlatformClickEvent();


    </script>

</body>
</html>