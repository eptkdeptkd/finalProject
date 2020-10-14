<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js"
	type="text/javascript"></script>

</head>
<body>

	    <section id="menu" class="section">
        <div class="section_container">
        
        
        
	<div id="test" style="background-color: yellow;">
		<div class="login_title_warp">
			<div style="margin-top: 15px">
				<h2>My Home Page</h2>
			</div>
		</div>

		<div id="login_wrap">

			<form action="loginAf.do" name="frmFrom" id="_frmForm" method="post">

				<table class="content_table" style="width: 75%">
					<colgroup>
						<col style="width: 30%">
						<col style="width: 70%">
					</colgroup>

					<tr>
						<th style="background: #eeeeee; color: #3e5fba">아이디</th>
						<td>&nbsp;<input type="text" id="_userid" name="id"
							data-msg="ID를 " size="20px" title="아이디"
							style="border: 1px solid #dddddd" placeholder="ID"> <input
							type="checkbox" id="chk_save_id">ID 저장
						</td>
					</tr>

					<tr>
						<th style="background: #eeeeee; color: #3e5fba">패스워드</th>
						<td>&nbsp;<input type="text" id="_pwd" name="pwd"
							data-msg="Password를 " size="20px" title="패스워드"
							style="border: 1px solid #dddddd" placeholder="Password">
						</td>
					</tr>

					<tr>
						<td colspan="2" style="height: 20px; text-align: center;">
							<a href="#none" id="_btnLogin" title="로그인">로그인<img alt=""
									src="./image/login_btn.jpg">
							</a> 
							<a href="#none" id="_btnRegi" title="회원가입">회원가입</a><img alt=""
									src="./image/regi.jpg">
							</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	
	
	
	</div>
	</section>


	<script type="text/javascript">
		$("#_btnLogin").click(function() {
			//alert("login click");

			if ($("#_userid").val().trim() == "") {
				alert($("#_userid").attr("data-msg") + "입력해 주십시오");
				$("#_userid").focus();
			} else if ($("#_pwd").val().trim() == "") {
				alert("Password를 입력해 주십시오");
				$("#_pwd").focus();
			} else {
				$("#_frmForm").attr({
					"action" : "loginAf.do",
					"target" : "_self"
				}).submit();
			}
		});

		let user_id = $.cookie("user_id");
		if (user_id != null) {
			//alert("쿠키 있음");
			$("#_userid").val(user_id);
			$("#chk_save_id").attr("checked", "checked");
		}

		$("#chk_save_id").click(function() {

			if ($("#chk_save_id").is(":checked")) { // 첵크 되었을 때
				if ($("#_userid").val().trim() == "") {
					alert("id를 입력해 주십시오");
					$("#chk_save_id").prop("checked", false);
				} else {
					$.cookie("user_id", $("#_userid").val(), {
						expires : 356,
						path : '/'
					});
				}
			} else {
				alert("쿠키 삭제");
				$.removeCookie("user_id", {
					path : '/'
				});
			}
		});

		$("#_btnRegi").click(function() {
			location.href = "regi.do";
		});
	</script>


</body>
</html>





