<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<h3>부모글</h3>

<table class="list_table" style="width:85%;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	

<tr class="id">
	<th>아이디</th>
	<td style="text-align: left">${bbs.id}</td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left">
		<input size="60" type="text" name="title" value='${bbs.title}' >
	</td>
</tr>
<tr>
	<th>작성일</th>
	<td style="text-align: left">${bbs.wdate}</td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left"><textarea rows="10" cols="50" 
	name='content' id="_content">${bbs.content}</textarea></td>
</tr>
</tbody>

</table>

<hr/>
<h3>답글</h3>

<form name="frmForm" id="_frmForm" method="post" action="bbsreplyAf.do">
<input type="hidden" name="seq"   value="${bbs.seq}"/>

<table class="list_table" style="width:85%;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	

<tr class="id">
	<th>아이디</th>
	<td style="text-align: left"><input type="text" name="id" readonly="readonly" 
	value='${login.id}' size="60"/></td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left"><input type="text" name="title" size="60"/></td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left">
		<textarea rows="10" cols="50" name='content' id="_content"></textarea>
	</td>
</tr>
<tr>
<td colspan="2" style="height:50px; text-align:center;">
	<span>
	<a href="#none" id="_btnReply" title="답글달기"><img src="image/breply.png" alt="답글달기" /></a>
	</span>
</td>
</tr>

</tbody>

</table>
</form>

<script type="text/javascript">
$("#_btnReply").click(function() {	
	alert('답글달기');	
	$("#_frmForm").attr({ "target":"_self", "action":"answerAf.do" }).submit();
});
</script>