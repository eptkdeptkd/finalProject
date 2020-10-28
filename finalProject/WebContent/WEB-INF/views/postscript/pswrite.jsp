<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/oj/pswrite.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<section id="menu" class="section">
        <div class="section_container">

<form name="frmForm" id="frm" method="post" action="pswriteAf.do">
<h1 class="h1">후기 남기기</h1>
<div class="pswrite">
<table class="list_table" >
<tbody align="center">	
	<tr class="id">
		<th>아이디</th>
		<td style="text-align: center;">
			<input type="text" name="id" readonly="readonly" value='${login.id}'/>
		</td>
	</tr>
	<tr>
		<th>제목</th>
			<td style="text-align: center;">
				<input type="text" name="title" id="title1"/>
			</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: center;">
			<textarea class="pstextarea" name='content' id="content1"></textarea>
		</td>
			
	</tr>
				
</tbody>
</table>
</div>
<button type="button" class="btn" id="_btnLogin" title="글쓰기">글올리기</button>
</form>
</div>

</section>


<script type="text/javascript">
$("#_btnLogin").click(function() {

	var title = $("#title1").val()
	var cont = $("#content1").val()
	
	if (title == '' || title == null) {
	swal("warning!", "제목을 입력해주세요", "warning");
			return false;
	}
	if (cont == '' || cont == null) {
		swal("warning!", "내용을 입력해주세요", "warning");
		return false;
	}else{
			swal("GOOD JOB!" , "후기 올리기 성공.", "success").then(function(){
				$("#frm").attr({ "target":"_self", "action":"pswriteAf.do" }).submit();	
		});
	}
});
</script>
