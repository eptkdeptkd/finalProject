<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<html>
<head>
<title>일정</title>
</head>

<table class="list_table" style="width:85%;">
<col width="100"/><col width="200"/><col width="450"/><col width="50"/>

<tr bgcolor='#09bbaa'>
	<th>번호</th><th>시간</th><th>제목</th><th>삭제</th>
</tr>

<c:forEach items="${callist}" var="cal" varStatus="vs">
<tr>
	<td>${vs.count}</td>
	<td>${cal.wdate}</td>
	<td style="text-align: left"><a href='caldetail.do?seq=${cal.seq}'>${cal.title}</a></td>
	<td>
		<form action="caldel.do" method="post">
			<input type="hidden" name='seq' value='${cal.seq}'/>
			<input type="submit"  value='일정삭제'/>
		</form>
	</td>
</tr>
</c:forEach>
</table>

<c:url var="urls" value="calendarlist.do">
	<c:param name="year" value="${year}"></c:param>
	<c:param name="month" value="${month}"></c:param>
</c:url>

<a href='${urls}'>일정보기</a>
</body>

</html>