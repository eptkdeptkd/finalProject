<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div align="center">
<form name="frmForm" id="_frmForm" method="post" action="infoupdate.do">

<input type="hidden" name="seq" value="${info.seq}"/>

<!-- <script type="text/javascript">
alert(${info.filename} )
</script> -->

작성자 : ${info.id} 
작성일 : ${info.wdate}
<hr>
제목 : ${info.title}
<hr>

<c:if test="${info.oldfilename ne null}">
	<img src="http://localhost:8090/finalProject/upload/${info.filename }">	
</c:if>
<c:if test="${info.oldfilename eq null}">
	<img src="image/infodetail.png" alt="" style="width: 300px; height: 150px;">	
</c:if>

<%-- <table>

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
			<td style="text-align: left">${info.title}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td style="text-align: left">${info.wdate}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="text-align: left"><textarea rows="10" cols="50" 
			name='content' id="_content">
			
			${info.content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2" style="height:50px; text-align:center;">
			<span>
				<c:if test="${info.id eq login.id}">
				<i class="far fa-edit" id="_btnUpdate">수정</i>
				<i class="fas fa-trash-alt" id="_btnDel">삭제</i>
				</c:if>
				<i class="fas fa-reply" id="_btnReply">답글</i>
			</span>
			</td>
		</tr>
	</tbody>
</table> --%>


<!-- <hr> -->
<br><br>
<!-- <hr> -->
${info.content}
<hr>
	<span>
		<c:if test="${info.id eq login.id}">
		<i class="far fa-edit" id="_btnUpdate">수정</i>
		<i class="fas fa-trash-alt" id="_btnDel">삭제</i>
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


<div align="center">

<form name="ReForm" id="ReForm" method="post" action="">
<input type="hidden" id="seq" name="seq" value="${info.seq}">
<textarea style="width: 80%; background-color: #f2f2f2; border-color: #f2f2f2;" name="content" id="content"></textarea>
<i class="fas fa-reply" onclick="Confirm()" id="btnRe">작성 완료</i>
<input type="hidden" name="info_Seq" value="${info.seq}"/>
<input type="hidden" name="id" value="${login.id}"/>

<br>

	<table style="width: 100%; text-align: center; border-collapse: collapse; background-color: #f2f2f2;">
 		<colgroup>
			<col style="width:20%">
			<col style="width:60%">
			<col style="width:20%">
		</colgroup> 

		<thead>
			<tr>
				<th>아이디</th><th>내용</th><th>작성일</th>
			</tr>
		</thead>
<hr>
		<tbody>
			<c:if test="${empty infoReList }">
			<tr>
				<td colspan="3" style="text-align: center;">작성된 댓글이 없습니다</td>		
			</tr>	
			</c:if>
		
		
			<c:forEach items="${infoReList }" var="infoRe" varStatus="Revs">
			
				<!-- arrow를 setting -->
				<%-- <jsp:setProperty property="depth" name="ubbs" value="${bbs.depth }"/> --%>
				
				<tr>
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
	<hr>
</form>
</div>


<a href="infoimage.do" title="공지사항 게시판으로 돌아가기">이미지게시판으로 가기</a>	
<br>
<a href="infolist.do" title="공지사항 게시판으로 돌아가기">메인 게시판으로 가기</a>	

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

	function Alert() {
		alert('gg', 'success');
	}
	function Confirm() {
		confirm('', '댓글을 작성 하시겠습니까?');
	}
</script>

