# JSTP (JSP Standard Tag Library)

# core tags
- 변수 지원, URL 관리, 흐름 제어
- 필요 태그 : <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
- 주석 : <%-- center : 상세정보 --%>
```
// if : 조건문, test가 true인 경우 내용 표시 
<c:if test="${income > 8000}">  
   <p>My income is: <c:out value="${income}"/><p>  
</c:if>

// choose : 조건부 작업, 모든 test가 false면 otherwise 실행
<c:choose>  
    <c:when test="${income != null}">  
       Income is not good.  
    </c:when>  
    <c:otherwise>  
       Income is undetermined...  
    </c:otherwise>  
</c:choose>  

// forEach : 객체 컬렉션 반복
<c:forEach var="j" begin="1" end="3">  
   Item <c:out value="${j}"/><p>  
</c:forEach>

<c:forEach var="p" items="${pl}">
    <h3>${p.postTitle}</h3>
</c:forEach>
```