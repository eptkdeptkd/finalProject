<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = (String) session.getAttribute("loginId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가하기</title>
<script type="text/javascript" src ="../jquery/jquery-3.5.1.min.js"></script>
<style type="text/css">
#oneline{
	border : 1px solid skyblue;
	margin-left:20px;
}
#tb{
	border : 1px solid skyblue;
	collapse : collapse;
	
}
#btntb{
	border:none;
}
button{
	background-color: #07beb8;
	color:white;
	border :none;
	cursor:pointer;
	border-radius:10px 10px 10px 10px;
	text-align: center;
	width: 100px;
	height:30px;
	margin-right:20px;
	margin-top:7px;
}
input[type=button]{
	background-color: #07beb8;
	color:white;
	border :none;
	cursor:pointer;
	border-radius:10px 10px 10px 10px;
	text-align: center;
	width: 100px;
	height:30px;
	margin-left:60px;
	margin-top:10px;
}
</style>
</head>
<body>

<h1 style="font-align:right;">메뉴 추가</h1>

<div id="oneline">

<div id="menu">
<table id="tb" >
<col width="400">
<tr style='background-color:lightgrey;' id="basicrow"><th style='font-weight:bold; text-align:center;'>MENU</th></tr>
<script type="text/javascript">
let len = 0;
let count = 0;
$.ajax({
	 url:"../menucontroll",
	 type:"get",
	 data:"work=getMenuList&id=<%=id%>",
	 datatype:"text",
	 success:function(obj){
		 // 테이블을 지울 일이 있으면 지우기
		let mlist = obj.mlist;
		len = obj.len;
		//len = len + 1;
		//console.log(mlist);
		$("#tb").eq(-1).after(mlist);
	 },
	 error:function(){
		 alert("menu error");
	 }
});
</script>
</table>
</div>

<div id="menubtn" align="right">
<table id="btntb">
<tr><button type="button" id="addmenubtn">addmenu</button><br></tr>
<tr><button type="button" id="delmenubtn">delmenu</button><br></tr>
<tr><button type="button" id="upbtn" style='visibility:hidden;'>↑</button><br> </tr>
<tr><button type="button" id="downbtn" style='visibility:hidden;'>↓</button><br></tr>
</table>
</div>

</div>
<input type="button" value="적용" id="cfmbtn">
<input type="button" value="back" id="baacktn">


<script type="text/javascript">
let index = -1;
let trindex = -1;
let bfindex = -1;
let indid ="";
function setRowId(rv){
	bfindex = trindex;
	trindex = rv.id;
	
	if(bfindex != -1 && bfindex != trindex){
		indid = '#'+bfindex;
		$(indid).attr('style','background-color:skyblue; border:none; text-align:center;');
	}
	
	indid = '#'+trindex;
	$(indid).attr('style','background-color:yellow');
	//$(indid).parents("tr").attr('style','background-color:pink');
	index = $(indid).parents("tr").attr("id");
	index = index.replace("tr","");
	//console.log(index);

	$("#upbtn").prop("style","visibility:visible");
	$("#downbtn").prop("style","visibility:visible");
}
$("#baacktn").click(function(){
	location.href="../blog.jsp";
});
$("#upbtn").click(function(){
	count = count -1;
	let uprow = $(indid).parent().parent();
	uprow.prev().before(uprow);
});
$("#downbtn").click(function(){
	count = count +1;
	let drow = $(indid).parent().parent();
	drow.next().after(drow);
})
$("#addmenubtn").click(function(){
	let addTo = document.getElementById("tb");

	let row = addTo.insertRow(addTo.rows.length);
	let cell = row.insertCell(0);
	let newrow = "<tr ><input type='text' id='newone' name='newmenu' placeholder='input menu name'></tr>";
	cell.innerHTML = newrow;

});
$("#delmenubtn").click(function(){
	let mname = $(indid).val();
	let str = "#mseq"+index;
	let mseq = $(str).val();
	console.log(mname + " "+ mseq);
	if(mname != "게시판"){
	$.ajax({
		 url:"../menucontroll",
		 type:"get",
		 data:"work=delone&id=<%=id%>&seq="+mseq,
		 datatype:"text",
		 success:function(obj){
			if(obj.conf=="ok"){
				window.location.reload();
			}else{
				alert("정상적으로 삭제 되지 않았습니다");
			}
		 },
		 error:function(){
			 alert("error");
		 }
	});	
	}
});
$("#cfmbtn").click(function(){
	// jquery : when id doesn't exist, return 0
	if($("#newone").length > 0 ){ //document.getElementById("newone")
		let newstr = $("#newone").val();
		$.ajax({
			 url:"../menucontroll",
			 type:"get",
			 data:"work=addone&id=<%=id%>&mname="+newstr,
			 datatype:"text",
			 success:function(obj){
				if(obj.conf=="ok"){
					window.location.reload();
				}else{
					alert("정상적으로 추가가 되지 않았습니다");
				}
			 },
			 error:function(){
				 alert("error");
			 }
		});	
	}else{ // up down
		str = "#mseq"+index;
		$.ajax({
			 url:"../menucontroll",
			 type:"get",
			 data:"work=moverow&id=<%=id%>&count="+count+"&index="+index+"&seq="+$(str).val(),
			 datatype:"text",
			 success:function(obj){
				if(obj.conf=="ok"){
					history.go(0);
				}else{
					alert("정상적으로 추가가 되지 않았습니다");
				}
			 },
			 error:function(){
				 alert("error");
			 }
		});	
	}
});
</script>




</body>
</html>