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
<link rel="stylesheet" href="/css/myPagePlatform.css"/>

<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>


<title>MyPage</title>
</head>
<body>

    <div class="myPage-wrap">
        <h1>MyPage</h1>
        <button type="button" class="btn btn-info">Info</button>
        <div class="platform-wrap">
            <h2>platform Setting</h2>
            <div id="selectSetting">
                <!-- dom 생성해서 넣어주기 -->
                <div id="selList">
                    <div class="platformNo">
                        <span>platformNo</span>
                    </div>
                    <div class="platformName">
                        <span>platformName</span>
                    </div>
                    <div class="bgColor" style="background-color: #ed1c24;">
                        <span>배경색상</span>
                    </div>
                    <div class="fontColor" style="background-color: #1de041;">
                        <span>글자색상</span>
                    </div>
                    <div class="modiNdel">
                        
                        <button class="platModi">수정</button>
                        <button class="plat-del">삭제</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Modal -->
        <div class="modal fade" id="platModi" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h1>모달 오픈!!</h1>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>



<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" id="modalBtn" data-bs-toggle="modal" data-bs-target="#platModi">
    모달버튼
</button>




</div>









<script>
    
        const account = "ibini";
        // 나중에 꼭 수정해주기
        const url = "http://localhost:8383/platform/c1?account=" + account;


        // 도메인 리스트 불러오기
        function showdomainList() {
            
            fetch(url)
            .then(res => res.json())
            .then(domainList => {
                console.log(domainList);
                makePlatformDom(domainList);
            });

        }

        // 플랫폼 돔 생성
        function makePlatformDom(domainList) {

            // 1. 추가할 위치 가져오기
            const selectSetting = document.querySelector('#selectSetting');
            // 2. div 생성
            // document.createElement('');

            let tag = '';

            for (let key in domainList) {

                console.log(domainList[key].platformName);
                console.log(domainList[key].platformId);

                let platformName = domainList[key].platformName;
                let platformId = domainList[key].platformId;
                let platformBgColor  = domainList[key].platformBgColor;
                let platformFontColor = domainList[key].platformFontColor;

                // option 생성할 필요가 없다 -> select 아래에 넣어주니까!!
                // var option = document.createElement("option");
                // tag 더해주기
                tag += `<div id="selList">
                            <div class="platformNo">
                                <span>` + platformId + `</span>
                            </div>
                            <div class="platformName">
                                <span>` + platformName + `</span>
                            </div>
                            <div class="bgColor" style="background-color: ` + platformBgColor + `;">
                                <span>배경색상</span>
                            </div>
                            <div class="fontColor" style="background-color: ` + platformFontColor + `;">
                                <span>글자색상</span>
                            </div>
                            <div class="modiNdel">
                                <button type="button" class="btn btn-primary" id="modalBtn" data-bs-toggle="modal" data-bs-target="#platModi">
                                수정모달
                            </button>
                                <button class="plat-del">삭제</button>
                            </div>
                        </div>`;

            }
            // selectSetting 아래쪽에 넣어주기
            document.getElementById('selectSetting').innerHTML = tag;

        }


        showdomainList();
        // modalBtnEvent();

        // function modalBtnEvent() {
        //     const modalBtn = document.getElementById('modalBtn');

        //     modalBtn.onclick = e =>{
        //         console.log('모달 클릭');
        //     }
        // }
        
        // modal btn event
        // let $modalBtn = document.getElementById('platModi');
        // modalBtn.onclick = e => {
        //     console.log('수정 모달!');
        // }
    </script>
</body>
</html

