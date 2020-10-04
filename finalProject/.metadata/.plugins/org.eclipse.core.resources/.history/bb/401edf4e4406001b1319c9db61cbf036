<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<table>
<thead>
 <th>선택</th>
 <th>커피</th>
 <th>가격</th>
 <th>옵션</th>
</thead>
<c:if test="${empty list }">
	<tr>
		<td colspan="4" style="text-align:center;"></td>
	</tr>
</c:if>
<c:if test="${not empty list }">
	<c:forEach items="${list }" var="dto" varStatus="vs" >
		<tr>
			<td>
				<input type="checkbox" name="chk" value="${dto.coffee_seq}">
			</td>
			<td>
				${dto.name }
			</td>
			<td>
				${dto.price }
			</td>
			<td>
				shot : <button type="button" id="minusbtn">-</button>&nbsp;
				<input type="text" value="2" id="shot">&nbsp;<button type="button" id="plusbtn">+</button> <br>
				syrup : <select id="sel">
							<option value="0" selected>no syrup</option>
							<c:if test="${not empty sidelist }">
								<c:forEach items="${sidelist }" var="sy" varStatus="vss">
									<option value="${sy.price }">${sy.name }</option>
								</c:forEach>
							</c:if>
						 </select>			
			</td>
		</tr>
	</c:forEach>
</c:if>
</table>

<input type="button" value="order" id="order">

<script type="text/javascript">
let cfseq = "";
let price = 0;
$("#minusbtn").click(function(){
	var qty = $("#shot").val();
	if(qty-1 > 0){
		qty =parseInt(qty)-1;
		$("#shot").val(qty);
	}
});

$("#plusbtn").click(function(){
	var qty = $("#shot").val();
	qty = parseInt(qty) +1;
	$("#shot").val(qty);
});

$("#order").click(function(){
	$("input:checkbox[name=chk]").each(function(){
		price = 0;
		if(this.checked){
			cfseq += ","+$(this).val();
			var tr = $(this).parent().parent();
			var td = tr.children();

			console.log(td);
			
			var cfprice = td.eq(2).html().trim();
			var td2 = td.eq(3).children(); // 1, 4
			var sh = td2.eq(1).val();
			var sy = td2.eq(4).val();
			
			sh = sh * 500;

			price = parseInt(price) + parseInt(cfprice) + parseInt(sh) + parseInt(sy);
		}
	});
	
	console.log(price);
});

</script>