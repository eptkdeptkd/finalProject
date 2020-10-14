<%@page import="cc.factory.com.dto.PollSubDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
 
<section id="menu" class="section">
    <div class="section_container">


		
<hr>		
		
		<div align="center" >
			 <img src="image/logo.png" alt="내용확인" style="width: 100px; height: 100px;"> 
			<p style="font-family: 'Stylish', sans-serif; padding-bottom: 10px; font-size: 48px; color: 8A4B08;">투표 내용</p>
		</div>
		
		
		
		
		<div align="center">
			<a style=" background-color:#2E9AFE; color: #fff; border-radius: var(--size-border-radius); margin-right: 500px;">&nbsp No. ${poll.pollid} &nbsp  </a>
			<%-- <p style="padding-right: 400px;">No.${poll.pollid}</p> --%>
			
			<h2 style="font-family: 'Stylish', sans-serif; padding-bottom: 10px; font-size: 48px;">${poll.question }</h2>
			
			<%-- <i class="far fa-calendar-alt"></i> ${poll.sdate } ~ ${poll.edate } --%>
			<i class="far fa-calendar-alt" style="color: #aeaeae; padding-bottom: 50px;">&nbsp ${poll.sdate }~${poll.edate }</i>
			
		
<br>
			<c:if test="${poll.filename eq null}">
<br>
				<textarea rows="10" cols="50">${poll.question }</textarea>
<br>
			</c:if>
			
			<c:if test="${poll.filename ne null}">
				<img src="http://192.168.0.195:8090/finalProject/upload/${poll.filename }" style="width: 700px; height: 550px; margin-bottom: 50px;">	
<br>
				<%-- <pre>${poll.question }</pre> --%>
			</c:if>
			
			<c:forEach items="${pollsublist }" var="psub" varStatus="vs">
			
			${vs.count}. 
			
			<input type="text" name="answer" style="width:200px; border: 1px solid #fff;padding-left: 10px;outline: none;font-family: 'Stylish', sans-serif; font-size: 28px;"
							value="${psub.answer }" readonly="readonly">
	<!-- <br>	 -->	
			</c:forEach>
	
		
		</div>
		
		
		
		
		
		
		
		<!-- <a href="polllist.do" title="돌아가기">돌아가기</a>	 -->
	<a href="polllist.do" class="category_btn" style="border: 1px solid #aeaeae; color: #000; text-decoration: none;">돌아가기</a>




</div>
</section>




