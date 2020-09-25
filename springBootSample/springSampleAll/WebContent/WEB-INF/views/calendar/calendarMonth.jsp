<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<input type="hidden" name="year" value="${year}"/>
<input type="hidden" name="month" value="${month}"/>

<jsp:useBean id="ucal" class="bit.com.a.util.CalendarHelp"/>

<table class="list_table" style="width:85%;">
<col width="50"/><col width="200"/><col width="450"/><col width="30"/>

<tr>
	<th>번호</th><th>시간</th><th>제목</th><th>삭제</th>
</tr>

<c:if test="${empty callistmonth}">
	<tr>
		<td colspan="4">작성된 글이 없습니다.</td>
	</tr>
</c:if>

<c:forEach items="${callistmonth}" var = "cald" varStatus="vs">

<jsp:setProperty property="mdate" name="ucal" value="${cald.rdate}"/>
 		
	<tr>
		<td align="center">${vs.count}</td>

		<td><jsp:getProperty property="mdate" name="ucal"/></td>

		<td><a href="caldetail.do?seq=${cald.seq}">${cald.title}</a></td>
		<td>
			<form action="caldel.do?seq=${cald.seq}" method="post">
				<input type="hidden" name="seq" value="${cald.seq}%>"/>
				<input type="submit" value="일정삭제"/>
			</form>
		</td>	
	</tr>

</c:forEach>

</table>