<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style type="text/css">
tr._hover_tr:hover {
  background-color: #f0f5ff;
}
</style>

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

<script>
let choice = "<%=choice %>";
let searchWord = "<%=searchWord %>";
$(document).ready(function(){
	$("#_choice").val(choice);

	// $("#_searchWord").val(searchWord);
	document.frmForm1.searchWord.value = searchWord;
});
</script>

<section id="menu" class="section" style="padding-top: 300px; padding-bottom: 120px;">
    <div class="section_container">
		
		<div align="center">
			<h2><img src="image/notice.png" alt="" style="width: 150px; height: 150px;">공지사항</h2>
		</div>
		
		<!-- 검색 -->
		<div align="center">
		
		<form action="" name="frmForm1" id="_frmFormSearch" method="get">
		
		<table>
		<tr>
			<td>
				<select id="_choice" name="choice" style="border-color: #aeaeae;">
					<option value="" selected="selected">선택</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>		
				</select>
			</td>
			<td style="padding-left: 5px">
				<input type="text" id="_searchWord" name="searchWord">		
			</td>
			<td style="padding-left: 5px">
				<span>
					<a href="#none" id="btnSearch" title="검색하기">		
						<img src="image/search.png" alt="검색하기" style="width: 30px; height: 30px;" />검색
					</a>
				</span>
				<span>
					<a href="#none" id="btnWrite" title="글 작성하기">		
						<img src="image/write.png" alt="글 작성하기" style="width: 30px; height: 30px;" />글쓰기
					</a>
				</span>
			</td>
		</tr>
		</table>
		<!-- <a href="infolist.do" title="공지사항 게시판">리스트로 보기</a>	 -->	
		<a href="infoimage.do" title="공지사항 게시판">이미지로 보기</a>		
		
		<!-- 추가 기입 -->
		<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
		
		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
		
		</form>
		
		</div>
		
		
		
		
		<!-- arrow class 생성 -->
		<%-- <jsp:useBean id="ubbs" class="cc.factory.com.util.BbsArrow" /> --%>
		<div align="center">
		<table style="width: 85%;">
		<colgroup>
			<col style="width:70px">
			<col style="width:auto">
			<col style="width:100px">
			<col style="width:70px">
		</colgroup>
		
		<thead>
			<tr style="background-color: #ffffff; text-align: center;">
				<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${empty infolist }">
			<tr style="background-color: #ffffff; text-align: center;">
				<td colspan="4">작성된 글이 없습니다</td>		
			</tr>	
			</c:if>
		
		
			<c:forEach items="${infolist }" var="info" varStatus="vs">
			
				<!-- arrow를 setting -->
				<%-- <jsp:setProperty property="depth" name="ubbs" value="${bbs.depth }"/> --%>
				
				<tr style="background-color: #ffffff; text-align: center;">
					<td>${vs.count }</td>
					
					<c:if test="${info.del eq 1}">
						<td style="color: red;">[삭제된 공지사항입니다.]</td>
					</c:if>
					
			 		<c:if test="${info.del eq 0}">
						<td>
							<%-- <jsp:getProperty property="arrow" name="ubbs"/> --%>
							<a href="infodetail.do?seq=${info.seq }" style="color: #000">
								${info.title}
							</a>	
						</td>
					</c:if>			
					
					<td>${info.id}</td>
					<td>${info.readcount}</td>
				</tr>		
			</c:forEach>
		</tbody>
		</table>
		</div>
		
		<!-- paging -->
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

function goPage( pageNumber ){
	$("#_pageNumber").val( pageNumber );
	$("#_frmFormSearch").attr("action", "infolist.do").submit();	
}

$("#btnSearch").click(function(){
	//alert('btnSearch');
	$("#_frmFormSearch").attr("action", "infolist.do").submit();	
});

$("#btnWrite").click(function(){
	//alert('btnSearch');
	location.href="infowrite.do";	
});

</script>













