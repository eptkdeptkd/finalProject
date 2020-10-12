<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="polling.do" method="post">

	<c:if test="${poll.filename ne null}">
		<img src="http://localhost:8090/finalProject/upload/${poll.filename }">	
	</c:if>



<br>
	투표번호 : <input type="text" name="pollid" value="${poll.pollid}" size="50" readonly="readonly">
<br>
	아이디 : <input type="text" name="id" value="${login.id }" size="50" readonly="readonly">
<br>
	투표기한 : ${poll.sdate} ~ ${poll.edate}
<br>
	투표내용 : 
<br>
	<textarea rows="3" cols="40" name="question">${poll.question}</textarea>
<br>
	투표 보기수 : ${poll.itemcount }
<br>
	투표 보기들 : 
<br>		
		<c:forEach items="${pollsublist }" var="psub" varStatus="vs">
		
		${vs.count}번
		
		<input type="radio" name="pollsubid" ${vs.count==1?"checked='checked'":""} 
						value="${psub.pollsubid }">
		
		<input type="text" name="answer" size="60"
						value="${psub.answer }" readonly="readonly">
		<br>		
		</c:forEach>
		

		<input type="submit" value="투표하기">


</form>    









