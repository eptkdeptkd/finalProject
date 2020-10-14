<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%
System.out.print(session.getAttribute("login"));
%>


 <div id="test" style="background-color:yellow;">   
    <h2> main </h2>
    
회원정보
<br>
이름:${login.name }
<br>
이메일:${login.email }
<br>
쿠폰:
${login.visitcount/10 }장 - 정수로
<br>
${login.visitcount%10 }장 - 나머지값
<br>

<c:choose>
	<c:when test="${login.visitcount%10<5}">
		<c:forEach begin="1" end="${login.visitcount%10}" step="1">
		y
		</c:forEach>
		<c:forEach begin="1" end="${10-(login.visitcount%10)}" step="1" varStatus="status">
		n
		<c:if test="${status.index eq 5-(login.visitcount%10)}">
		<br>
		</c:if> 
		</c:forEach>
	</c:when>
	
	<c:when test="${login.visitcount%10>=5}"> <!-- 5이상인 경우 -->
	
		<c:forEach begin="1" end="${login.visitcount%10}" step="1" varStatus="status">
		y
			<c:if test="${status.index eq 5}">
				<br>
			</c:if>
		</c:forEach>
		
		<c:forEach begin="1" end="${10-(login.visitcount%10)}" step="1">
		n
		</c:forEach>
	</c:when> 
		
</c:choose>

</div>    
    