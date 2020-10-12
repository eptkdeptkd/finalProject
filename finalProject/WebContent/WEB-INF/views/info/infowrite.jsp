<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<h2><img src="image/writeinfo.png" alt="" style="width: 80px; height: 80px;" /> 공지사항 작성</h2>
<form name="frmForm" id="_frmForm" method="post" action="infowriteAf.do" enctype="multipart/form-data">
<input type="file" name="fileload" size="20" required="required">

<table style="width:85%;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	
	<tr class="id">
		<th>아이디</th>
		<td style="text-align: left">
			<input type="text" name="id" readonly="readonly" value='${login.id}' size="60"/>
			<!-- <input type="text" name="id" size="60" value="aaa" /> -->
		</td>
	</tr>
	<tr>
		<th>제목</th>
			<td style="text-align: left">
				<input type="text" name="title" size="60"/>
			</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left">
			<textarea rows="10" cols="50" name='content' id="_content"></textarea>
		</td>
	</tr>
</tbody>
</table>


	<span>					
		<i class="fas fa-pencil-alt" id="btnWriteAf" style="color:orange;">글작성</i>
	</span>
	<br>
	<a href="infoimage.do" title="공지사항 게시판으로 돌아가기">이미지게시판으로 가기</a>	
	<br>
	<a href="infolist.do" title="공지사항 게시판으로 돌아가기">메인 게시판으로 가기</a>	

</form>

<script type="text/javascript">
$("#btnWriteAf").click(function() {	
	//alert('글작성');	
	$("#_frmForm").attr({ "target":"_self", "action":"infowriteAf.do" }).submit();	
});
</script>