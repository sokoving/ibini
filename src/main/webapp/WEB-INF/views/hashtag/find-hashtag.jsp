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
    #infoHeader .title{
        background: rgb(219, 151, 233);
        display: flex;
    }
    #infoHeader .number{
        background: rgb(117, 117, 205);
        display: flex;
    }
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
    <section id="infoHeader">
        
        <div class="title">
            <h1># </h1><h1>${searchTag}</h1>
        </div>
        
        <div class="number">
            <h2>${hashtagName}</h2><h2> / </h2><h2>${total}</h2>
        </div>

        <br>

    </section>
    
    <div id="tagList">
        
        <c:forEach var="tag" items="${tagName}">
        
            <span class="tagName">${tag.postNo}</span>
    
            <span class="postNo">${tag.tagName}</span>
            
        </c:forEach>

    </div>
    
    <script>



    </script>
</body>

</html>