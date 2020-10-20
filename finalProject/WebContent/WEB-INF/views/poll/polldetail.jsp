<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<section id="menu" class="section" style="padding-top: 300px; padding-bottom: 120px;">
<div class="section_container" >

	<div align="center" >
		<img src="image/logo.png" alt="" style="width: 100px; height: 100px;">
		<p style="font-family: 'Stylish', sans-serif; padding-bottom: 50px; font-size: 32px;">투표하기</p>
	</div>
	<hr><br>
			
		<form id="_frmForm" action="polling.do" method="post">
		
			<c:if test="${poll.filename ne null}">
				<img src="http://localhost:192.168.0.195/finalProject/upload/${poll.filename }" style="width: 300px; height: 250px;">	
			</c:if>
			
			
			<div style="margin-top: 50px;">
				<table border="1" style="width: 85%; border-color: #c6c6c6; border: 1px solid #c6c6c6;">
				<colgroup>
					<col width="150px"><col width="500px">
				</colgroup>
				
				<tr>
					<th style="background-color: #feb546; padding: 10px 30px;">투표 번호</th>
					<td style="text-align: left;"><input type="text" name="pollid" value="${poll.pollid}" 
						style="min-height: 100%;min-width:100%; border: none;outline: none;" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th style="background-color: #feb546; padding: 10px 30px;">아이디</th>
					<td style="text-align: left;">
						<input type="text" name="id" value="${login.id }" readonly="readonly" 
								style="min-height: 100%;min-width:100%; border: none;outline: none;">
					</td>
				</tr>
				<tr>
					<th style="background-color: #feb546; padding: 10px 30px;">투표 기한</th>
					<td style="text-align: left;"> ${poll.sdate} ~ ${poll.edate}
					</td>
				</tr>
				<tr>
					<th style="background-color: #feb546; padding: 10px 30px;">투표 내용</th>
					<td style="text-align: left;">
						<textarea rows="1" cols="10" name="question" style="min-height: 150px;min-width:100%; border: none;outline: none;">${poll.question}</textarea>
					</td>
				</tr>
				</table>
			</div>
			
			<div style="margin-bottom: 50px; margin-top: 20px;">	
				<c:forEach items="${pollsublist }" var="psub" varStatus="vs">
				
				<%-- ${vs.count}. --%>
				
				<input type="radio" name="pollsubid" ${vs.count==1?"checked='checked'":""} 
								value="${psub.pollsubid }">
				
				<input type="text" name="answer" style=" border: 1px solid #fff;padding-left: 10px;outline: none;font-family: 'Stylish', sans-serif;font-size: 22px;"
								value="${psub.answer }" readonly="readonly">
				</c:forEach>
				<br>
			</div>		
		
			<input type="button" onclick="Confirm()" value="투표하기" class="order_btn" style="height: 40px; width: 120px;">
			<a href="polllist.do" title="돌아가기" class="category_btn" style="border: 1px solid orange; color: #000; text-decoration: none;">돌아가기</a>	
		
		</form>    


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







