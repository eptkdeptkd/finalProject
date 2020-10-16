<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" href="css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">


<body>
	<section id="menu" class="section">
	<div class="section_container">
		


	<div>
	<h1><img src="image/ranking44.PNG"width="90"height="70">Charless Factory Top 3<img src="image/ranking3.PNG"width="90"height="70"></h1>
		<div id="bCoffee"></div>
		<div id="bMember"></div>
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
			for(var i = 0; i < 3; i++) {
				$("#bMember").append(mlist[i].id + "<br>");
				
			}
			
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