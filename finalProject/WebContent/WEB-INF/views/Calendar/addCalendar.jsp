<%@page import="java.util.Calendar"%>
<%@page import="cc.factory.com.dto.CalendarParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<%
CalendarParam jcal = (CalendarParam)request.getAttribute("cal");

String year = "" + jcal.getYear();
String month = ""+ jcal.getMonth();
String day = "" + jcal.getDay();

// 오늘 날짜 기준
Calendar cal=Calendar.getInstance();
int tyear=cal.get(Calendar.YEAR); //년
int tmonth=cal.get(Calendar.MONTH )+1;//월
int tday=cal.get(Calendar.DATE);//일
int thour=cal.get(Calendar.HOUR_OF_DAY);//24시
int tmin=cal.get(Calendar.MINUTE);//분

String url = String.format("%s?year=%s&month=%s", "calendar.do", year, month);

%>


<form action="addCalendarAf.do" method="post">
<table align="center" border="1">

<colgroup>
<col style="width=200px"/>
<col style="width=auto"/>
</colgroup>

<div align="center"><a href='<%=url%>'>일정보기</a></div>

<tr>
	<th>아이디 </th>
	<td>
		<input type="text" size="48" name="id">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td style="text-align: left"><input type="text" size="60" name='title' /></td>
</tr>
<tr>
	<th>일정</th>
	<td style="text-align: left">
		<select name='year'>
		<%
		for(int i=tyear-5; i<tyear+6; i++){ // 5년전부터 5년후까지 보여주기
			%>
			<option    <%= (tyear+"").equals(i+"") ? "selected='selected'":"" %>
			    value="<%=i%>"><%=i%></option>
			<% 
		}
		%>
		</select>년
		
		<select name='month'>
		<%
		for(int i=1; i<=12; i++){
			%>
			<option    <%= (tmonth+"").equals(i+"") ? "selected='selected'":"" %>
			    value="<%=i%>"><%=i%></option>
			<% 
		}
		%>
		</select>월
		<select name='day'>
		<%
		for(int i=1; i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
			%>
			<option    <%= (tday+"").equals(i+"") ? "selected='selected'" : "" %>
			    value="<%=i%>"><%=i%></option>
			<% 
		}
		%>
		</select>일
		<select name='hour'>
		<%
		for(int i=0; i<24; i++){
			%>
			<option   <%= (thour+"").equals(i+"")?"selected='selected'":"" %>
			 value="<%=i%>"><%=i%></option>
			<% 
		}
		%>
		</select>시

		<select name='min'>
		<%
		for(int i=0; i<60; i++){
			%>
			<option    <%= (tmin+"").equals(i+"")?"selected='selected'":"" %>
			value="<%=i%>"><%=i%></option>
			<% 
		}
		%>
		</select>분</td>
</tr>


<tr>
	<th>내용</th>
	<td><textarea  name='content' rows="20" cols="60"></textarea></td>
</tr>
<tr>
	<td colspan="2"><input type="submit"  value='글쓰기' /></td>
</tr>
</table>

</form>


