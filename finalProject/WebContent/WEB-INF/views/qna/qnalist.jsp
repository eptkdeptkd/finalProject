<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	System.out.println("세션값 확인용 " + session.getAttribute("login"));
%>

<style>
select{
    font-family: 'Poor Story', cursive;
    font-size: 18px;
    margin: 10px 10px 10px 10px;
}
.pagination .page-link{
	 color: black; 
	 font-family: 'Poor Story', cursive;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #feb546;
    border-color: white;
}

.list_table{
  font-family: 'Poor Story', cursive;
}
.list_table th{
	background-color: #e76f51;
}
.list_table tr{
	border-bottom: 1px solid #bdbdbd;
}
</style>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/dw/qna.css">

  <section class="section">
  <div class="section_container">
  
  	<br>
	<h2 class="cart_h2">QnA 게시판</h2>
	<br>
	<hr>
	<br>
	

<form action="" name="frmForm1" id="_frmFormSearch" method="get">
<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
<tr>
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
		<div class="searBtn">
			<button type="button" id="btnSearch">검색</button>
		</div>
	</td>
</tr>
</table>
</form>

<div align="center">
<table class="list_table" id="_list_table" >
	<colgroup>
		<col width="50px">
		<col width="500px">
		<col width="150px">
		<col width="100px">
	</colgroup>

	<tr>
		<th style="text-align: center;">번호</th>
		<th style="text-align: center;">제목</th>
		<th style="text-align: center;">이름</th>
		<th style="text-align: center;">조회수</th>
	</tr>
</table>
</div>
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
<button type="button" class="searBtn" onclick="location.href='qnawrite.do'">글쓰기</button>
</c:if>

</div>
</section>

<!-- java 등분과 나눈 값의 위치 0.1과 1 사이에서 값이 들어오고 위치값내보내고 -->


<script>

var sessId = "${login.id}";
var sessAuth = "${login.auth}";
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
			var num = pNumber;
			$.each(list, function(i, val){

				//console.log(val);//id/title/content/secret/seq/wdate
				if(sessAuth==1) {			//관리자의 경우
					//다보여지게
					if(val.secret == 0) {							//잠겨있지 않은 경우
						var str="<a href='qnadetail.do?seq=" + val.seq + "' id='replyCount" + val.seq + "'>" + val.title + "</a>";
					}else{											//잠긴 경우
						var str="<a href='qnadetail.do?seq=" + val.seq + "' id='replyCount" + val.seq + "'>" + val.title + "</a>&nbsp;&nbsp;<i class='fas fa-lock'></i>";
					}	
				}else if(sessAuth != 1) {	//관리자가 아닌 경우
					if(sessId==val.id){					//본인이 로그인한 경우
						if(val.secret == 0) {							//잠겨있지 않은 경우
							var str="<a href='qnadetail.do?seq=" + val.seq + "' id='replyCount" + val.seq + "'>" + val.title + "</a>";
						}else{											//잠긴 경우
							var str="<a href='qnadetail.do?seq=" + val.seq + "' id='replyCount" + val.seq + "'>" + val.title + "</a>&nbsp;&nbsp;<i class='fas fa-lock'></i>";
						}	
					}else if(sessId != val.id) {			//본인이 아닌 사람인 경우
						if(val.secret == 0) {							//잠겨있지 않은 경우
							var str="<a href='qnadetail.do?seq=" + val.seq + "' id='replyCount" + val.seq + "'>" + val.title + "</a>";
						}else{											//잠긴 경우
							var str="<a id='replyCount" + val.seq + "'>" + val.title + "</a>&nbsp;&nbsp;<i class='fas fa-lock'></i>";
						}
					}
				}
				
				let app = "<tr class='list_col'>"
							+ "<td align='center'>" + (i + 1 + num*10) + "<input type='hidden' class='cReply' value='"+ val.seq + "'></td>"
							+ "<td style='text-align:left'>"
							+ str
							+ "<input type='hidden' value='" + val.id + "' class='secEnt' onclick='location.href=\"qnadetail.do?seq=" + val.seq + "\"'>"
							+ "<input type='hidden' class='secNum' value='" + val.secret + "'>"
							+ "</td>"
							+ "<td align='center'>" + val.id + "</td>"
							+ "<td align='center'>" + val.readcount + "</td>"
						  +"</tr>";

				
				$("#_list_table").append(app);  				
			});			

			/*
			잠금 풀기용 버튼 숨겨서 value값있을때 세션 값으로 아디확인하고 id가 갔을 때 보이게
			<input type='button' value='' id='val.id' onclick'location.href=/"/qnadetail.do?seq=" + val.seq /"/'>
			
			
			*/
			
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
						//console.log(data);
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

