<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="_frmForm" action="polling.do" method="post">

	<c:if test="${poll.filename ne null}">
		<img src="http://localhost:8090/finalProject/upload/${poll.filename }" style="width: 300px; height: 250px;">	
	</c:if>



<br>
	투표번호 : <input type="text" name="pollid" value="${poll.pollid}" size="50" readonly="readonly">
<br>
	아이디 : <input type="text" name="id" value="${login.id }" size="50" readonly="readonly">
<br>
	투표기한 : ${poll.sdate} ~ ${poll.edate}
<br>
	투표내용 : 
<br>
	<textarea rows="3" cols="40" name="question">${poll.question}</textarea>
<br>
	투표 보기수 : ${poll.itemcount }
<br>
	투표 보기들 : 
<br>		
		<c:forEach items="${pollsublist }" var="psub" varStatus="vs">
		
		${vs.count}번
		
		<input type="radio" name="pollsubid" ${vs.count==1?"checked='checked'":""} 
						value="${psub.pollsubid }">
		
		<input type="text" name="answer" size="60"
						value="${psub.answer }" readonly="readonly">
		<br>		
		</c:forEach>
		

		<input type="submit" onclick="Confirm()" value="투표하기">
<a href="polllist.do" title="돌아가기">돌아가기</a>	

</form>    

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
				swal('', '투표가 추가되었습니다', "success");
				$("#_frmForm").attr({ "target":"_self", "action":"polling.do" }).submit();
			}else{
				 location.href="polllist.do";
			}

		});
	}

	function Alert() {
		alert('gg', 'success');
	}
	function Confirm() {
		confirm('', '투표를 추가하시겠습니까?');
	}
</script>







