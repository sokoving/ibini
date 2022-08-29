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
        .title{
            background: rgb(229, 173, 173);
        }
        .author{
            background: rgb(171, 217, 209);
        }

    </style>
</head>

<body>

    <div class="wrap">
        <h1>hi</h1>
        <div class="api">

            ${api}
            <br>
            <!-- ${array} -->
            ${je}
            
        </div>

    </div>



</body>

</html>