<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<header>
    <div id="header-container">

        <div id="inner-header">
            <div class="logo">
                <h1><img src="/img/ibini_logo_4.png" alt="header"></h1>
            </div>
            <div class="menuBtn">
                <a href="#" class="menu-open">
                    <c:if test="${loginUser != null}">
                        <span class="user-name">${loginUser.userName} 님</span>
                    </c:if>
                        <span class="fas fa-bars"></sp>
                </a>
            </div>
    
        </div> <!-- // end inner-header -->
    
    
        <nav class="gnb">
            <a href="#" class="menu-close"><span class="far fa-window-close"></span></a>
            <ul>
                <li><a href="#">메뉴1</a></li>
                <li><a href="#">메뉴2</a></li>
    
                <li><a href="/list">포스트 전체 목록</a></li>
                <li><a href="/post/write">새 포스트 쓰기</a></li>
    
                <c:if test="${loginUser == null}">
                <li><a href="/member/sign-in">sign-in</a></li>
                <li> <a href="/member/sign-up">sign-up</a></li>
                </c:if>
            
                <c:if test="${loginUser != null}">
                <li> <a href="/member/my-page">My Page</a>   </li>
                <li><a href="/member/sign-out">sign-out</a></li>
                </c:if>
            </ul>
        </nav> <!-- // end nav -->

    </div>
    

</header> <!-- end header -->