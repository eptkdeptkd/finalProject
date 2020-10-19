<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<section id="menu" class="section" style="padding-top: 300px; padding-bottom: 120px;">
<div class="section_container" >

	<div align="center" >
		<img src="image/logo.png" alt="투표 생성" style="width: 100px; height: 100px;">
		<p style="font-family: 'Stylish', sans-serif; padding-bottom: 50px; font-size: 32px;">${login.id }님의 공지사항 작성</p>
	</div>
		

		<form name="frmForm" id="_frmForm" method="post" action="infowriteAf.do" enctype="multipart/form-data">
		
			<table border="1" style="width: 85%; border-color: #c6c6c6; border: 1px solid #c6c6c6;">
				<colgroup>
					<col style="width:200px;" /><col style="width:auto;" />
				</colgroup>
				
				<tr>
					<th style="background-color: #feb546; padding: 10px 30px;">아이디</th>
					<td style="text-align: left; " >
						<input type="text" name="id" readonly="readonly" value='${login.id}'
							 style="min-height: 100%;min-width:100%; border: none;outline: none;"/>
						<!-- <input type="text" name="id" size="60" value="aaa" /> -->
					</td>
				</tr>
				<tr>
					<th style="background-color: #feb546; padding: 10px 30px;">제목</th>
						<td style="text-align: left">
							<input type="text" name="title" id="title" 
									style="min-height: 100%;min-width:100%; border: none;outline: none;"/>
						</td>
				</tr>
				<tr>
					<th style="background-color: #feb546; padding: 10px 30px;">내용</th>
					<td style="text-align: left">
						<textarea rows="10" cols="50" name="content" id="_content"
							style="min-height: 150px;min-width:100%; border: none;outline: none;"></textarea>
					</td>
				</tr>
				<tr>
					<th style="background-color: #feb546;padding: 0 40px;">이미지 추가</th>
					<td style="text-align: left;">
						<input type="file" name="fileload" size="20" class="order_btn" style="width: 100%">
					</td>
				</tr>				
			</table>			
		
<!-- 			<span>					
				<i class="fas fa-pencil-alt" id="btnWriteAf" onclick="Confirm()" style="color:orange;">글작성</i>
			</span> -->
			<br>
			
			<a id="btnWriteAf" onclick="Confirm()" class="category_btn" 
					style="border: 1px solid #aeaeae; color: #000; text-decoration: none;margin-right: 30px;">글작성</a>	
			
			<a href="infoimage.do" title="공지사항 게시판으로 돌아가기" class="category_btn" 
					style="border: 1px solid #aeaeae; color: #000; text-decoration: none;">게시판으로 돌아가기</a>	
			<br>
		
		</form>
		
		<!-- <script type="text/javascript">
		$("#btnWriteAf").click(function() {	
			//alert('글작성');	
			$("#_frmForm").attr({ "target":"_self", "action":"infowriteAf.do" }).submit();	
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

		var title1 = $("#title").val();
		var content = $("#_content").val();
		
		if(title1.trim()==""||title1.trim()==null){
			swal("","공자시항의 제목을 입력해주세요","warning");
			$("#title").focus();
		}else if(content.trim()==""||content.trim()==null){
			swal("","공지사항 내용을 입려해주세요","warning");
			$("#_content").focus();
		}else{
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
				var content = $("#_content").val();
				content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
				$("#_content").val(content);
				
				if (isConfirm) {
					swal('', '글이 작성되었습니다', "success");
					
					$("#_frmForm").attr({ "target":"_self", "action":"infowriteAf.do" }).submit();
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
		confirm('', '글을 작성하시겠습니까?');
	}
</script>


