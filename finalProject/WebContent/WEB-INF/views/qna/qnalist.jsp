<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	System.out.println("세션값 확인용 " + session.getAttribute("login"));
%>



<div id="test" style="background-color: yellow;">
	<h2>QnA 게시판</h2>

<form action="" name="frmForm1" id="_frmFormSearch" method="get">
<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
<tr>
	<td>검색</td>
	<td style="padding-left: 5px">
		<select id="_choice" name="choice">
			<option value="" selected="selected">선택</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>		
		</select>
	</td>
	<td style="padding-left: 5px">
		<input type="text" id="_searchWord" name="searchWord">		
	</td>
	<td style="padding-left: 5px">
		<span class="button blue">
			<button type="button" id="btnSearch">검색</button>
		</span>
	</td>
</tr>
</table>
</form>

<table class="list_table" style="width: 85%" id="_list_table" border="1">
	<colgroup>
		<col width="50px">
		<col width="150px">
		<col width="500px">
		<col width="100px">
		<col width="100px">
	</colgroup>

	<tr>
		<th style="text-align: center;">번호</th>
		<th style="text-align: center;">이름</th>
		<th style="text-align: center;">제목</th>
		<th style="text-align: center;">조회수</th>
		<th style="text-align: center;">잠금</th>
	</tr>
</table>

<br><br>

<!-- paging -->
<div class="container">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination" style="justify-content: center;"></ul>
	</nav>
</div>

<br><br>

<c:if test="${empty login }">
</c:if>

<c:if test="${!empty login }">
<a href="qnawrite.do">글쓰기</a>
</c:if>

</div>




<script>
//초기화
getQnaData(0);
getQnaCount();

$("#btnSearch").click(function(){
	getQnaData(0);
	getQnaCount();
});

// qnalist를 갖고 온다
function getQnaData( pNumber ){

	$.ajax({
		url:"./qnaData.do",
		type:"get",
		data:{ "pageNumber":pNumber, "recordCountPerPage":10, 
			"choice":$("#_choice").val(), "searchWord":$("#_searchWord").val() },
		success:function( list ){
		//	alert("success");
			//console.log(list);		
			$(".list_col").remove();
			
			$.each(list, function(i, val){
				
				if(val.secret==0){	//보여주는 경우
					bb="보여줘";
				}else{
					bb="보여주지마";
				}
				
				let app = "<tr class='list_col'>"
							+ "<td>" + (i + 1) + "<input type='hidden' class='cReply' value='"+ val.seq + "'></td>"
							+ "<td>" + val.id + "</td>"
							+ "<td style='text-align:left'>"
							+ "<a href='qnadetail.do?seq=" + val.seq + "' id='replyCount" + val.seq + "'>" + val.title 
							+ "</a>"
							+ "</td>"
							+ "<td>" + val.readcount + "</td>"
							+ "<td>" + bb + "</td>"
						  +"</tr>";

				
				$("#_list_table").append(app);  				
			});			


			//페이징 후 댓글 갯수 불러와서 넣어주는
			//console.log($(".cReply").val());
			$(".cReply").each(function(idx, item){
				//console.log(item.value);
				const seq = item.value;
				
				$.ajax({
					url : './countReply.do',
					type : 'post',
					async: false,
					data : {
						seq : seq
					},
					success : function(data) {
						console.log(data);
						$('table tr').find('#replyCount'+seq).append("   [" + data + "]");
					},
					error : function() {	
						//alert("error");
					}
				});
				
			});
			
		},
		error:function(){
			alert("error");
		}	
	});

	
}

// 글의 총수를 취득
function getQnaCount(){
	$.ajax({
		url:"./qnaCount.do",
		type:"get",
		data:{ "pageNumber":0, "recordCountPerPage":10, 
				"choice":$("#_choice").val(), "searchWord":$("#_searchWord").val() },
		success:function( count ){
		//	alert("success");
		//	alert(count);	
			loadPage(count);		
		},
		error:function(){
			alert("error");
		}		
	});	
}

// paging 처리
function loadPage( totalCount ){

	let pageSize = 10;
	let nowPage = 1;

	let totalPages = totalCount / pageSize;
	if(totalCount % pageSize > 0){
		totalPages++;
	}

	$("#pagination").twbsPagination('destroy');	// 페이지 갱신
	
	$("#pagination").twbsPagination({
	//	startPage: 1,
		totalPages: totalPages,		// 전체 페이지 수
		visiblePages: 10,
		first:'<span aria-hidden="true">«</span>',
		prev:"이전",
		next:"다음",
		last:'<span aria-hidden="true">»</span>',
		initiateStartPageClick:false,		// onPageClick 자동 실행하지 않는다
		onPageClick: function(event, page){
			nowPage = page;
		//	alert('nowPage:' + nowPage);
			getQnaData( nowPage - 1 );				
		}		
	});
}
</script>

