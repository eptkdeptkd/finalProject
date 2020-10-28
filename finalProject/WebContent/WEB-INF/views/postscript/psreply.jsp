<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/oj/psreply.css">


<section id="menu" class="section">
  <div class="section_container">
 <form name="frmForm" id="frm" method="post" action="bbsreplyAf.do">
<h1 class="h1">댓글쓰시오</h1>
<div class="pswrite">
<table class="list_table">
<tbody align="center">	
<tr class="id">
	<th>아이디</th>
	<td style="text-align: left">${ps.id}</td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left">
		<input = type="text" readonly="readonly" name="title" value='${ps.title}'/>
	</td>
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
</tbody>

</table>
</div>



<h1 class="h1">답글</h1>
<div class="pswrite">
<input type="hidden" name="seq" value="${ps.seq}"/>
<table class="list_table">

<tbody>	

<tr class="id">
	<th>아이디</th>
	<td style="text-align: left">
	<input type="text" name="id" readonly="readonly" 
	value='${login.id}' size="60"/>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left">
	<input type="text" name="title" id="title1" size="60"/>
	</td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left">
		<textarea class="pstextarea" name='content' id="content1"></textarea>
	</td>
</tr>
</tbody>

</table>
</div>
</form>
<button type="button" class="btn" id="_btnReply" title="답글 입력">답글입력</button>

</div>
</section>

<script type="text/javascript">
$("#_btnReply").click(function() {
	
	var title = $("#title1").val()
	var cont = $("#content1").val()
	
	if (title == '' || title == null) {
		swal("warning!", "제목을 입력해주세요", "warning");
			return false;
	}
	if (cont == '' || cont == null) {
		swal("warning!", "내용을 입력해주세요", "warning");
		return false;
	} else {
		swal("GOOD JOB!" , "답글 성공.", "success").then(function(){
			$("#frm").attr({ "target":"_self", "action":"answerAf.do" }).submit();
		});
	}		
});
</script>