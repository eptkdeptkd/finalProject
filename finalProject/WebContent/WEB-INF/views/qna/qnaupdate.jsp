<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <section id="menu" class="section">
    <div class="section_container">
    <div align="center">
    <h2> 글 수정 </h2>

	<form id="frm" method="get">
	<input type="hidden" name="seq" value="${oneQna.seq }">
	<input type="hidden" name="id" value="${oneQna.id }">
		<table>
			<tr>
				<td>id: 
				<input type="text" name="id"  value='${oneQna.id }' size="60" disabled="disabled"/>
				</td>
			</tr>
			<tr>
				<td>제목: <input type="text" name="title" id="updateQnaTtl" value="${oneQna.title }">
				</td>
			</tr>
			<tr>
				<td>내용: <textarea rows="10" cols="50" name="content" id="updateQnaCon">${oneQna.content }</textarea>
				</td>
			</tr>
			<tr>
				<td>
				비밀글
				<c:if test="${oneQna.secret eq 1}">
					<input type="checkbox" name="secret" id="secret" value="" checked="checked">
				</c:if>
				<c:if test="${oneQna.secret eq 0}">
					<input type="checkbox" name="secret" id="secret" value="">
				</c:if>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" id="update">글 수정</button>
					<button type="button" id="delete">글 삭제</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>    
</section>

<script>

//글 수정
$("#update").click(function() {

	var titl = $("#updateQnaTtl").val()
	var cont = $("#updateQnaCon").val()
	if (cont == '' || cont == null) {
		alert('내용을 입력해주세요');
		return false;
	}
	if (titl == '' || titl == null) {
		alert('제목을 입력해주세요');
		return false;
	}
	 if ($("#secret").is(":checked") == true) {
		alert("체크함");
		$("input[name=secret]").val("1");
	} else {
		alert("안함");
		$("input[name=secret]").val("0");
	}  
		
	
	alert("수정");
	$("#frm").attr("action", "qnaupdateAf.do").submit();	
});

//글 삭제
//db 돌릴때 연결 댓글 삭제와 동시에 요것 삭제
$("#delete").click(function() {
	alert("삭제");
	$("#frm").attr("action", "qnadelete.do").submit();	
});
</script>