<%@page import="cc.factory.com.dto.PollSubDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
    
<%
List<PollSubDto> list = (List<PollSubDto>)request.getAttribute("pollsublist");

// json 생성.		JSONobject, JSONarray
String jsonData = "[";

for(PollSubDto p : list){
	jsonData += "{ name:'" + p.getAnswer() + "', y:" + p.getAcount() + "}, ";
}
jsonData = jsonData.substring(0, jsonData.lastIndexOf(","));
jsonData += "]";

System.out.println(jsonData);

request.setAttribute("jsonData", jsonData);
%>
<h1 align="center">투표 결과</h1>
<figure class="highcharts-figure">
  <div id="container"></div>		  
</figure>

<h1 align="center">투표 내용</h1>
<div align="center">
	투표번호 : 
		<input type="text" value="${poll.pollid}" size="50" readonly="readonly">
	<br>

	아이디 : 
		<input type="text" value="${login.id}" size="50" readonly="readonly">
	<br>

	투표기한 : 
		${poll.sdate } ~ ${poll.edate }
	<br>


		<br>
	<c:if test="${poll.filename eq null}">
		<br>
			<textarea rows="10" cols="50">${poll.question }</textarea>
		<br>
	</c:if>
	
	<c:if test="${poll.filename ne null}">
		<img src="http://localhost:8090/finalProject/upload/${poll.filename }" style="width: 600px; height: 550px;">	
		<br>
		<textarea rows="10" cols="50">${poll.question }</textarea>
	</c:if>
	

</div>

<a href="polllist.do" title="돌아가기">돌아가기</a>	

<script>
$(document).ready(function(){


	Highcharts.chart('container', {
		  chart: {
		    plotBackgroundColor: null,
		    plotBorderWidth: 0,
		    plotShadow: false
		  },
		  title: {
		    text: '${poll.question }',
		    align: 'center',
		    verticalAlign: 'middle',
		    y: 60
		  },
		  tooltip: {
		    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		  },
		  accessibility: {
		    point: {
		      valueSuffix: '%'
		    }
		  },
		  plotOptions: {
		    pie: {
		      dataLabels: {
		        enabled: true,
		        distance: -50,
		        style: {
		          fontWeight: 'bold',
		          color: 'white'
		        }
		      },
		      startAngle: -90,
		      endAngle: 90,
		      center: ['50%', '75%'],
		      size: '110%'
		    }
		  },
		  series: [{
		    type: 'pie',
		    name: 'Browser share',
		    innerSize: '50%',
		    data: <%=request.getAttribute("jsonData") %>
		  }]
		});






	
});








</script>














