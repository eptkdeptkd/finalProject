<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" href="css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>


<body>
	<section id="menu" class="section">
	<div class="section_container">
		


	<div>
	<h1><img src="image/ranking44.PNG"width="90"height="70">Charless Factory Top 3<img src="image/ranking3.PNG"width="90"height="70"></h1>
		<div id="bCoffee"></div>
		<%-- <div id="bMember"></div>--%>
		<figure class="highcharts-figure">
		  <div id="container"></div>
		  <p class="highcharts-description">
		    Charles factory를 가장 많이 방문해주신 분들입니다. 정말 감사드립니다!<br>
		    (매달 마지막주 목요일에 많이 구매하신 분들께 쿠키를 증정해드립니다)	    
		  </p>
		</figure>
	</div>

		<!--  -->
	</div>
	</section>
</body>

<script>
//post로 
$(document).ready(function() {
	
	$.ajax({
		url:"./bestMember.do",
		type:"get",
		success:function( mlist ){
			//console.log(mlist);
			var idar = new Array(3);
			var countar = new Array(3);
			
			for(var i = 0; i < 3; i++) {
				//$("#bMember").append(mlist[i].id + "<br>");
				idar[i] = mlist[i].name;
				countar[i] = mlist[i].visitcount;
			}

				// Create the chart
				Highcharts.chart('container', {
				  chart: {
				    type: 'column'
				  },
				  title: {
				    text: today+" , 가장 많이 구매해주신 고객님들 입니다"
				  },
				  accessibility: {
				    announceNewData: {
				      enabled: true
				    }
				  },
				  xAxis: {
				    type: 'category'
				  },
				  yAxis: {
				    title: {
				      text: '방문횟수'
				    }
				  },
				  legend: {
				    enabled: false
				  },
				  plotOptions: {
				    series: {
				      borderWidth: 0,
				      dataLabels: {
				        enabled: true,
				        format: '{point.y:.1f}%'
				      }
				    }
				  },
				  tooltip: {
				    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
				    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
				  },

				  series: [
				    {
				      //name: "",
				      colorByPoint: true,
				      data: [
				        {
				          name: idar[0],
				          y: countar[0],
				          drilldown:null
				        },
				        {
				          name: idar[1],
					      y: countar[1],
					      drilldown:null
				        },
				        {
					       name: idar[2], 
					       y: countar[2], 
					       drilldown:null
				        }
				      ]
				    }
				  ]
				});
				
		},
		error:function(){
			alert("error");
		}		
	});	
	$.ajax({
		url:"./bestCoffee.do",
		type:"get",
		success:function( clist ){
			//console.log(clist);
			for(var i = 0; i < 3; i++) {
				console.log(clist[i]);
				$("#bCoffee").append();
				$("#bCoffee").append("<img src='http://192.168.0.195:8090/finalProject/upload/"+clist[i].newname+"'></a>");
			}
		},
		error:function(){
			alert("error");
		}		
	});	
});
</script>