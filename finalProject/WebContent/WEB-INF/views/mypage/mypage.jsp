<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	System.out.print(session.getAttribute("login"));
%>
<style>
#frm input{
	padding: 20px 10px 10px;
	border: none;
	border-bottom: 1px solid #999;
}
#frm th{
	font-size: 13px;
	font-weight: lighter;
}

#cholist li {
	float: left;
}

.mypt table {
	font-family: 'Poor Story', cursive;
	width: 900px;
}

.mypt table th {
	background: #e27049;
	color: #eeeeee;
}

.mypt table tr {
	border-bottom: 1px solid #bdbdbd;
}

.mypt table tr:last-child {
	border-bottom: 1px solid #a52a2a;
}

hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 1px solid #000;
	margin: 1em;
	padding: 0;
} 
.couponTable{
	border: 1px solid black;	
}
.couponTable tr td{
	padding: 20px 20px 20px 20px;	
	align-items: ce
}
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
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content2 {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 70%; /* Could be more or less, depending on screen size */
}

/* --------------------------------------------------- */
/* The Modal (background) */
.searchModal1 {
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
.search-modal-content1 {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 70%; /* Could be more or less, depending on screen size */
}
/* --------------------------------------------------- */
/* The Modal (background) */
.searchModal3 {
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
.search-modal-content3 {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 70%; /* Could be more or less, depending on screen size */
}
</style>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<section id="menu" class="section">
	<div class="section_container">

		<br>

		<h2>회원 정보</h2>
		<br> 이름:${login.name } <br> 이메일:${login.email } <br>
		<hr>
		<br>

		<div align="center">
			<table style="height: 60px;">
				<colgroup>
					<col width="400px">
					<col width="400px">
					<col width="400px">
				</colgroup>
				<tr>
					<td align="center" id="updPro"><i
						class="far fa-user-circle fa-3x"></i></td>
					<td align="center"
						style="border-left: 1px solid black; border-right: 1px solid black;"
						id="couponChk"><i class="fas fa-stamp fa-3x"></i></td>
					<td align="center" id="gradeMem"><input id="gradeChk"
						type="hidden" value="${login.visitcount }"><i
						class="fas fa-crown fa-3x"></i></td>
				</tr>
			</table>
		</div>

		<br>
		<hr>
		<br>

		<div>
			<ul id="choList">
				<li><button class="category_btn selected" onclick="choclick(1)"
						id="gong">공지사항</button></li>
				<li><button class="category_btn" onclick="choclick(2)"
						id="qnan">QnA</button></li>
				<li><button class="category_btn" onclick="choclick(3)"
						id="reps">후기</button></li>
				<li><button class="category_btn" onclick="choclick(4)"
						id="vote">투표</button></li>
			</ul>
		</div>
		<br> <br>


		<div class="mypt">
			<div id="lis1">
				<!-- 공지사항 -->
				<table>
					<tr>
						<th>번호</th>
						<th>타이틀</th>
						<th>작성일</th>
					</tr>
					<c:forEach var="inf" items="${ilist }" varStatus="vs" end="9">
						<tr>
							<td>${vs.count }</td>
							<td>${inf.title }</td>
							<td>${inf.wdate }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- seq=21, id=aaa, ref=9, step=0, depth=0, title=gggg, content=asdf, wdate=2020-10-15 12:06:14.0, del=0, readcount=1, filename=1602731174792.png, oldfilename=file.png -->

			<div id="lis2" class="lis2">
				<!-- qna -->
				<table>
					<tr>
						<th>번호</th>
						<th>타이틀</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
					<c:forEach var="qna" items="${qlist }" varStatus="vs" end="9">
						<tr>
							<td>${vs.count }</td>
							<td>${qna.title }</td>
							<td>${qna.readcount }</td>
							<td>${qna.wdate }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- seq=102, id=d4ntsky, title=수업, content=ㅁㄴㅇㅁ, secret=0, readcount=59, wdate=2020-10-12 16:20:11.0 -->

			<div id="lis3">
				<!-- 후기 -->
				<table>
					<tr>
						<th>번호</th>
						<th>타이틀</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
					<c:forEach var="psc" items="${rlist }" varStatus="vs" end="9">
						<tr>
							<td>${vs.count }</td>
							<td>${psc.title}</td>
							<td>${psc.readcount }</td>
							<td>${psc.wdate }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- seq=13, id=오재, ref=11, step=0, depth=0, title=아, content=아, wdate=2020-10-12 16:56:39.0, del=0, readcount=0 -->


			<div id="lis4">
				<!-- 투표 -->
				<table>
					<tr>
						<th>번호</th>
						<th>타이틀</th>
						<th>투표수</th>
						<th>투표여부</th>
					</tr>
					<c:forEach var="pol" items="${plist }" varStatus="vs" end="9">
						<tr>
							<td>${vs.count }</td>
							<td>${pol.question}</td>
							<td>${pol.polltotal }</td>
							<td>${pol.vote }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- pollid=13, id=aaa, question=ggg, sdate=Thu Oct 15 00:00:00 KST 2020, edate=Fri Oct 16 00:00:00 KST 2020, regdate=Thu Oct 15 12:06:41 KST 2020, itemcount=2, polltotal=2, vote=false, filename=1602731201187.PNG, oldfilename=ofin1.PNG -->
		</div>


		<div id="modal1" class="searchModal1">
			<div class="search-modal-content1">
				<div align="right" id="exitMo">끄기</div>
				<div class="page-header">
					<h1>회원정보 수정/삭제</h1>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-12" align="center">
								<form id="frm">
									<table>
										<tr>
										       
											<th>ID</th>
											<td><input name="id" value="${login.id }"
												readonly="readonly"></td>
											
										</tr>
										<tr>
											<th>PASSWORD 1</th>
											<td><input id="chkPwd1"  required="required"></td>
										</tr>
										<tr>
											<th>PASSWORD 2</th>
											<td><input name="pwd" id="chkPwd2" required="required">
											</td>
										</tr>
										<tr>
											<th colspan="2">
												<div class="alert alert-success" id="alert-success">비밀번호가
													일치합니다.</div>
												<div class="alert alert-danger" id="alert-danger">비밀번호가
													일치하지 않습니다.</div>
											</th>
										</tr>
										<tr>
											<th>NAME</th>
											<td><input name="name" value="${login.name }"
												required="required"></td>
										</tr>
										<tr>
											<th>EMAIL</th>
											<td><input name="email" value="${login.email }"
												required="required"></td>
										</tr>
										<tr>
											<td colspan="2" align="center">
												<button type="button" id="updMem" disabled="disabled">수정</button>
												<button type="button" id="delMem" disabled="disabled">탈퇴</button>
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



		<!--  -->
		<div id="modal2" class="searchModal2">
			<div class="search-modal-content2">
				<div class="page-header">
					<h1>Coupon</h1>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-12">
								<!--  -->
								<div align="center">
									<br> <br>
									<table>
										<tr>
											<td>
											엽
											</td>
										
										<td>
									<c:choose>

										<c:when test="${login.visitcount%10<5}">
											<!-- 5미만인 경우 -->
											<table class="couponTable">

												<col width="40">
												<col width="40">
												<col width="40">
												<col width="40">
												<col width="40">
												<tr>

													<c:forEach begin="1" end="${login.visitcount%10}" step="1">
														<td><i class="fas fa-coffee fa-3x"
															style="color: #774936"></i></td>
													</c:forEach>
													<c:forEach begin="1" end="${10-(login.visitcount%10)}"
														step="1" varStatus="status">
														<td><span class="far fa-circle fa-3x"></span></td>
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
											<table class="couponTable">
												<tr>
													<c:forEach begin="1" end="${login.visitcount%10}" step="1"
														varStatus="status">
														<td><i class="fas fa-coffee fa-3x"
															style="color: #774936"></i></td>
														<c:if test="${status.index eq 5}">
												</tr>
												<tr>
													</c:if>
													</c:forEach>


													<c:forEach begin="1" end="${10-(login.visitcount%10)}"
														step="1">
														<td><span class="far fa-circle fa-3x"></span></td>
													</c:forEach>
												</tr>
											</table>
										</c:when>

									</c:choose>
									
										</td></tr>
									</table>
									<br> <br> 10개 모일 시 자동할인
									
								</div>
								<!--  -->
								
							</div>
						</div>
					</div>

					<hr>

					<div
						style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
						onClick="closeModal2();">
						<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
						</span>
					</div>
				</div>
			</div>
		</div>

		<!--  -->
		<div id="modal3" class="searchModal3">
			<div class="search-modal-content3">
				<div class="page-header">
					<h1>Grade</h1>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-12">
								<!--  -->
								<div align="center">
									<br>
									<table border="1">
										<tr>
											<td><i class="fas fa-crown fa-3x" style="color:#cd7f32;"></i></td>
											<td><i class="fas fa-crown fa-3x" style="color:silver;"></i></td>
											<td><i class="fas fa-crown fa-3x" style="color:gold;"></i></td>
										</tr>
										
										<tr>
											<td>최초 회원 가입시</td>
											<td>주문횟수 몇회 이상시</td>
											<td>주문횟수 몇회 이상시</td>
										</tr>
									</table>
									<br>
								</div>
								<!--  -->
							</div>
						</div>
					</div>

					<hr>

					<div
						style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
						onClick="closeModal3();">
						<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
						</span>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</section>

<script>
	//수정 모달
	$("#updPro").click(function() {
		$("#modal1").show();
	});
	$("#updPro").hover(function() {
		$(this).attr("style", "color:#e27049");
	}, function() {
		$(this).attr("style", "color:black");
	});
	$('#exitMo').click(function() {
		$('.searchModal1').hide();
	});

	//쿠폰 모달
	$("#couponChk")
			.hover(
					function() {
						$(this)
								.attr("style",
										"color:#e27049; border-right:1px solid black; border-left:1px solid black;");
					},
					function() {
						$(this)
								.attr("style",
										"color:black; border-right:1px solid black; border-left:1px solid black;");
	});
	$("#couponChk").click(function() {
		$("#modal2").show();
	});
	function closeModal2() {
		$('.searchModal2').hide();
	};
	$('.searchModal2').click(function() {
		$('.searchModal2').hide();
	});

	//등급 모달
	//멤버 등급 설명?
	$("#gradeMem").click(function() {
		$("#modal3").show();
	});
	function closeModal3() {
		$('.searchModal3').hide();
	};
	$('.searchModal3').click(function() {
		$('.searchModal3').hide();
	});
	
	var memVisCut = $("#gradeChk").val()
	if (memVisCut <= 50) {
		$("#gradeMem").hover(function() {
			$(this).attr("style", "color:#cd7f32");
		}, function() {
			$(this).attr("style", "color:black");
		});
	}
	if (memVisCut > 50) {
		$("#gradeMem").hover(function() {
			$(this).attr("style", "color:silver");
		}, function() {
			$(this).attr("style", "color:black");
		});
	}
	if (memVisCut > 100) {
		$("#gradeMem").hover(function() {
			$(this).attr("style", "color:gold");
		}, function() {
			$(this).attr("style", "color:black");
		});
	}

	//비밀번호 확인이 존재는 해야함
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#chkPwd1").val();
			var pwd2 = $("#chkPwd2").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#updMem").removeAttr("disabled");
					$("#delMem").removeAttr("disabled");
					$("#updMem").click(function() {
						//alert("수정");
						$("#frm").attr("action", "updateId.do").submit();
					});
					$("#delMem").click(function() {
						alert("삭제");
						$("#frm").attr("action", "deleteId.do").submit();
					});
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});

	//기본 설정
	$("#lis2").hide();
	$("#lis3").hide();
	$("#lis4").hide();
	function choclick(val) {
		if (val == 1) {
			$("#lis1").show();
			$("#lis2").hide();
			$("#lis3").hide();
			$("#lis4").hide();
			$("#gong").attr("class", "category_btn selected");
			$("#qnan").attr("class", "category_btn");
			$("#reps").attr("class", "category_btn");
			$("#vote").attr("class", "category_btn");
		} else if (val == 2) {
			$("#lis1").hide();
			$("#lis2").show();
			$("#lis3").hide();
			$("#lis4").hide();
			$("#gong").attr("class", "category_btn");
			$("#qnan").attr("class", "category_btn selected");
			$("#reps").attr("class", "category_btn");
			$("#vote").attr("class", "category_btn");
		} else if (val == 3) {
			$("#lis1").hide();
			$("#lis2").hide();
			$("#lis3").show();
			$("#lis4").hide();
			$("#gong").attr("class", "category_btn");
			$("#qnan").attr("class", "category_btn");
			$("#reps").attr("class", "category_btn selected");
			$("#vote").attr("class", "category_btn");
		} else if (val == 4) {
			$("#lis1").hide();
			$("#lis2").hide();
			$("#lis3").hide();
			$("#lis4").show();
			$("#gong").attr("class", "category_btn");
			$("#qnan").attr("class", "category_btn");
			$("#reps").attr("class", "category_btn");
			$("#vote").attr("class", "category_btn selected");
		}
	}
</script>





