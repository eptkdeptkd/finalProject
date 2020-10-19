<%@page import="cc.factory.com.login.MemberDto"%>
<%@page import="cc.factory.com.dto.PollDto"%>
<%@page import="cc.factory.com.util.PollUtil"%>
<%@page import="cc.factory.com.dto.PollDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section id="menu" class="section" style="padding-top: 300px; padding-bottom: 120px;">
    <div class="section_container">
        
<%
List<PollDto> plists = (List<PollDto>)request.getAttribute("plists");

MemberDto mem = (MemberDto)session.getAttribute("login");
%>



<div align="center">
	<img src="image/voteimage2.png" alt="" style="width: 70%; height: 400px;"><h1 style="font-family: 'Stylish', sans-serif; padding: 30px 0;">솔로몬의 선택, 당신의 생각을 투표하세요.</h1>
</div>



<!-- 관리자 -->
<%
if(mem.getAuth() == 1){
%>
	<a href="pollmake.do" class="category_btn" style="border: 1px solid #aeaeae; color: #000; text-decoration: none;">투표 만들기</a>
<%
}
%>
<hr>




<div style="overflow:scroll; height: 1000px;">

<%
if(mem.getAuth() == 1){
%>

<%
for(int i = 0;i < plists.size(); i++){
PollDto poll = plists.get(i);
%>

<%
if(poll.getOldfilename() != null){
%>


	<a href="pollresult.do?pollid=<%=poll.getPollid() %>">
		<div style="float: left; width: 100%; padding-top: 100px;">
	<b style=" background-color:#2E9AFE; color: #fff; border-radius: var(--size-border-radius);">&nbsp; No.<%=i+1 %>&nbsp;  </b> <i class="fas fa-user" style="color: #8A4B08; padding-right: 50px; padding-left: 100px;">&nbsp;<%=poll.getPolltotal() %>명이 투표에 참여했습니다.</i>  <i class="fas fa-list-ol" style="color: #8A4B08;">&nbsp;<%=poll.getItemcount() %>개의 보기가 있습니다.</i>  
			<div style="float: left;">
				<img src="http://192.168.0.195:8090/finalProject/upload/<%=poll.getFilename() %>" style="width: 350px; height: 250px;">
			</div>
		
			<div>
				<h1 style="font-family: 'Stylish', sans-serif;"><%=poll.getQuestion() %></h1>
				<hr>
				<i class="far fa-calendar-alt" style="color: #aeaeae;">&nbsp;<%=poll.getSdate() %>      ~      <%=poll.getEdate() %></i>
			</div>
		</div>
	</a>



<%
}else{
%>



	<a href="pollresult.do?pollid=<%=poll.getPollid() %>">
	
		<div style="float: left; width: 100%; padding-top: 100px;">
	<b style=" background-color:#2E9AFE; color: #fff; border-radius: var(--size-border-radius);">&nbsp; No.<%=i+1 %>&nbsp;  </b> <i class="fas fa-user" style="color: #8A4B08; padding-right: 50px; padding-left: 100px;">&nbsp;<%=poll.getPolltotal() %>명이 투표에 참여했습니다.</i>  <i class="fas fa-list-ol" style="color: #8A4B08;">&nbsp;<%=poll.getItemcount() %>개의 보기가 있습니다.</i>  
			<div style="float: left;">
				<img src="image/vote.png" alt="" style="width: 350px; height: 300px;">
			</div>
		
			<div>
				<h1 style="font-family: 'Stylish', sans-serif;"><%=poll.getQuestion() %></h1>
				<hr>
				<i class="far fa-calendar-alt" style="color: #aeaeae;">&nbsp;<%=poll.getSdate() %>      ~      <%=poll.getEdate() %></i>
				
			</div>
		</div>
	</a>



<%
}
%>




<br>
<%
}
%>

<%
}
%>











