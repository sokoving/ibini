<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>apiTest</title>
    <style>
        #search {
            background: rgb(229, 173, 173);
        }
        #infoList{
            background: rgb(171, 217, 209);
        }

    </style>
</head>

<body>

    <div class="wrap">
        <h1>hi</h1>
        <div id="search">
            <input type="text">
            <!-- keyup event -->
            <button type="button" id="searchBtn">검색</button>
        </div>
        <div class="api">
            <br>
            <div id="infoList">
                <c:forEach var="infoMap" items="${info}" >
                    <span class="title">${infoMap.title}</span>
                    <span class="author">${infoMap.author}</span>
                </c:forEach>
                
            </div>
            
            
        </div>

    </div>



</body>

</html>