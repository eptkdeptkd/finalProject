<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("loginId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src ="./jquery/jquery-3.5.1.min.js"></script>
<style type="text/css">
body{
	background: linear-gradient(to right, skyblue, pink);
}
#bigtb{
	border: 1px solid white;
	collapse : collapse;
	width : 2000px;
	height : 900px;
}
#addMenuBtn{
	margin-left:5px;
	border-radius:10px;
	background-color:#07beb8;
	font-weight:750;
	color: white;
	border:none;
	cursor:pointer;
	text-align: center;
	opacity : 0.7;
	width:150px;
	height:30px;
}
</style>
</head>
<body>
<table id="bigtb">
<cols width="500px"><cols width="1200px">
<tr id ="menucont">
	<td rowspan="2" id ="menu">
		<table id="menutb">
			<tr>
				<button type="button" id="addMenuBtn" onClick="addMenu()">메뉴 추가</button>
			</tr>
			<tr>
				<ul>
					 
				</ul>
			</tr>
		</table>
	</td>
	<td id="list">3</td>
</tr>
<tr id="listcont">
	<td id="cont">2</td>
</tr>

</table>

<script type="text/javascript">
function addMenu() {
	location.href="menucontroll?work=addMenu&id=<%=id%>";
}
</script>

</body>
</html>