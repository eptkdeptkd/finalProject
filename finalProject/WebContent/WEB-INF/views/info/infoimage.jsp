<%@page import="cc.factory.com.login.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="cc.factory.com.dto.PollDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		



<%
	String choice = (String)request.getAttribute("choice");
	if(choice == null) choice = "";
	
	System.out.println("choice2 ="+ choice);
	
	String searchWord = (String)request.getAttribute("searchWord");
	if(searchWord == null) searchWord = "";
	
	System.out.println("searchWord2 ="+ searchWord);
	
	if(searchWord.equals("")){
		choice = "";
	}
%>


<section id="menu" class="section" style="padding-top: 300px; padding-bottom: 120px;"> 
	<div class="section_container">

		
		
		<div align="center" >
			<img src="image/infomain.jpg" alt="공지사항" style="width: 70%; height: 300px;">
			<h1 style="font-family: 'Stylish', sans-serif; padding-bottom: 30px;">놓치면 아까운 이벤트 소식부터, 유용한 정보들이 한가득! <br> 찰스 커피의 각종 소식과 정보를 <br> 공지사항을 통해 확인하세요. </h1>
<!-- 		</div> -->
		
		<!-- 검색 -->
		<!-- <div align="center"> -->
		
			<form action="" name="frmForm1" id="_frmFormSearch" method="get">
				<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
				<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
			
			
			<%-- <c:if test="${empty login }">
			empty
			</c:if>
			
			<c:if test="${not empty login }">
			no empty   ${login.pwd }
			</c:if> --%>
			
			
				<table>
					<tr>
						<td>
							<select id="_choice" name="choice" style="border: 1px solid #c6c6c6;padding-left: 10px;outline: none;">
								<option value="" selected="selected">선택</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>		
							</select>
						</td>
						<td style="padding-left: 5px">
							<input type="text" id="_searchWord" name="searchWord" style="border: 1px solid #c6c6c6;padding-left: 10px;outline: none;">		
						</td>
						<td style="padding-left: 5px">
							<span>
								<a href="#none" id="btnSearch" title="검색하기" style="color: #000;text-decoration: none;">		
									<img src="image/search.png" alt="검색하기" style="width: 30px; height: 30px;" />검색
								</a>
							</span>
							
						<%-- <c:if test="${info.auth eq 3}"> --%>
						<c:if test="${login.auth eq 1}">
							<span>
								<a href="#none" id="btnWrite" title="글 작성하기" style="color: #000;text-decoration: none;">		
									<img src="image/write.png" alt="글 작성하기" style="width: 30px; height: 30px;" />글쓰기
								</a>
							</span>
						</c:if>
					
					
						</td>
					</tr>
				</table>
				
			</form>
				
			
				<!-- <a href="infolist.do" title="공지사항 게시판">리스트로 보기</a>		 -->
				<!-- <a href="infoimage.do" title="공지사항 게시판">이미지로 보기</a>	 -->
				
				<!-- 추가 기입 -->

		
			
		
		<!-- </div> -->
		
		
		
		<!-- View -->
		<!-- <div align="center"> -->
			<c:if test="${empty infolist }">
				<div style="background-color: #ffffff; text-align: center;">
					작성된 글이 없습니다	&nbsp;
				</div>
			</c:if>
			
			<c:forEach items="${infolist }" var="info" varStatus="vs">
				<div style="background-color: #ffffff; text-align: center;">
					<c:if test="${info.del eq 1}">
						<div  style="float: left; padding: 20px;" >
							<img src="image/infodelete.png" alt="" style="width: 350px; height: 320px;">	
						</div>
					</c:if>
				
			 		<c:if test="${info.del eq 0}">
			 		
						<c:if test="${info.oldfilename eq null}">
							<div  style="float: left; padding: 20px;" >
								<a href="infodetail.do?seq=${info.seq }" style="color: #000;text-decoration: none;">
									<img src="image/emptyimage.jpg" alt="" style="width: 350px; height: 320px;">	
									<h2 style="font-family: 'Stylish', sans-serif;color: orange; ">${info.title}</h2>
									<%-- <br>${info.id} --%>
									<i class="fas fa-eye" style="color: #8A4B08;">조회수 &nbsp; ${info.readcount}</i> 
								</a>
							</div>
						</c:if>
						
				 		<c:if test="${info.oldfilename ne null}">
							<div  style="float: left; padding: 20px;" >
								<a href="infodetail.do?seq=${info.seq }" style="color: #000; text-decoration: none;">
									<img src="http://192.168.0.195:8090/finalProject/upload/${info.filename }" style="width: 350px; height: 320px;">	
									<h2 style="font-family: 'Stylish', sans-serif; color: orange; font-size:22px;">${info.title}</h2>
									<i class="fas fa-eye" style="color: #8A4B08;">조회수 &nbsp; ${info.readcount}</i> 
								</a>	
							</div>
						</c:if>
						
					</c:if>			
				</div>		
				
			</c:forEach>
			&nbsp;
			
			
				
			
		</div>
		
		
		
		
		
		<!-- paging -->
		<style>
			#paging_wrap:after {
				content: '';
				display: table;
				clear: both;
			}
		</style>
		<div id="paging_wrap" align="center">
			<jsp:include page="/WEB-INF/views/info/paging.jsp" flush="false">
				<jsp:param name="totalRecordCount" value="${totalRecordCount }"/>
				<jsp:param name="pageNumber" value="${pageNumber }"/>
				<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }"/>
				<jsp:param name="recordCountPerPage" value="${recordCountPerPage }"/>	
			</jsp:include>
		</div>

 </div> 
</section>



<script>
	let choice = "<%=choice %>";
	let searchWord = "<%=searchWord %>";
	$(document).ready(function(){
		$("#_choice").val(choice);
	
		// $("#_searchWord").val(searchWord);
		document.frmForm1.searchWord.value = searchWord;
	});
</script>




<script>

	function goPage( pageNumber ){
		$("#_pageNumber").val( pageNumber );
		$("#_frmFormSearch").attr("action", "infoimage.do").submit();	
	}
	
	$("#btnSearch").click(function(){
		//alert('btnSearch');
		$("#_frmFormSearch").attr("action", "infoimage.do").submit();	
	});
	
	$("#btnWrite").click(function(){
		//alert('btnSearch');
		location.href="infowrite.do";	
	});

</script>













