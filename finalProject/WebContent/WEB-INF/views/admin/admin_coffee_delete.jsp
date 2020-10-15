<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 <!--Coffee add - 메뉴 추가 페이지-->
    <section id="menu" class="section">
        <div class="section_container">
	<h3 class="del_h3">커피 삭제</h3>
	<div class="coffee_menu">
	<table class="coffee_table">
	<colgroup>
		<col style="width:150">
		<col style="width:400">
		<col style="width:200">
	</colgroup>
	<thead>
		<tr>
			<th>선택</th>
			<th>이름</th>
			<th>가격</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
			<tr class="tbTr">
				<td colspan="3">추가 된 커피 메뉴가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
		<c:forEach items="${list}" var="dto" varStatus="ss">
			<tr class="tbTr">
				<td>
					<input type="radio" value="${dto.seq }" name="dc" class="delCoffee">
				</td>
				<td>${dto.name }</td>
				<td>${dto.price }</td>
			</tr>
		</c:forEach>
		</c:if>
	</tbody>
	</table>
	
</div>
<input type="button" id="delBtn" value="삭제" class="del_btn">

</div>
</section>
<script type="text/javascript">
$("#delBtn").click(function(){
	var seq = $("input[name=dc]:checked").val();
	location.href="delCoffee.do?seq="+seq;
});
</script>

