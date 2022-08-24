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
<link rel="stylesheet" href="/css/myPageSetting.css" />

<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<%-- color api --%>
<script src="https://cdn.jsdelivr.net/npm/@jaames/iro@5"></script>

<%--  jquery --%>
 <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
<title>MyPage</title>
</head>

<body>

        
        <!-- sideBar account 정보 수정-->
        <div class="sidenav">
            <a href="http://localhost:8383/myPage">MY PAGE</a>
            <a href="#"></a>
            <a href="#">About</a>
            <a href="#">Services</a>
            <a href="#">Clients</a>
            <a href="#">Setting</a>
            <a href="http://localhost:8383/myPage/platform">Platform</a>
            <a href="http://localhost:8383/myPage/genre">Genre</a>
        </div>



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
                            <div class="bgColorBox" style="background-color: #ed1c24;"></div>
                            <span>배경색상</span>
                        </div>
                        <div class="fontColor" style="background-color: #1de041;">
                            <div class="fontColorBox" style="background-color: #1de041;"></div>
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
                            <div id="picker"></div>
                            <div id="modiName">
                                <h2>플랫폼 이름 수정</h2>
                                <input type="text" id="modiNameInput">
                            </div>
                            <div id="modiBg">
                                <h2>플랫폼 뱃지 배경색 수정</h2>
                                <input type="text" id="modiBgInput"><div id="eventRemoveBtn"></div>
                            </div>
                            <div id="modiFont">
                                <h2>플랫폼 뱃지 글자색 수정</h2>
                                <input type="text" id="modiFontInput"><div id="eventRemoveBtnFont"></div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" id="modiBtn" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Button trigger modal -->
