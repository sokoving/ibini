<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/find-hashtag.css">
    <title></title>

    <%@ include file="../include/static-head.jsp" %>

</head>

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