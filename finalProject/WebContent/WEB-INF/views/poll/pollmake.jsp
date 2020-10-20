<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section id="menu" class="section" style="padding-top: 300px; padding-bottom: 120px;">
<div class="section_container" >
        
<%
	Calendar cal = Calendar.getInstance();
	int tyear = cal.get(Calendar.YEAR);
	int tmonth = cal.get(Calendar.MONTH) + 1;
	int tday = cal.get(Calendar.DATE);
%>


	<div align="center" >
		<img src="image/logo.png" alt="투표 생성" style="width: 100px; height: 100px;">
		<p style="font-family: 'Stylish', sans-serif; padding-bottom: 50px; font-size: 32px;">${login.id }님의 투표 만들기</p>
	</div>

		
		<form id="_frmForm" action="pollmakeAf.do" method="post" enctype="multipart/form-data">
			
			
				<table border="1" style="width: 85%; border-color: #c6c6c6; border: 1px solid #c6c6c6;">
					<colgroup>
						<col width="110px"><col width="500px">
					</colgroup>
				
					<tr>
						<th style="background-color: #feb546; padding: 10px 30px;">아이디</th>
						<td style="text-align: left;">
							&nbsp;&nbsp; ${login.id }<input type="hidden" name="id" value="${login.id}">
						</td>
					</tr>
					
					<tr>
						<th style="background-color: #feb546;padding: 10px 30px;">투표기한 설정</th>
						<td style="text-align: left;">
							<select name="syear" style="border:none;padding-left: 10px;outline: none;">
								<%
								for(int i = tyear;i < tyear + 6; i++){
									%>	
									<option <%=(tyear+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>"><%=i %></option>
									<%
								}			
								%>		
							</select>년	
							
							<select name="smonth" style="border:none;padding-left: 10px;outline: none;">
								<%
								for(int i = 1;i <= 12; i++){
									%>	
									<option <%=(tmonth+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>"><%=i %></option>
									<%
								}			
								%>		
							</select>월
							
							<select name="sday" style="border:none;padding-left: 10px;outline: none;">
								<%
								for(int i = 1;i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
									%>	
									<option <%=(tday+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>"><%=i %></option>
									<%
								}			
								%>		
							</select>일
								         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ~      &nbsp;&nbsp;&nbsp;&nbsp;
							<select name="eyear" style="border:none;padding-left: 10px;outline: none;">
								<%
								for(int i = tyear;i < tyear + 6; i++){
									%>	
									<option <%=(tyear+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>"><%=i %></option>
									<%
								}			
								%>		
							</select>년		
							
							<select name="emonth" style="border:none;padding-left: 10px;outline: none;">
								<%
								for(int i = 1;i <= 12; i++){
									%>	
									<option <%=(tmonth+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>"><%=i %></option>
									<%
								}			
								%>		
							</select>월
							
							<select name="eday" style="border:none;padding-left: 10px;outline: none;">
								<%
								for(int i = 1;i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
									%>	
									<option <%=(tday+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>"><%=i %></option>
									<%
								}			
								%>		
							</select>일	
						</td>
					</tr>
					
					<tr>
						<th style="background-color: #feb546;padding: 20px 40px;">투표 내용</th>
						<td style="text-align: left;">
							<textarea rows="1" cols="10" name="question" id="question" style="min-height: 150px;min-width:100%; border: none;outline: none;"></textarea>
						</td>
					</tr>
					
					<tr>
						<th style="background-color: #feb546;padding: 0 40px;">이미지 추가</th>
						<td style="text-align: left;">
							<input type="file" name="fileload" size="20" class="order_btn" style="width: 100%">
						</td>
					</tr>
					
					<tr>
						<th style="background-color: #feb546;padding: 10 40px;">투표 문항수</th>
						<td style="text-align: left;">
							<select name="itemcount" id="itemcount" onchange="pollchange(this)" style="border: none;padding-left: 10px;outline: none; width: 100%; height: 100%">
								<%
								for(int i = 2;i <= 10; i++){
									%>
									<option <%=(4+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>" ><%=i %> 개</option>
									<%
								}
								%>
							</select>
						</td>	
					</tr>
					
					<tr>
						<th style="background-color: #feb546;padding: 20px 40px;">투표 상세 문항</th>
						<td style="text-align: left;">
							<% 
							for(int i = 1;i <= 10; i++){
								%>	
								<div id='poll<%=i %>'>
									<%=(i+"") %>:&nbsp;<input type="text" name="poll<%=i %>" id="po<%=i %>" size="10" style="width:95%; border: 1px solid #c6c6c6;padding-left: 10px;outline: none;">
								</div>
								<%
							}		
							%>	
						</td>
					</tr>
				
				</table>
				<br>
				<input type="button" onclick="Confirm()" value="투표만들기" class="order_btn" style="height: 50px; width: 150px;">
		</form>

</div>
</section>







<script>
$(document).ready(function(){
	// 보기 항목의 초기화
	for(i = 5;i <= 10; i++){
		$("#poll" + i).hide();
	}
	
});
function pollchange( sel ){
	let val = sel.options[sel.selectedIndex].value;
	//alert(val);
	// 초기화
	for(i = 1;i <= 10; i++){
		$("#poll" + i).val("");
		$("#poll" + i).hide();
	}
	for(i = 1;i <= val; i++){
		$("#poll" + i).show();
	}	
}
</script>




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
		var question = $("#question").val();
		var count = $("#itemcount option:selected").val();
		//swal("",count,"warning");
		var answer = new Array(count);
		var bo = true;
		for(i = 1; i <= count; i++){
			answer[i] = $("#po" + i).val();
			if(answer[i] == null || answer[i] == ""){
				bo = false; break;
			}
		}
		
		if(question.trim()=="" || question==null){
			swal("","투표 주제를 입력해주세요","warning");
			$("#question").focus();
		
		}else if(!bo){
			swal("","투표 항목을 입력해주세요","warning");
			$("#answer").focus(); 
		}
/* 		}else{
			for(i = 1; i <= count; i++){
				
				if(answer[i].trim()=="" || answer[i]==null){
					swal("","투표 항목을 입력해주세요","warning");
					$("#answer").focus();
				}
			}
		} */
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
						$("#_frmForm").attr({ "target":"_self", "action":"pollmakeAf.do" }).submit();
					}else{
						 location.href="polllist.do";
					}
		
				});
		}
	}
	function Alert() {
		alert('gg', 'success');
	}
	function Confirm() {
		//alert(count);
		confirm('', '투표를 만드시겠습니까?');
	}
</script>