<%--        <button type="button" class="btn btn-primary" id="modalBtn" data-bs-toggle="modal" data-bs-target="#platModi">--%>
<%--            모달버튼--%>
<%--        </button>--%>



    <script>
        
        const account = "ibini";
        // 나중에 꼭 account 수정해주기
        const url = "http://localhost:8383/platform/c1?account=" + account;
        // 수정 삭제용 url
        const modiURL = "http://localhost:8383/platform/c1/" + account;


        // 배경 클릭 이벤트
        function modiBgInputClick(e) {

            var colorPicker = new iro.ColorPicker("#picker", {
                // Set the size of the color picker
                width: 270,
                // Set the initial color to pure red
                color: "#f00"
            });
            // document.getElementById('eventRemoveBtn');

            // btn 위치 잡아서 클릭이벤트 활성화될ㄸㅐ 추가해주기

            var rgbString = colorPicker.color.rgbString;

            // listen to a color picker's color:change event
            // color:change callbacks receive the current color
            colorPicker.on('color:change', function (color) {
                // log the current color as a HEX string
                console.log(color.rgbString);
                document.getElementById('modiBgInput').value = color.rgbString;
            });

        }

        
        // 폰트 클릭이벤트
        function modiFontInputEvent(e) {
                

                var colorPicker = new iro.ColorPicker("#picker", {
                    // Set the size of the color picker
                    width: 270,
                    // Set the initial color to pure red
                    color: "#f00"
                });

                // btn 위치 잡아서 클릭이벤트 활성화될ㄸㅐ 추가해주기
                // const eventRemoveBtn = document.querySelector('#eventRemoveBtnFont');
                // tag = `<button type="button" class="btn btn-primary" id="removeFontEvent">수정완료</button>`;
                
                // document.getElementById('removeFontEvent').innerHTML = tag;


                var rgbString = colorPicker.color.rgbString;

                // listen to a color picker's color:change event
                // color:change callbacks receive the current color
                colorPicker.on('color:change', function (color) {
                    // log the current color as a HEX string
                    console.log(color.rgbString);
                    document.getElementById('modiFontInput').value = color.rgbString;
                });


        }


        // 배경 색상 선택 input 수정
        function modiBgInput() {
            const modiBgInput = document.getElementById('modiBgInput');
            modiBgInput.addEventListener('click', modiBgInputClick );
            
                
            // 중복이벤트 제거
            modiBgInput.addEventListener('click', function(e){
                modiBgInput.removeEventListener('click', modiBgInputClick);
            })

            
        }

        // 글자 색상 input 수정
        function modiFontInput() {
            const modiFontInput = document.getElementById('modiFontInput');
            modiFontInput.addEventListener('click', modiFontInputEvent );
            
            
            // 중복이벤트 제거
            modiFontInput.addEventListener('click', function(e){
                modiFontInput.removeEventListener('click', modiFontInputEvent);
            })
            
        }
    

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
                            <div class="bgColor">
                                <div class="bgColorBox" style="background-color: ` + platformBgColor + `;"></div><span>배경색상</span>
                            </div>
                            <div class="fontColor" id="fontColor">
                                <div class="fontColorBox" style="background-color: ` + platformFontColor + `;"></div><span>글자색상</span>
                            </div>
                            <div class="modiAndDel">
                                <button type="button" class="btn btn-primary" id="modalBtn" data-bs-toggle="modal" data-bs-target="#platModi">
                                    수정
                                </button>
                                <button type="button" id="delBtn" class="btn btn-danger">삭제</button>

                            </div>
                        </div>`;

            }
            // selectSetting 아래쪽에 넣어주기
            document.getElementById('selectSetting').innerHTML = tag;

        }





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

            fetch(modiURL + '/' + no, {
                method: 'DELETE'
            })
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'del-success') {
                        alert('삭제 성공!');
                        // 목록 새로불러오기
                        showdomainList();
                    } else {
                        alert('삭제 실패!');
                    }
                });
        }

        // 수정 화면 modal에 보여주기
        function processModifyShow(e, no) {
            console.log('processmodiShow no:', no)

            const platformName = e.target.parentElement.parentElement.firstElementChild.nextElementSibling.innerText;
            console.log('platformName : ', platformName);
            const platfomrBgColor = e.target.parentElement.parentElement.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.style.backgroundColor;
            console.log('platfomrBgColor: ', platfomrBgColor);
            const platformFontColor = e.target.parentElement.parentElement.lastElementChild.previousElementSibling.firstElementChild.style.backgroundColor;
            console.log('platformFontColor : ', platformFontColor)

            document.getElementById('modiNameInput').value = platformName;
            // 색상 수정할때 컬러 api 사용하기
            document.getElementById('modiBgInput').value = platfomrBgColor;
            document.getElementById('modiFontInput').value = platformFontColor;

            // 번호 달아주기
            const $modal = document.querySelector('.modal');
            $modal.dataset.no = no;
            console.log('no: ', no);



        }



        // 플팻폼 수정 비동기 처리 이벤트
        function platformModifyEvent() {
            const modal = document.getElementById('platModi');
            console.log('platformModifyEvent')

            const modiBtn = document.getElementById('modiBtn');
            modiBtn.onclick = e => {
                let modiNameInput = document.getElementById('modiNameInput');
                let modiBgInput = document.getElementById('modiBgInput');
                let modiFontInput = document.getElementById('modiFontInput');

                console.log('modalInput : ',modiNameInput.value);
                // data-no에 \n 상태로 들어감??
                const no = e.target.closest('.modal').dataset.no;
                console.log('ModifyEvent no :', no);
                // console.log('no.value: ', no.value);

                const objj = {
                                 account : account,
                                 platformName: modiNameInput.value,
                                 platformBgColor: modiBgInput.value,
                                 platformFontColor: modiFontInput.value
                             };

                const reqInfo = {
                    method: 'PUT',
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify(objj)
                };
                console.log(objj);

                console.log(modiURL + '/' + no);
                    fetch(modiURL + '/' + no, reqInfo)
                        .then(res => res.text())
                        .then(msg => {
                            if (msg === 'modi-success') {
                                alert('수정 성공!!');
                                // jquery로 닫자,,,,
                                modal.style.display = "none"; // 모달창 닫기? -> 수정하기!
                                showdomainList(); //새로불러오기
                            } else {
                                alert('수정 실패!!');
                            }
                        });
            };
        }


        // 플랫폼 수정/삭제 핸들러
        function platformModAndDelHandler(e) {
            //textcontent를 innerText로 바꿈
            const no = e.target.parentElement.parentElement.firstElementChild.innerText;
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
                console.log('delBtn: ', no);
            }
        }


        // 함수 실행부

        (function (){
            // 플랫폼 돔 생성
            showdomainList();
            openModifyModalAndRemoveEvent();
            platformModifyEvent();
            // 컬러 선택 함수
            modiBgInput();
            modiFontInput();

        })();


    </script>

</body>
</html>

