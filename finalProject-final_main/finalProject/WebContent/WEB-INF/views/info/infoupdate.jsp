<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<section id="menu" class="section">
    <div class="section_container">
		    
		    
		
		<form name="frmForm" id="_frmForm" method="post" action="bbsupdateAf.do">
		
		<table class="list_table" style="width:85%;">
		
		<input type="hidden" name="seq" value="${info.seq}"/>
		
		<colgroup>
		<col style="width:200px;" />
		<col style="width:auto;" />
		</colgroup>
		
		<tbody>	
		<tr class="id">
			<th>아이디</th>
			<td style="text-align: left">${info.id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td style="text-align: left">
				<input size="60" type="text" name="title" value='${info.title}' >
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td style="text-align: left">${info.wdate}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="text-align: left"><textarea rows="10" cols="50" 
			name='content' id="_content">${info.content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2" style="height:50px; text-align:center;">
				<span>
					<i class="far fa-edit" id="_btnUpdate">수정</i>
				</span>
			</td>
		</tr>
		
		</tbody>
		</table>
		
		</form>
</div>
</section>



<script type="text/javascript">
$("#_btnUpdate").click(function() {	
	//alert('글수정하기');	
	$("#_frmForm").attr({ "target":"_self", "action":"infoupdateAf.do" }).submit();
});
</script>