<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/dw/qna.css">

 <section id="menu" class="section">
        <div class="section_container">
        <div align="center">
    <br>
    <h2> 글 추가 </h2>
	<br><hr><br>

	<form id="frm" method="get">
		<table>
			<tr>
			<th>작성자 </th>
				<td><input type="text" name="id" readonly="readonly"
					value='${login.id}' size="60" /></td>
			</tr>
			<tr>
			<th>제목</th>
				<td> <input type="text" name="title" id="writeQnaTtl">
				</td>
			</tr>
			<tr>
			<th>내용</th>
				<td><textarea rows="9" cols="80" id="writeQnaCon"
						name="content"></textarea></td>
			</tr>
			<tr>
				<th>비밀글</th>
				<td> <input type="checkbox" id="secret"> <input
					type="hidden" name="secret" value="">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				
					<button type="button" class="searBtn" id="write">글 쓰기</button>
				
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>

</section>

<script>
	$("#write").click(function() {
		//입력값 체크
		var titl = $("#writeQnaTtl").val();
		var cont = $("#writeQnaCon").val();
		
		if (titl == '' || titl == null) {
			alert('제목을 입력해주세요');
			return false;
		}
		if (cont == '' || cont == null) {
			alert('내용을 입력해주세요');
			return false;
		}		
		if ($("#secret").is(":checked") == true) {
			//alert("체크함");
			$("input[name=secret]").val("1");
		} else {
			//alert("안함");
			$("input[name=secret]").val("0");
		}
		$("#frm").attr("action", "qnawriteAf.do").submit();

	});

	//값들 널일때 alert
</script>
