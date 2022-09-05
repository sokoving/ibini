<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<style>
    .tagname {
        background: rgb(176, 112, 112);
    }

    .postNo {
        background: rgb(166, 252, 196);
    }
</style>

<body>

    <h1>hihihi</h1>
    <!-- tagName -->
    <h1># </h1>
    <h1>${searchTag}</h1>
    <h2>${hashtagName}</h2>
    <h2> / </h2>
    <h2>${total}</h2>

    <c:forEach var="tag" items="${tagName}">
        <span class="tagName">${tag.tagName}</span>
        <span class="tagName">${tag.postNo}</span>
    </c:forEach>

</body>

</html>