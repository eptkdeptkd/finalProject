<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- request.setCharacterEncoding("utf-8"); --%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<tiles:insertAttribute name="header_link"/>

</head>
<body>

<div class="body_wrap">

	<div class="header_wrap">
		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="header_sub"/>
	</div>
	
	<div class="main_wrap">
		<tiles:insertAttribute name="main"/>
	</div>

	<div class="footer_wrap">
		<tiles:insertAttribute name="footer"/>
	</div>

</div>


</body>
</html>









