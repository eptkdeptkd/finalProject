<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/oj/psdetail.css">
<section id="menu" class="section">
        <div class="section_container">
<form name="frmForm" id="frm" method="post" action="bbsupdate.do">
<h1 class="h1">후기 남기기</h1>
<div class="psdetail">
<input type="hidden" name="seq" value="${ps.seq}"/>

<table class="list_table">

<tbody>	
	<tr class="id">
		<th>아이디</th>
		<td style="text-align: left">${ps.id}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td style="text-align: left">${ps.title}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td style="text-align: left">${ps.wdate}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left">
		<textarea class="pstextarea" readonly="readonly" name='content' id="_content">${ps.content}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
		<div>
			<c:if test="${ps.id eq login.id}">
			<button class="btn" type="button" id="_btnUpdate" title="글 수정">글 수정</button>
			<button class="btn" type="button" id="_btnDel" title="글 삭제">글 삭제</button>
			</c:if>
			<button class="btn" type="button" id="_btnReply" title="답글 입력">답글입력</button>
		</div>
		</td>
	</tr>
</tbody>
</table>
</div>
</form>
</div>
</section>


<script type="text/javascript">

$("#_btnUpdate").click(function() {	
	$("#frm").attr({ "target":"_self", "action":"psupdate.do" }).submit();
});
$("#_btnReply").click(function() {	
	$("#frm").attr({ "target":"_self", "action":"answer.do" }).submit();
});
$("#_btnDel").click(function() {			
	$("#frm").attr({ "target":"_self", "action":"psdelete.do" }).submit();
});

</script>






