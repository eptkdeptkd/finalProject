<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>>
<%
	System.out.println("세션값 확인용 " + session.getAttribute("login"));
%>

<style>
.list_table {
	padding-left: 50px;
	font-family: 'Poor Story', cursive;
}
</style>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/dw/qna.css">

<section id="menu" class="section">
	<div class="section_container">

		<h2>QnA 상세 보기</h2>

		<div align="center">
			<form id="frm" method="get">
				<input type="hidden" name="seq" value="${oneQna.seq }"> <input
					type="hidden" name="id" value="${oneQna.id }">
				<table>
					<colgroup>
						<col style="width: 200px">
						<col style="width: 500px">
					</colgroup>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="id" value='${oneQna.id }'
							size="60" disabled="disabled" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" disabled="disabled"
							value="${oneQna.title }"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="9" cols="80" name="content"
								disabled="disabled">${oneQna.content }</textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<c:if
								test="${login.id eq oneQna.id}">
								<button type="button" class="searBtn" id="update">글 수정</button>
								<button type="button" class="searBtn" id="delete">글 삭제</button>
							</c:if>
							<button type="button" class="searBtn" id="goList">목록으로</button></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 리플 불러오기 -->
		<div align="center">
			<table class="list_table">
				<colgroup>
					<col style="width: 140px">
					<col style="width: 380px">
					<col style="width: 180px">
				</colgroup>
				<tbody>
					<c:if test="${empty relist }">
						<tr>
							<td colspan="3">작성된 글이 없습니다</td>
						</tr>
					</c:if>

					<c:forEach items="${relist }" var="reply" varStatus="vs">
						<tr>
							<td>${reply.id}</td>
							<td style="text-align: left;">${reply.content}</td>
							<td>${fn:substring(reply.wdate,0,10)}
							<c:if test="${login.id eq reply.id}">
									<button type="button" class="remoReplyBtn searBtn"
										reseq="${reply.seq }" reqnaseq="${reply.qnaseq }">삭제</button>
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br><br>
		<!-- 리플 페이징 -->
		<form action="" name="frmForm1" id="_frmFormSearch" method="get">
			<input type="hidden" name="pageNumber" id="_pageNumber"
				value="${(empty pageNumber)?0:pageNumber }"> <input
				type="hidden" name="recordCountPerPage" id="_recordCountPerPage"
				value="${(empty recordCountPerPage)?0:recordCountPerPage }">
			<input type="hidden" name="seq" id="_recordCountPerPage"
				value="${oneQna.seq }">
			<jsp:include page="/WEB-INF/views/qna/paging.jsp" flush="false">
				<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
				<jsp:param name="pageNumber" value="${pageNumber }" />
				<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
				<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
			</jsp:include>
		</form>

		<br>

		<div align="center">
			<!-- 리플 작성 부분 -->
			<c:if test="${login.id eq null}">
				<!--  -->
				<table>
					<tr>
						<td>로그인을 해야 댓글입력이 가능합니다.</td>
					</tr>
				</table>
			</c:if>

			<c:if test="${login.id ne null}">
				<form id="replyFrm" method="get">
					<input type="hidden" name="qnaseq" value="${oneQna.seq }">
					<input type="hidden" name="id" value="${login.id}">
					<table>
						<tr>
							<td><textarea rows="2" cols="50" name="content"
									id="writeReCon"></textarea></td>
							<td>
								<button type="button" class="searBtn" id="replyBtn">댓글쓰기</button>
							</td>
						</tr>
					</table>
				</form>
			</c:if>
			<!--  -->
		</div>

	</div>
</section>

<script>
	//버튼들은 기능 묻기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//댓글 입력
	$("#replyBtn").click(function() {
		//alert("댓글 입력");	
		var conte = $("#writeReCon").val()

		if (conte == '' || conte == null) {
			swal('내용을 입력해주세요');
			return false;
		} else {
			/*
			var reply = confirm("댓글을 입력하시겠습니까?");
			if (reply) {
				$("#replyFrm").attr("action", "qnareplywrite.do").submit();
			}
			*/
			swal({
			    title: "댓글을 입력하시겠습니까?",
			    type: "warning",
			    showCancelButton: true,
			    confirmButtonColor: '#DD6B55',
			    confirmButtonText: 'Yes',
			    cancelButtonText: "No",
			    closeOnConfirm: false,
			    closeOnCancel: false
			 },
			 function(isConfirm){
			   if (isConfirm){
			     swal("등록되었습니다!", "", "success");
			     $("#replyFrm").attr("action", "qnareplywrite.do").submit();

			    } else {
			      swal("취소하셨습니다", "", "error");
			    }
			 });
		}		
	});

	//댓글 삭제
	$(".remoReplyBtn").click(
			function() {
				//alert("삭제랑 시퀀스 컨펌으로");
				//alert($(this).attr("reseq"));
				//alert($(this).attr("reqnaseq"));
				location.href = "qnareplyremove.do?seq="
						+ $(this).attr("reseq") + "&qnaseq="
						+ $(this).attr("reqnaseq");
			});

	//목록으로
	$("#goList").click(function() {
		//alert("goList");
		$("#frm").attr("action", "qna.do").submit();
	});

	//글 수정
	$("#update").click(function() {
		$("#frm").attr("action", "qnaupdate.do").submit();
	});

	//글 삭제
	$("#delete").click(function() {
		$("#frm").attr("action", "qnadelete.do").submit();
	});

	function goPage(pageNumber) {
		$("#_pageNumber").val(pageNumber);
		$("#_frmFormSearch").attr("action", "qnadetail.do").submit();
	}
</script>