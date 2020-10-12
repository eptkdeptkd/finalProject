<%@page import="cc.factory.com.dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath()%>/callib/main.css"
	rel="stylesheet" />
<script src="<%=request.getContextPath()%>/callib/main.js"></script>

<%
	List<CalendarDto> list = (List<CalendarDto>) request.getAttribute("calList");
String events = "[";
/*
if (list != null && list.size() > 1) {
	for (CalendarDto c : list) {
		System.out.println(c.toString());
	}

	for (CalendarDto c : list) {
		events += "{ id:'" + c.getId() + "', title:'" + c.getTitle() + "', start:'" + c.getStartdate() + "', constraint:'" + c.getContent() + "' },";
	}
	events = events.substring(0, events.lastIndexOf(","));
	events += "]";
}
System.out.println("events = " + events);
*/

for (CalendarDto c : list) {
	events += "{ id:'" + c.getId() + "', title:'" + c.getTitle() + "', start:'" + c.getStartdate() + "', constraint:'" + c.getContent() + "' },";
}
events = events.substring(0, events.lastIndexOf(","));
events += "]";

System.out.println(events);
request.setAttribute("events", events);
%>

<style>
.body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 12px;
}

#calendar {
	max-width: 600px;
	margin: 0 auto;
}
</style>


<div class="body">
	<div id='calendar'>
		<button type="button" id="addcal">일정 추가</button>
	</div>
</div>


<script>
	//세팅하기
	document.addEventListener("DOMContentLoaded", function() {

		let calendarEl = document.getElementById('calendar');

		let calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : { // 캘린더 설정
				left : "prev,next today",
				center : "title",
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			},
			initialDate : new Date(), // new Date() 로 적어도 된다/ 처음 실행시 기준이 되는 날짜
			locale : 'ko', // 한글설
			navLinks : true,
			businessHours : true,
			events :<%=events%>
			
		});
	

		calendar.render(); // 캘린더 생성
	});

	$("#addcal").click(function() {

		//	alert("gkgk");
		location.href = "addCalendar.do";
	});
</script>




