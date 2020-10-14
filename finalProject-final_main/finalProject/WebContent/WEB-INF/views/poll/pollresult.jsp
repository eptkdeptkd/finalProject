<%@page import="cc.factory.com.dto.PollSubDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
 
<section id="menu" class="section">
    <div class="section_container">
    
        
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




		<!-- <h1 align="center">투표 결과</h1> -->
		<div align="center" >
			<img src="image/logo.png" alt="결과보기" style="width: 100px; height: 100px;"> 
			<p style="font-family: 'Stylish', sans-serif; padding-bottom: 10px; font-size: 48px; color: 8A4B08;">" ${poll.question } "의 투표 결과 확인</p>
		</div>
		
		
		<br>
		
		<!-- high chart -->
		<figure class="highcharts-figure">
		  	<div id="container"></div>		  
		</figure>
		
<hr>		
		

		<a href="pollresult2.do?pollid=${poll.pollid }" class="category_btn" style="border: 1px solid #aeaeae; color: #000; text-decoration: none;">투표 내용확인</a>
		<a href="polllist.do" class="category_btn" style="border: 1px solid #aeaeae; color: #000; text-decoration: none;">돌아가기</a>



</div>
</section>



<script>
$(document).ready(function(){


	Highcharts.chart('container', {
		  chart: {
		    plotBackgroundColor: null,
		    plotBorderWidth: 0,
		    plotShadow: false
		  },
		  title: {
		    text: '마우스를 올려주세요',
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


