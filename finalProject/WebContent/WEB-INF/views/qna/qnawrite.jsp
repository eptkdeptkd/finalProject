<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

 <section id="menu" class="section">
        <div class="section_container">
        <div align="center">
	<h2>글 추가</h2>

	<form id="frm" method="get">
		<table border="1">
			<tr>
				<td>작성자: <input type="text" name="id" readonly="readonly"
					value='${login.id}' size="60" /></td>
			</tr>
			<tr>
				<td>제목: <input type="text" name="title" id="writeQnaTtl">
				</td>
			</tr>
			<tr>
				<td>내용:</td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="50" id="writeQnaCon"
						name="content"></textarea></td>
			</tr>
			<tr>
				<td>비밀 글로 설정하겠냐? <input type="checkbox" id="secret"> <input
					type="hidden" name="secret" value="">
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" id="write">글 쓰기</button>
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
		var titl = $("#writeQnaTtl").val()
		var cont = $("#writeQnaCon").val()
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
		$("#frm").attr("action", "qnawriteAf.do").submit();

	});

	//값들 널일때 alert
</script>
