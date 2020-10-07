<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<table>
	<thead>
		 <th>선택</th>
		 <th>주문내용</th>
	</thead>
<c:if test="${empty list }">
	<tr>
		<td colspan="4" style="text-align:center;">주문 내역이 없습니다</td>
	</tr>
</c:if>
<c:if test="${not empty list }">
	<c:forEach items="${list }" var="dto" varStatus="vs" >
		<tr>
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

<div class="container">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination" style="justify-content: center;"></ul>
	</nav>
</div>

<br><br>
<input type="button" id="finbtn" value="처리">


<script type="text/javascript">
$("#finbtn").click(function(){
	var id = $(".fin").val();
	var seq = $(".fin").attr("seq");
	alert(id+", " +seq);
});



</script>
