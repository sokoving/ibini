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
            <div class="platform-wrap">
                <h2>platform Setting</h2>
                <div id="selectSetting">
                    <!-- dom 생성해서 넣어주기 -->
                    <div id="selList">
                        <div class="platformNo" id="platformNo">
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
                            <h5 class="modal-title" id="exampleModalLabel">플랫폼 수정하기</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h1>플랫폼 수정하기</h1>
                            <div id="modiName">
                                <h2>플랫폼 이름 수정 하기</h2>
                            </div>
                            <div id="modiBg">
                                <h2>플랫폼 뱃지 배경색 수정</h2>
                            </div>
                            <div id="modiFont">
                                <h2>플랫폼 뱃지 글자색 수정</h2>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" id="modalBtn" data-bs-toggle="modal" data-bs-target="#platModi">
            모달버튼
        </button>



    <script>
    
        const account = "ibini";
        // 나중에 꼭 account 수정해주기
        const url = "http://localhost:8383/platform/c1?account=" + account;
        // 수정 삭제용 url
        const URL = "http://localhost:8383/platform/c1/" + account;

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
                            <div class="platformNo">`
                                + platformId + `
                            </div>
                            <div class="platformName">
                                <span>` + platformName + `</span>
                            </div>
                            <div class="bgColor" style="background-color: ` + platformBgColor + `;">
                                <span>배경색상</span>
                            </div>
                            <div class="fontColor" id="fontColor" style="background-color: ` + platformFontColor + `;">
                                <span>글자색상</span>
                            </div>
                            <div class="modiAndDel">
                                <button type="button" class="btn btn-primary" id="modalBtn" data-bs-toggle="modal" data-bs-target="#platModi">
                                    수정모달
                                </button>
                                <button class="plat-del" id="delBtn">삭제</button>
                            </div>
                        </div>`;

            }
            // selectSetting 아래쪽에 넣어주기
            document.getElementById('selectSetting').innerHTML = tag;

        }

        // 플랫폼 돔 생성
        showdomainList();
        openModifyModalAndRemoveEvent();

        //플랫폼 수정 삭제 이벤트
        function openModifyModalAndRemoveEvent() {
            const $SelectSetting = document.getElementById('selectSetting');

            $SelectSetting.addEventListener('click', function(e){
                // alert('selectSetting');
                console.log(e.target);
                platformModAndDelHandler(e);
            });
        }


        // 플랫폼 삭제 처리
        function processRemove(no) {
            console.log(no)
            if (!confirm('선택하신 플랫폼을 삭제하시겠습니까?')) return;

            fetch(URL + '/' + no, {
                method: 'DELETE'
            })
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'del-success') {
                        alert('삭제 성공!');
                        // 목록 새로불러오기
                        showdomainList();
                    } else {
                        alert('삭제 실패!!');
                    }
                });
        }

        // 수정 화면 modal에 보여주기
        function processModifyShow(e, no) {
            console.log('processmodiShow no: ', no)
            const platformName = e.target.parentElement.parentElement.firstElementChild.nextElementSibling.textContent;
            console.log('platformName : ', platformName);
            const platfomrBgColor = e.target.parentElement.parentElement.firstElementChild.nextElementSibling.nextElementSibling.style.backgroundColor;
            console.log('platfomrBgColor: ', platfomrBgColor);
            const platformFontColor = e.target.parentElement.parentElement.lastElementChild.previousElementSibling.style.backgroundColor
            console.log('platformFontColor : ', platformFontColor)




        }

        // 플랫폼 수정/삭제 핸들러
        function platformModAndDelHandler(e) {

            const no = e.target.parentElement.parentElement.firstElementChild.textContent;
            // const noo = e.target.parentElement;

            console.log('no:', no);
            // console.log('noo', noo);

            e.preventDefault();

            // console.log('수정버튼 클릭함!! before');
            if (e.target.matches('#modalBtn')) {
                console.log('modalBtn');
                processModifyShow(e, no);
            } else if (e.target.matches('#delBtn')) {
                processRemove(no);
                console.log('delBtn');
            }
        }


    </script>

</body>
</html>

