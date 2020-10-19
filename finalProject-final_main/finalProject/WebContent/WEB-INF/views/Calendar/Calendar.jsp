<%@page import="cc.factory.com.dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" href="css/calendar.css">
<link href="<%=request.getContextPath()%>/callib/main.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/callib/main.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<section id="menu" class="section">
	<div class="section_container">

		<%
			List<CalendarDto> list = (List<CalendarDto>) request.getAttribute("calList");
		String events = "[";

		for (CalendarDto c : list) {
			events += "{ id:'" + c.getId() + "', title:'" + c.getTitle() + "', start:'" + c.getStartdate() + "', constraint:'"
			+ c.getContent() + "' },";
		}
		events = events.substring(0, events.lastIndexOf(","));
		events += "]";

		System.out.println(events);
		request.setAttribute("events", events);
		%>

		<h1><img alt="" src="image/coffee9.PNG" width="90">Charless Factory Event Day<img alt="" src="image/coffee9.PNG" width="90"></h1>
		
		<div class="body">
		<c:if test="${login.auth == 1}">
			<button type="button" id="addcal" class="cal_btn"><img alt="" src="image/coffee6.PNG" width="50">이벤트 추가 </button>
		</c:if>	
			<div id='calendar'></div>
		</div>


		<script>
			//세팅하기
			document
					.addEventListener(
							"DOMContentLoaded",
							function() {

								let calendarEl = document
										.getElementById('calendar');
								let calendar = new FullCalendar.Calendar(
										calendarEl,
										{
											headerToolbar : { // 캘린더 설정
												left : "prev,next today",
												center : "title",
												right : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
											},
											initialDate : new Date(), // new Date() 로 적어도 된다/ 처음 실행시 기준이 되는 날짜
											locale : 'ko', // 한글설
											navLinks : true,
											businessHours : true,
											events :<%=events%>,
											eventColor: '#f28482'
								
											
											});

								calendar.render(); // 캘린더 생성
							});

			$("#addcal").click(function() {

				//이벤트 추가 
				location.href = "addCalendar.do";
			});
		</script>

	</div>
</section>