<!-- 일반 유저 -->
<%
if(mem.getAuth() == 3){
%>

<%
for(int i = 0;i < plists.size(); i++){
PollDto poll = plists.get(i);
%>
	
	
	
<%
if(poll.getOldfilename() != null){
%>


		<div style="float: left; width: 100%; padding-top: 100px;">
	<a style=" background-color:#2E9AFE; color: #fff; border-radius: var(--size-border-radius);">&nbsp; No.<%=i+1 %>&nbsp;  </a> <i class="fas fa-user" style="color: #8A4B08; padding-right: 50px; padding-left: 100px;">&nbsp;<%=poll.getPolltotal() %>명이 투표에 참여했습니다.</i>  <i class="fas fa-list-ol" style="color: #8A4B08;">&nbsp;<%=poll.getItemcount() %>개의 보기가 있습니다.</i>  
		<div style="float: left;">
			<img src="http://192.168.0.195:8090/finalProject/upload/<%=poll.getFilename() %>" style="width: 350px; height: 250px;">
		</div>
	
		<div>
		
		<%	// 투표주제
				boolean isS = poll.isVote();	// 투표했음/안했음
				
				// 투표했음				기간만료
				if(isS == true || PollUtil.isEnd(poll.getEdate()) == true){	// 투표 못하게 처리함
					%>
					<i class="fas fa-vote-yea" style="color: orange; margin: 10px; 20px;">&nbsp;투표 완료</i><h1 style="font-family: 'Stylish', sans-serif;"><%=poll.getQuestion() %></h1> 
					<%
				}
				else{	//  투표를 안했음 && 기간아직 만료되지 않음 
					%>
							<i class="fas fa-check-circle" style="color: orange; margin: 10px; 20px;">&nbsp;현재 투표 가능</i>
							<h1 style="font-family: 'Stylish', sans-serif;"><%=poll.getQuestion() %></h1>
						<a href="polldetail.do?pollid=<%=poll.getPollid() %>" class="category_btn" style="border: 1px solid #aeaeae; color: #000; text-decoration: none;">투표하기</a>
					<%
				}		
				%>	
					<!-- 결과 -->
<%-- 				<%
				if(isS == true || PollUtil.isEnd(poll.getEdate()) == true){ // 결과확인 가능
					%> --%>
					
					<a href="pollresult.do?pollid=<%=poll.getPollid() %>" class="category_btn" style="border: 1px solid #aeaeae; color: #000; text-decoration: none;">결과확인</a>
					<hr>
					<br>
<%-- 					<%
				}
				else{	// 결과 확인을 할 수 없음
					%> --%>
					<i class="far fa-calendar-alt" style="color: #aeaeae;">&nbsp;<%=poll.getSdate() %>      ~      <%=poll.getEdate() %></i>
					<!-- <img alt="" src="image/paging.png" style="width: 20px; height: 20px;"> -->
<%-- 					<%
				}				
				%> --%>
		
			
			<br>
			
		</div>
	</div>
	

<%
}else{
%>


	<div style="float: left; width: 100%; padding-top: 100px;">
	<a style=" background-color:#2E9AFE; color: #fff; border-radius: var(--size-border-radius);">&nbsp; No.<%=i+1 %>&nbsp;  </a> <i class="fas fa-user" style="color: #8A4B08; padding-right: 50px; padding-left: 100px;">&nbsp;<%=poll.getPolltotal() %>명이 투표에 참여했습니다.</i>  <i class="fas fa-list-ol" style="color: #8A4B08;">&nbsp;<%=poll.getItemcount() %>개의 보기가 있습니다.</i>  
		<div style="float: left;">
			<img src="image/vote.png" alt="dddd" style="width: 350px; height: 300px;">
		</div>
	
		<div>
		<%	// 투표주제
				boolean isS = poll.isVote();	// 투표했음/안했음
				
				// 투표했음				기간만료
				if(isS == true || PollUtil.isEnd(poll.getEdate()) == true){	// 투표 못하게 처리함
					%>
					<i class="fas fa-vote-yea" style="color: orange; margin: 10px; 20px;">&nbsp;투표 완료</i><h1 style="font-family: 'Stylish', sans-serif;"><%=poll.getQuestion() %></h1>
					<%
				}
				else{	//  투표를 안했음 && 기간아직 만료되지 않음 
					%>
							<i class="fas fa-check-circle" style="color: orange; margin: 10px; 20px;">&nbsp;현재 투표 가능</i>
							<h1 style="font-family: 'Stylish', sans-serif;"><%=poll.getQuestion() %></h1>
							
						<a href="polldetail.do?pollid=<%=poll.getPollid() %>" class="category_btn" style="border: 1px solid #aeaeae; color: #000; text-decoration: none;">투표하기</a>
					<%
				}		
				%>	
					<!-- 결과 -->
<%-- 				<%
				if(isS == true || PollUtil.isEnd(poll.getEdate()) == true){ // 결과확인 가능
					%> --%>
					
					<a href="pollresult.do?pollid=<%=poll.getPollid() %>" class="category_btn" style="border: 1px solid #aeaeae; color: #000; text-decoration: none;">결과확인</a>
					<br><br>
<%-- 					<%
				}
				else{	// 결과 확인을 할 수 없음
					%> --%>
					<hr>
					<i class="far fa-calendar-alt" style="color: #aeaeae;">&nbsp;<%=poll.getSdate() %>      ~      <%=poll.getEdate() %></i>
					<!-- <img alt="" src="image/paging.png" style="width: 20px; height: 20px;"> -->
<%-- 					<%
				}				
				%> --%>
		

		</div>
	</div>


<%
}
%>		





<br>
<%
}
%>

<%
}
%>

</div>


</div>
</section>




