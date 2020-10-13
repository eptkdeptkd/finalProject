<%@page import="cc.factory.com.login.MemberDto"%>
<%@page import="cc.factory.com.dto.PollDto"%>
<%@page import="cc.factory.com.util.PollUtil"%>
<%@page import="cc.factory.com.dto.PollDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<PollDto> plists = (List<PollDto>)request.getAttribute("plists");

MemberDto mem = (MemberDto)session.getAttribute("login");
%>

<!-- 관리자 -->
<%
if(mem.getAuth() == 1){
%>
	<a href="pollmake.do">투표 만들기</a>
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
		<div style="float: left; width: 80%; padding-top: 100px;">
		No.<%=i+1 %>, <i class="fas fa-user"></i><%=poll.getPolltotal() %>, <i class="fas fa-list-ol"></i> <%=poll.getItemcount() %>
			<div style="float: left;">
				<img src="http://localhost:8090/finalProject/upload/<%=poll.getFilename() %>" style="width: 350px; height: 250px;">
			</div>
		
			<div>
				<h2><%=poll.getQuestion() %></h2>
				<i class="far fa-calendar-alt"></i> : <%=poll.getSdate() %>      ~      <%=poll.getEdate() %>
			</div>
		</div>
	</a>



<%
}else{
%>



	<a href="pollresult.do?pollid=<%=poll.getPollid() %>">
	
		<div style="float: left; width: 80%; padding-top: 100px;">
		No.<%=i+1 %>, <i class="fas fa-user"></i><%=poll.getPolltotal() %>, <i class="fas fa-list-ol"></i> <%=poll.getItemcount() %>
			<div style="float: left;">
				<img src="image/vote.png" alt="" style="width: 350px; height: 300px;">
			</div>
		
			<div>
				<h2><%=poll.getQuestion() %></h2>
				<i class="far fa-calendar-alt"></i> : <%=poll.getSdate() %>      ~      <%=poll.getEdate() %>
				
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


		<div style="float: left; width: 80%; padding-top: 100px;">
	No.<%=i+1 %>, <i class="fas fa-user"></i><%=poll.getPolltotal() %>, <i class="fas fa-list-ol"></i>  <%=poll.getItemcount() %>
		<div style="float: left;">
			<img src="http://localhost:8090/finalProject/upload/<%=poll.getFilename() %>" style="width: 350px; height: 250px;">
		</div>
	
		<div>
		
		<%	// 투표주제
				boolean isS = poll.isVote();	// 투표했음/안했음
				
				// 투표했음				기간만료
				if(isS == true || PollUtil.isEnd(poll.getEdate()) == true){	// 투표 못하게 처리함
					%>
					<i class="fas fa-vote-yea"></i>투표 완료<h2><%=poll.getQuestion() %></h2> 
					<%
				}
				else{	//  투표를 안했음 && 기간아직 만료되지 않음 
					%>
						<a href="polldetail.do?pollid=<%=poll.getPollid() %>">
							<h2><%=poll.getQuestion() %></h2>
						</a>
					<%
				}				
				%>	
				
					<!-- 결과 -->
				<%
				if(isS == true || PollUtil.isEnd(poll.getEdate()) == true){ // 결과확인 가능
					%>
					<h2><a href="pollresult.do?pollid=<%=poll.getPollid() %>">결과확인</a></h2>
					<%
				}
				else{	// 결과 확인을 할 수 없음
					%>
					<i class="far fa-calendar-alt"></i> : <%=poll.getSdate() %>      ~      <%=poll.getEdate() %>
					<!-- <img alt="" src="image/paging.png" style="width: 20px; height: 20px;"> -->
					<%
				}				
				%>
		
			
			<br>
			
		</div>
	</div>
	

<%
}else{
%>


	<div style="float: left; width: 80%; padding-top: 100px;">
	No.<%=i+1 %>, <i class="fas fa-user"></i><%=poll.getPolltotal() %>, <i class="fas fa-list-ol"></i>  <%=poll.getItemcount() %>
		<div style="float: left;">
			<img src="image/vote.png" alt="dddd" style="width: 350px; height: 300px;">
		</div>
	
		<div>
		<%	// 투표주제
				boolean isS = poll.isVote();	// 투표했음/안했음
				
				// 투표했음				기간만료
				if(isS == true || PollUtil.isEnd(poll.getEdate()) == true){	// 투표 못하게 처리함
					%>
					<i class="fas fa-vote-yea"></i>투표 완료<h2><%=poll.getQuestion() %></h2>
					<%
				}
				else{	//  투표를 안했음 && 기간아직 만료되지 않음 
					%>
						<a href="polldetail.do?pollid=<%=poll.getPollid() %>">
							<h2><%=poll.getQuestion() %></h2>
						</a>
					<%
				}				
				%>	
				
					<!-- 결과 -->
				<%
				if(isS == true || PollUtil.isEnd(poll.getEdate()) == true){ // 결과확인 가능
					%>
					<h2><a href="pollresult.do?pollid=<%=poll.getPollid() %>">결과확인</a></h2>
					<%
				}
				else{	// 결과 확인을 할 수 없음
					%>
					<!-- <img alt="" src="image/paging.png" style="width: 20px; height: 20px;"> -->
					<%
				}				
				%>
			<br>
			<i class="far fa-calendar-alt"></i> : <%=poll.getSdate() %>      ~      <%=poll.getEdate() %>
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








