<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	System.out.print(session.getAttribute("login"));
%>
<style>
/* The Modal (background) */
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 70%; /* Could be more or less, depending on screen size */
}

/* --------------------------------------------------- */
/* The Modal (background) */
.searchModal2 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4);
	top: 0; /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content2 {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 70%; /* Could be more or less, depending on screen size */
}
/* -------------------------------------------------------------------------------- */
#tes li {
	list-style-type: none;
	float: left;
	outline: 1px solid red;
	margin-left: 30px;
}
</style>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<section id="menu" class="section">
	<div class="section_container">

		<h2>회원 정보</h2>



		<br> ${login.visitcount%10 }장 - 나머지값 확인용 <br>

		<div>
			이름:${login.name } <br> 이메일:${login.email }
		</div>

		<div align="center">
			<ul style="list-style: none;">
				<li style="float: left; margin-right: 300px" id="updPro">정보 수정</li>
				<li style="float: left;" id="couponChk">쿠폰: <fmt:parseNumber
						value="${login.visitcount/10 }" integerOnly="true" />장
				</li>
			</ul>

		</div>

		<br>

		<!--  -->
		<div id="modal" class="searchModal">
			<div class="search-modal-content">
				<div class="page-header">
					<h1>MODAL</h1>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-12">
								<!--  -->
								<div align="center">
									<c:choose>

										<c:when test="${login.visitcount%10<5}">
											<!-- 5미만인 경우 -->
											<table border="1">

												<col width="40">
												<col width="40">
												<col width="40">
												<col width="40">
												<col width="40">
												<tr>

													<c:forEach begin="1" end="${login.visitcount%10}" step="1">
														<td><i class="fas fa-coffee"></i></td>
													</c:forEach>
													<c:forEach begin="1" end="${10-(login.visitcount%10)}"
														step="1" varStatus="status">
														<td><span class="far fa-circle"></span></td>
														<c:if test="${status.index eq 5-(login.visitcount%10)}">
												</tr>
												<tr>
													</c:if>
													</c:forEach>
												</tr>
											</table>
										</c:when>

										<c:when test="${login.visitcount%10>=5}">
											<!-- 5이상인 경우 -->
											<table border="1">
												<tr>
													<c:forEach begin="1" end="${login.visitcount%10}" step="1"
														varStatus="status">
														<td><i class="fas fa-coffee"></i></td>
														<c:if test="${status.index eq 5}">
												</tr>
												<tr>
													</c:if>
													</c:forEach>


													<c:forEach begin="1" end="${10-(login.visitcount%10)}"
														step="1">
														<td><span class="far fa-circle"></span></td>
													</c:forEach>
												</tr>
											</table>
										</c:when>

									</c:choose>
								</div>
								<!--  -->
							</div>
						</div>
					</div>
					<hr>
					<div
						style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
						onClick="closeModal();">
						<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
						</span>
					</div>
				</div>
			</div>
		</div>


		<div id="modal2" class="searchModal2">
			<div class="search-modal-content2">
				<div align="right" id="exitMo">끄기</div>
				<div class="page-header">
					<h1>회원정보 수정/삭제</h1>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-12" align="center">
								<form id="frm">
									<table border="1">
										<tr>
											<th>id</th>
											<td><input name="id" value="${login.id }"
												readonly="readonly"></td>
										</tr>
										<tr>
											<th>pwd 입력</th>
											<td><input></td>
										</tr>
										<tr>
											<th>pwd 확인</th>
											<td><input name="pwd" value="">
												<button type="button" id="pwdChk">체크</button></td>
										</tr>
										<tr>
											<th>name</th>
											<td><input name="name" value="${login.name }"></td>
										</tr>
										<tr>
											<th>email</th>
											<td><input name="email" value="${login.email }"></td>
										</tr>
										<tr>
											<td colspan="2" align="center">
												<button type="button" id="updMem">수정</button>
												<button type="button" id="delMem">탈퇴</button>
											</td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div>
			<ul id="tes">
				<li id="yup1">li 1</li>
				<li value="yup2">li 2</li>
				<li value="yup3">li 3</li>
				<li value="yup4">li 4</li>
			</ul>
		</div>
		<br>
		<div id="lis1">${list }</div>
		<%-- <div id="lis2">${qlist }</div>
		<div id="lis3">${ilist }</div>
		<div id="lis4">${clist }</div> --%>


	</div>
</section>

<script>
	//정보 수정 모달
	$("#updPro").click(function() {
		$("#modal2").show();
	});
	$('#exitMo').click(function() {
		$('.searchModal2').hide();
	});
	$("#pwdChk").click(function() {
		alert("ck");
	});

	$("#updMem").click(function() {
		alert("수정");
		$("#frm").attr("action", "updateId.do").submit();	
		
	});
	$("#delMem").click(function() {
		alert("삭제");
		$("#frm").attr("action", "deleteId.do").submit();	
	});
	

	//쿠폰 확인 모달
	$("#couponChk").click(function() {
		$("#modal").show();
	});
	function closeModal() {
		$('.searchModal').hide();
	};

	$('.searchModal').click(function() {
		$('.searchModal').hide();
	});

	//밑에 쓸
	//초기화
	$("#lis2").hide();
	$("#lis3").hide();
	$("#lis4").hide();

	$("#tes li").click(function() {
		console.log($(this).text());
		var check = $(this).text();
		if (check == "li 1") {
			$("#lis1").show();
			$("#lis2").hide();
			$("#lis3").hide();
			$("#lis4").hide();
		} else if (check == "li 2") {
			$("#lis1").hide();
			$("#lis2").show();
			$("#lis3").hide();
			$("#lis4").hide();
		} else if (check == "li 3") {
			$("#lis1").hide();
			$("#lis2").hide();
			$("#lis3").show();
			$("#lis4").hide();
		} else if (check == "li 4") {
			$("#lis1").hide();
			$("#lis2").hide();
			$("#lis3").hide();
			$("#lis4").show();
		}
	});
</script>



