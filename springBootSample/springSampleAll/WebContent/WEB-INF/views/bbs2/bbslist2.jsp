<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 검색 -->
<div class="box_border" style="margin-top: 5px; margin-bottom: 10px">
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
</div>


<table class="list_table" style="width: 85%" id="_list_table">
<colgroup>
	<col style="width:70px">
	<col style="width:auto">
	<col style="width:100px">
</colgroup>

<tr>
	<th>번호</th><th>제목</th><th>작성자</th>
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

<script>

getBbsListData(0);
getBbsListCount();

// 검색
$("#btnSearch").click(function(){
	getBbsListData(0);
	getBbsListCount();
});


// bbslist를 갖고 온다
function getBbsListData( pNumber ){

	$.ajax({
		url:"./bbslistData.do",
		type:"get",
		data:{ "pageNumber":pNumber, "recordCountPerPage":10, 
			"choice":$("#_choice").val(), "searchWord":$("#_searchWord").val() },
		success:function( list ){
		//	alert("success");
		//	alert(list);		
			$(".list_col").remove();

			$.each(list, function(i, val){
				let app = "<tr class='list_col'>"
							+ "<td>" + (i + 1) + "</td>"
							+ "<td style='text-align:left'>"
							+ 	getArrow( val.depth )
							+  	"<a href='bbsdetail.do?seq=" + val.seq + "'>" + val.title + "</a>"
							+ "</td>"
							+ "<td>" + val.id + "</td>"
						  "</tr>";

				$("#_list_table").append(app);  				
			});			
		},
		error:function(){
			alert("error");
		}	
	});

	
}

// 글의 총수를 취득
function getBbsListCount(){
	$.ajax({
		url:"./bbslistCount.do",
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
			getBbsListData( nowPage - 1 );	
		}	
	});
}


// 댓글 이미지 처리
function getArrow( depth ) {		
	let rs = "<img src='./image/arrow.png' width='20px' height='20px'/>";
	let nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	
	let ts = "";
	for(i = 0;i < depth; i++) {
		ts += nbsp;
	}
	
	return depth==0?"":ts + rs;
}
</script>













