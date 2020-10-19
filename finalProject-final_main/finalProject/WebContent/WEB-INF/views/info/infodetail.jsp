<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<section id="menu" class="section" style="padding-top: 300px; padding-bottom: 120px;">
    <div class="section_container">

		<div align="center" >
			<img src="image/logo.png" alt="" style="width: 100px; height: 100px;">
			<p style="font-family: 'Stylish', sans-serif; padding-bottom: 50px; font-size: 32px;">공지사항 상세보기</p>
		</div>
			
			<div align="center">
			<form name="frmForm" id="_frmForm" method="post" action="infoupdate.do">
			
			<input type="hidden" name="seq" value="${info.seq}"/>
			
			<!-- <script type="text/javascript">
			alert(${info.filename} )
			</script> -->
			
			
			<i class="fas fa-eye" style="color: #8A4B08;padding-right: 300px;">조회수 &nbsp ${info.readcount}</i>
			<i class="far fa-calendar-alt" style="color: #8A4B08;">&nbsp${info.wdate}</i>
			
			<hr>
			 ${info.title}
			<hr>
			
				<c:if test="${info.oldfilename ne null}">
					<img src="http://192.168.0.195:8090/finalProject/upload/${info.filename }">	
				</c:if>
				<c:if test="${info.oldfilename eq null}">
					&nbsp;	
				</c:if>
			
			<!-- <hr> -->
			<br><br>
			<!-- <hr> -->
			
			
			<pre >${info.content}</pre>
			<hr>
				<span>
					<c:if test="${info.id eq login.id}">
			<!-- 			<a id="_btnUpdate" class="category_btn" style="border: 1px solid #aeaeae; color: #000; text-decoration: none;">수정하기</a>
						<a id="_btnDel" class="category_btn" style="border: 1px solid #aeaeae; color: #000; text-decoration: none;">삭제하기</a> -->
					
				 		<i class="far fa-edit" id="_btnUpdate" style="color: orange; margin: 10px; 20px;">수정</i>
						<i class="fas fa-trash-alt" id="_btnDel" style="color: orange; margin: 10px; 20px;">삭제</i> 
					</c:if>
					<!-- <i class="fas fa-reply" id="_btnReply">답글</i> -->
				</span>
			
			
			</form>
			</div>
		
<script type="text/javascript">
	$("#_btnUpdate").click(function() {	
		$("#_frmForm").attr({ "target":"_self", "action":"infoupdate.do" }).submit();
	});
	
	$("#_btnDel").click(function() {			
		$("#_frmForm").attr({ "target":"_self", "action":"infodelete.do" }).submit();
	});
</script>
		
		
		
		
		
		
		<!----- 댓글 시작  ----->
		
		<%-- <c:if test="${info.id eq null }">	 --%>
			<div style="padding: 50px 0px;">
				<%-- 댓글이 총 ${count}개 있습니다   --%>
				<form name="ReForm" id="ReForm" method="post" action="">
				<div style="float: left; width: 90%">
					<input type="hidden" id="seq" name="seq" value="${info.seq}">
					<textarea style="width:100%; border-color: #aeaeae;" name="content" id="content"></textarea>
					</div>
					<div>
					<input type="button" onclick="Confirm()" id="btnRe" class="category_btn" style="background-color: orange;" value="작성완료">
					</div>
				
					<input type="hidden" name="info_Seq" value="${info.seq}"/>
					<input type="hidden" name="id" value="${login.id}"/>
				</form>
			</div>
		<%-- </c:if>	 --%>
			
			
			<div style="padding-top: 70px;">
				<table style="width: 100%; text-align: center; border-collapse: collapse;">
			 		<colgroup>
						<col style="width:20%">
						<col style="width:60%">
						<col style="width:20%">
					</colgroup> 
			
					<thead style="padding:10px;color: #369;font-weight: bold;vertical-align: top; border-bottom: 3px solid #036;background: #f3f6f7;">
						<tr>
							<th>아이디</th><th>내용</th><th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty infoReList }">
						<tr>
							<td colspan="3" style="text-align: center;">작성된 댓글이 없습니다</td>		
						</tr>	
						</c:if>
					
					
						<c:forEach items="${infoReList }" var="infoRe" varStatus="Revs">
						
							<!-- arrow를 setting -->
							<%-- <jsp:setProperty property="depth" name="ubbs" value="${bbs.depth }"/> --%>
							
							<tr style="border-bottom: 1px solid #dddddd;">
	
	
								<td>${infoRe.id}</td>
								
								<c:if test="${infoRe.del eq 1}">
									<td>[삭제된 댓글 입니다.]</td>
								</c:if>
								
						 		<c:if test="${infoRe.del eq 0}">
									<td>
										<%-- <jsp:getProperty property="arrow" name="ubbs"/> --%>
										<%-- <a href="infodetail.do?seq=${info.seq }">
											${info.title}
										</a> --%>
										${infoRe.content}
									</td>
								</c:if>			
								
								<td>${infoRe.wdate}</td>
							</tr>		
							
						</c:forEach>
						
					</tbody>
					
				</table>
			</div>
			
			
			<div style="padding:80px 0px;">
			 	<a href="infoimage.do" class="category_btn" style="border: 1px solid #aeaeae; color: #000; text-decoration: none; margin-top: 100px;">게시판으로 돌아가기</a>
			</div>
			
			<!-- <a href="infoimage.do" title="공지사항 게시판으로 돌아가기">이미지게시판으로 가기</a>	
			<br>
			<a href="infolist.do" title="공지사항 게시판으로 돌아가기">메인 게시판으로 가기</a>	 -->
			
			<!-- <script type="text/javascript">
			
			$("#btnRe").click(function() {	
				//alert('답글달기');
					
					if ($("#content").val().trim() == "") {
						alert("댓글 내용을 입력해 주십시오");
						
					}else {
						$("#ReForm").attr({ "target":"_self", "action":"writeRe.do" }).submit();
					}
				
			});
			
			</script> -->
			
</div>
</section>


<script type="text/javascript">
	var alert = function(msg, type) {
		swal({
			title : '',
			text : msg,
			type : type,
			timer : 1500,
			customClass : 'sweet-size',
			showConfirmButton : false
		});
	}

	var confirm = function(msg, title, resvNum) {
		//var id = $("#id").val();
		//var id = "${login.id}";
		var id = "${login.id}";
		var content = $("#content").val();

		console.log(id);
		console.log(content);
		if(id.trim()==null||id.trim()==""){
			swal("","로그인 후 사용해주세요","warning");
		}
		else if(content.trim() == null || content.trim() == ""){
			swal("","내용을 입력해주세요","warning");
		}
		else{
			swal({
				title : title,
				text : msg,
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-danger",
				confirmButtonText : "확인",
				cancelButtonText : "취소",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					swal('', '글이 작성되었습니다', "success");
					$("#ReForm").attr({ "target":"_self", "action":"writeRe.do" }).submit();
				}else{
					 location.href="infoimage.do";
				}
	
			});
		}
	}

	function Alert() {
		alert('gg', 'success');
	}
	function Confirm() {
		confirm('', '댓글을 작성 하시겠습니까?');
	}
</script>

