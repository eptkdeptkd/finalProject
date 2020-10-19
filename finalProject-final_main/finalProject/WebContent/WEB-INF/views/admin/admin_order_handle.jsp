<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<section id="menu" class="section">
    <div class="section_container">
    <h3 class="oh_h3">커피 주문 내역</h3>
    <div class="order_menu">
		<table class="order_table">
		<colgroup>
			<col style="width:100">
			<col style="width:700">
		</colgroup>
		
		<thead>
			<tr class="tbTh">
			 <th>선택</th>
			 <th>주문내용</th>
			</tr>
		</thead>
		<c:if test="${empty list }">
			<tr class="tbTr">
				<td colspan="2" style="text-align:center;">주문 내역이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="dto" varStatus="vs" >
				<tr class="tbTr">
					<td>
						<input type="radio" name="rfin" class="fin" value="${dto.id}" seq="${dto.seq }">
					</td>
					<td>
						${dto.content }
					</td>
				</tr>
			</c:forEach>
		</c:if>
		</table>
		</div>
		
		<div class="container">
			<nav aria-label="Page navigation">
				<ul class="pagination" id="pagination" style="justify-content: center;"></ul>
			</nav>
		</div>
	
	<br><br>
	<input type="button" id="finbtn" value="처리">

</div>
</section>

<script type="text/javascript">

$("#finbtn").click(function(){
	var id = $("input[name=rfin]:checked").val();
	var seq = $("input[name=rfin]:checked").attr("seq");
	
	$.ajax({
		url:"orderFin.do",
		data:{"seq":seq},
		type:"post",
		success:function(b){
			if(!b){
				swal('', '정상적으로 주문 처리 되지 않았습니다', "success");
				return;
			}else{
				swal('', '정상적으로 주문 처리 되었습니다', "success");
				if(wsocket){
					wsocket.send("${login.id},"+id+",완료");
				}
			}
		},
		error:function(){
			alert("error");
		}
	});		
	
});

$(document).ready(function(){
	loadPage(${totPage});
});

function loadPage(totalCount){
	var pageSize = ${param1.readPerPage};
	var nowPage = ${param1.pageNumber};

	var totPage = totalCount / pageSize;
	
	if(totalCount%pageSize>0 ) totPage++;
	
	$("#pagination").twbsPagination('destroy');

	$("#pagination").twbsPagination({
		totalPages:totPage,
		visiblePages:5,
		first:'<span aria-hidden="true"><<</span>',
		prev:'prev',
		next:'next',
		last:'<sapn aria-hidden="true">>></span>',
		initiateStartPageClick:false,
		onPageClick:function(event,page){
			nowPage = page;
			
			getBbsListData(nowPage-1);
		}
	});
}

function getBbsListData(pNumber){

	$.ajax({
		url:"getBbsList.do",
		data:{ "pageNumber":pNumber, "recordCountPerPage":5},
		type:"get",
		success:function(list){
			
			$(".tbTr").remove();

			var strTb = "";
			if(list.length>0){
				for(var i=0; i<list.length; i++){
					strTb += "<tr class='tbTr'>";
					strTb += "<td><input type='radio' name='rfin' class='fin' value='"+list[i].id+"' seq='"+list[i].seq+"'>";
					strTb += "</td>";
					strTb += "<td>"+list[i].content+"</td></tr>";
				}
			}else{
				strTb += "<tr class='tbTr'><td colspan='2'>작성된 주문 내역이 없습니다</td></tr>";
			}
			$(".tb").append(strTb);
		},
		error:function(){
			alert("error");
		}
	});	

	
}












</script>
