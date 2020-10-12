<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section id="menu" class="section">
        <div class="section_container">
            
<h1>Side Delete (Admin)</h1>
<table border="1">

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
		<input type="radio" value="${side.seq }" name="dc" class="delSide">${side.name }
		</td>
		
		<td>
		${side.price }
		</td>

		</tr>
	</c:forEach>
	
	
</tbody>
</table>

<input type="button" id="delBtn" value="delete">
  
</div>
</section>

<script type="text/javascript">
$("#delBtn").click(function(){
	var seq = $("input[name=dc]:checked").val();
	location.href="sideDelete.do?seq="+seq;
});
</script>

