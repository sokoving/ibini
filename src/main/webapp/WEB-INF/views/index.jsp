<!DOCTYPE html>
<html class="html">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta http-equiv="X-UA-Compatible" content="ie-edge" />
  <meta name="keywords" content="Yulian Brito, Yulian, Brito, Frontend Developer, Sign Up Sign In 1" />
  <meta name="author" content="Yulian Brito" />
  <title>Sign Up / Sign In 1</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />

  <style>


  </style>


</head>

<body>
  <%@ include file="../include/header.jsp" %>

  <h1 id="title"> ibiniBooks Welcome</h1>

  <div> </div>

  <ul>
    <c:if test="${loginUser == null}"></c:if>
    <li><a href="/member/sign-in">sign-in</a></li>
    <li> <a href="/member/sign-up">sign-up</a></li>
    </c:if>
  
    <c:if test="${loginUser != null}">
    <li> <a href="/member/my-page">My Page</a>   </li>
    <li><a href="member/sign-out">sign-out</a></li>
    </c:if>
  </ul>

  <!-- <c:if test="${loginUser == null}">
    <h2> <a href="/member/sign-in">sign-in</a> </h2>
    <h2> <a href="/member/sign-up">sign-up</a> </h2>
  </c:if>


  <c:if test="${loginUser != null}">
    <h2> <a href="/member/my-page">My Page</a> </h2>
    <h2> <a href="member/sign-out">sign-out</a> </h2>
  </c:if> -->



</body>

<script>

</script>

</html>