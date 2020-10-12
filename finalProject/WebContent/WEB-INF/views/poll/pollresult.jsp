<%@page import="cc.factory.com.dto.PollSubDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

<table class="list_table" style="width:95%">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>

<tr>
	<th>투표번호</th>
	<td style="text-align: left;">
		<input type="text" value="${poll.pollid}" size="50" readonly="readonly">
	</td>
</tr>

<tr>
	<th>아이디</th>
	<td style="text-align: left">
		<input type="text" value="${login.id}" size="50" readonly="readonly">
	</td>
</tr>

<tr>
	<th>투표기한</th>
	<td style="text-align: left;">
		${poll.sdate } ~ ${poll.edate }
	</td>
</tr>

<tr>
	<th>투표내용</th>
	<td style="text-align: left;">
		<textarea rows="10" cols="50">${poll.question }</textarea>
	</td>
</tr>

<tr>
	<th>투표결과</th>
	<td>	
	
		<figure class="highcharts-figure">
		  <div id="container"></div>		  
		</figure>
			
	</td>
</tr>

</table>

<script>
$(document).ready(function(){




	Highcharts.chart('container', {
		  chart: {
		    plotBackgroundColor: null,
		    plotBorderWidth: 0,
		    plotShadow: false
		  },
		  title: {
		    text: '투표 결과',
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














