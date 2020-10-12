<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH) + 1;
int tday = cal.get(Calendar.DATE);
%>

<form id="_frmForm" action="pollmakeAf.do" method="post" enctype="multipart/form-data">
<input type="file" name="fileload" size="20" required="required">

<table class="list_table" style="width: 85%">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">
		${login.id }<input type="hidden" name="id" value="${login.id}">
	</td>
</tr>

<tr>
	<th>투표기한</th>
	<td style="text-align: left;">
		<select name="syear">
			<%
			for(int i = tyear;i < tyear + 6; i++){
				%>	
				<option <%=(tyear+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>"><%=i %></option>
				<%
			}			
			%>		
		</select>년	
		
		<select name="smonth">
			<%
			for(int i = 1;i <= 12; i++){
				%>	
				<option <%=(tmonth+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>"><%=i %></option>
				<%
			}			
			%>		
		</select>월
		
		<select name="sday">
			<%
			for(int i = 1;i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				%>	
				<option <%=(tday+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>"><%=i %></option>
				<%
			}			
			%>		
		</select>일
			~
		<select name="eyear">
			<%
			for(int i = tyear;i < tyear + 6; i++){
				%>	
				<option <%=(tyear+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>"><%=i %></option>
				<%
			}			
			%>		
		</select>년		
		
		<select name="emonth">
			<%
			for(int i = 1;i <= 12; i++){
				%>	
				<option <%=(tmonth+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>"><%=i %></option>
				<%
			}			
			%>		
		</select>월
		
		<select name="eday">
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
	<th>투표 내용</th>
	<td style="text-align: left;">
		<textarea rows="10" cols="50" name="question"></textarea>
	</td>
</tr>

<tr>
	<th>투표 문항수</th>
	<td style="text-align: left;">
		<select name="itemcount" onchange="pollchange(this)">
			<%
			for(int i = 2;i <= 10; i++){
				%>
				<option <%=(4+"").equals(i+"")?"selected='selected'":""%> value="<%=i %>" ><%=i %></option>
				<%
			}
			%>
		</select>
	</td>	
</tr>

<tr>
	<th>투표 상세 문항</th>
	<td style="text-align: left;">
		<% 
		for(int i = 1;i <= 10; i++){
			%>	
			<div id='poll<%=i %>'>
				<%=(i+"") %>번:<input type="text" name="poll<%=i %>" size="60">
			</div>
			<%
		}		
		%>	
	</td>
</tr>

<tr>
	<td colspan="2">
		<input onclick="Confirm()" value="투표만들기">
	</td>
</tr>
</table>
</form>

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

	function Alert() {
		alert('gg', 'success');
	}
	function Confirm() {
		confirm('', '투표를 만드시겠습니까?');
	}
</script>











    
    