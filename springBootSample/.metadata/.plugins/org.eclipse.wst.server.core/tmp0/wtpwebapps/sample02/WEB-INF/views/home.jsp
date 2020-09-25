<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<body>

<%
	String name = (String)request.getAttribute("name");
	out.println("name:" + name);
%>

<h3>${name }</h3>

<br><br>

<a href="world.do?age=24&name=일지매">World로 이동</a>


</body>
</html>









