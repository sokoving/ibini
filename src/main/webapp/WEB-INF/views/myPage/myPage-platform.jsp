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

 <script src="/js/myPage-platform.js" defer></script>

 <title>MyPage</title>
</head>

<body>


    <!-- const account = "ibini"
    const sideBarURL = http://localhost:8383/myPage/account/platform -->
        <!-- sideBar account 정보 수정-->

    <%@ include file="../include/change-header.jsp" %>
    <div id="wrap">
        <div id="sideBar">
            <h2>MyPage</h2>
            <a href="/myPage">User-Info</a>
            <a href="">Help</a>
            <h3>Setting</h3>
            <a href="/myPage/platform">Platform</a>
            <a href="/myPage/genre">Genre</a>
            <a href="">BookMark</a>
            <a href="">BookMemo</a>
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
                        <div class="modal-body" id="modalBody">
                            <h1>플랫폼 수정하기</h1>
                            <div id="picker"></div>
                            <div id="modiName">
                                <h2>플랫폼 이름 수정</h2>
                                <input type="text" id="modiNameInput">
                            </div>
                            <div id="modiBg">
                                <h2>플랫폼 뱃지 배경색 수정</h2>
                                <input type="text" id="modiBgInput" readonly><div id="eventRemoveBtn"></div>
                            </div>
                            <div id="modiFont">
                                <h2>플랫폼 뱃지 글자색 수정</h2>
                                <input type="text" id="modiFontInput" readonly><div id="eventRemoveBtnFont"></div>

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
    </div>




    <script>

        let account = '${account}';
        // 나중에 꼭 account 수정해주기
        const url = "http://localhost:8383/platform/c1" + account;
        // 수정 삭제용 url
        const modiURL = "http://localhost:8383/platform/c1/" + account;




    </script>

</body>
</html>

