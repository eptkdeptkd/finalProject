<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<form name="frmForm" id="_frmForm" method="post" action="psupdateAf.do">

<table class="list_table" style="width:85%;">

<input type="hidden" name="seq" value="${ps.seq}"/>

<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	
<tr class="id">
	<th>아이디</th>
	<td style="text-align: left">${ps.id}</td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left">
		<input size="60" type="text" name="title" value='${ps.title}' >
	</td>
</tr>
<tr>
	<th>작성일</th>
	<td style="text-align: left">${ps.wdate}</td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left"><textarea rows="10" cols="50" 
	name='content' id="_content">${ps.content}</textarea></td>
</tr>
<tr>
	<td colspan="2" style="height:50px; text-align:center;">
		<span>
			<a href="#none" id="_btnUpdate" title="글수정하기"><img src="image/bupdate.png" alt="수정하기" /></a>
		</span>
	</td>
</tr>

</tbody>
</table>

</form>

<script type="text/javascript">
$("#_btnUpdate").click(function() {	
	alert('글수정하기');	
	$("#_frmForm").attr({ "target":"_self", "action":"psupdateAf.do" }).submit();
});
</script>


