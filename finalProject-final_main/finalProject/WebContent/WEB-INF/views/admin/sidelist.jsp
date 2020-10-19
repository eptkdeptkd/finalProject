<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/sidelist.css">


<section id="menu" class="section">
        <div class="section_container" align="center">
            
<h1 class="del_h3">사이드 삭제</h1>
<table class="sidelist">

<colgroup>
	<col style="width:200">
	<col style="width:200">
</colgroup>

<thead>
	<tr>
		<th>시럽이름</th><th>가격</th>
		
	</tr>
</thead>

<tbody>
	<c:if test="${empty sideList}">
		<tr>
			<td colspan="2">추가 된 사이드 메뉴가 없습니다.</td>
		</tr>
	</c:if>
	  
	<c:forEach items="${sideList}" var="side" varStatus="ss">
		<tr id="_side">
		
		<td>
		<input type="radio" value="${side.seq }" name="dc" class="delSide">
		${side.name }
		</td>
		
		<td>${side.price }</td>

		</tr>
	</c:forEach>
	
	
</tbody>
</table>

<button type="button" id="delBtn" value="delete" class="del_btn">삭제</button>
  
</div>
</section>

<script type="text/javascript">
$("#delBtn").click(function(){
	var seq = $("input[name=dc]:checked").val();
	location.href="sideDelete.do?seq="+seq;
});
</script>

