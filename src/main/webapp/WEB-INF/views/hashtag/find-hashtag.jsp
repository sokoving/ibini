<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <%@ include file="../include/static-head.jsp" %>

</head>
<style>
    #content-wrap {
        border-radius: 10px;
        background-color: #f7f7f6;
        padding: 30px 30px 10px;
    }

    #infoHeader {
        width: 80%;
        margin: 0 auto;
    }

    #infoHeader hr {
        border: 1px solid #333;
    }

    #infoHeader .title {
        /* background: rgb(219, 151, 233); */
        display: flex;
    }

    #infoHeader .title .titleSpan {
        font-size: 45px;
        font-weight: 600;
        /* font-family: 'NanumSquareRoundBold'; */
    }

    #infoHeader .number {
        /* background: rgb(117, 117, 205); */
        display: flex;

    }

    #infoHeader .number h4 {
        /* background: rgb(117, 117, 205); */
        display: flex;
        /* font-family: 'NanumSquareRoundBold'; */
        font-size: 20px;
        font-weight: 600;

    }

    .hashtagList {
        background: #ffc699;
        width: 80%;
        border-radius: 10px;
        border : solid 7px #ffc699;
        overflow: hidden;
        /* padding: 10px; */

        margin: 0 auto 30px;
        /* box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 6px -1px, rgba(0, 0, 0, 0.06) 0px 2px 4px -1px; */
        box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 15px -3px, rgba(0, 0, 0, 0.05) 0px 4px 6px -2px;

    }

    .hashtagList .tagNamediv {
        background: rgb(179, 202, 242);
        font-size: 25px;
        font-family: 600;
        padding: 6px;
    }

    .tagInfo {
        background: #FFF9F4;
        padding: 3px 20px;
        border-radius: 5px;
    }
    .tagInfo:hover{
        transition: 0.6s;
        background-color: #fff0c6 ;
    }

    .tagInfo .titleAndNo {
        font-size: 25px;
        font-family: 600;
    }

    /* .tagInfo .titleAndNo .postTitle {

    } */
</style>

<body>
    <%@ include file="../include/change-header.jsp" %>
    <div id="wrap">


        <div id="content-wrap">
            <!-- tagName -->
            <div id="infoHeader">

                <div class="title">
                    <span class="titleSpan"># </span>
                    <span class="titleSpan">${searchTag}</span>
                </div>
                <hr>
                <div class="number">
                    <h4>총 </h4>
                    <h4>${hashtagName}</h4>
                    <h4> 권의 책이 등록되어있습니다.</h4>
                </div>

                <br>

            </div>

            <div id="tagList">

                <c:forEach var="tag" items="${tagName}">
                    <div class="hashtagList">
                        <div class="tagNameDiv">
                            <!-- <span># </span><span class="tagName">${tag.tagName}</span> -->
                            <span class="postNo">PostNo. </span><span class="postNo">${tag.postNo}</span>
                        </div>
                        <div class="tagInfo" onclick="location.href='/post/detail/${tag.postNo}'">
                            <div class="titleAndNo">
                                <span class="postTitle">${tag.postTitle}</span>
                            </div>
                            <div class="detailInfo">
                                <span>W. </span><span class="postWriter">${tag.postWriter}</span>
                                <span>| </span><span class="platformName">${tag.platformName}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>

        </div>

    </div>



    <script>



    </script>
</body>

</html>