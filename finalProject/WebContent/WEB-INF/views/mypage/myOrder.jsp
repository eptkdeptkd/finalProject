<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mn/my_order_list.css">

<section id="menu" class="section">
 <div class="section_container">
    <h3 class="olist_h3">나의 주문 내역</h3>
    <div class="olist_menu">
		<table class="olist_table">
			<colgroup>
				<col style="width:400">
				<col style="width:150">
				<col style="width:200">
				<col style="width:400">
				<col style="width:200">
			</colgroup>
			<thead>
				<tr>
					<th>이름</th>
					<th>샷</th>
					<th>시럽</th>
					<th>요청</th>
					<th>주문상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr class="tbTr">
						<td colspan="5" style="text-align:center;">주문한 메뉴가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach items="${list}" var="dto" varStatus="ss">
						<tr class="tbTr">
							<td>${dto.coffee_name }</td>
							<td>${dto.shot }</td>
							<td>${dto.syrup }</td>
							<td>${dto.ask }</td>
							<td>
								<c:choose>
									<c:when test="${dto.orderStatus == 1 }">
										완료
									</c:when>
									<c:when test="${dto.orderStatus == 0 }">
										준비 중
									</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	
	</div>    
        
        
 </div>
</section>