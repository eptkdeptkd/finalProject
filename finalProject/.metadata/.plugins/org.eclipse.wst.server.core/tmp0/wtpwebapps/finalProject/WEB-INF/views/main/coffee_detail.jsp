<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>    

<img src="/upload/${dto.newname }" width="60" height="80">
<br>
<h3>${dto.name }</h3>  
<h6>${dto.price }</h6>
<input type="button" id="minusbtn" value="-"> &nbsp;&nbsp;
<input type="text" id="qtyText" value="1"> &nbsp;&nbsp;
<input type="button" id="plusbtn" value="+"> 
<br>

<input type="button" onclick="order(${dto.seq})" value="장바구니 추가">


<script type="text/javascript">
let qty = 1;
$("#minusbtn").click(function(){
	if(qty-1 > 0){
		qty = qty-1;
		$("#qtyText").val(qty);
	}
});

$("#plusbtn").click(function(){
	qty = qty + 1;
	$("#qtyText").val(qty);
});

function order(seq){
	var price = ${dto.price} * qty;

	$.ajax({
		url:"cart.do",
		//data:{"id":${loginDto.id}, "coffee_seq":seq, "price":price },
		data:{"id":"OJEA", "coffee_seq":seq, "price":price },
		type:"post",
		success:function(b){
			alert(b);
			if(b) {
				alert("정상적으로 카트에 담겼습니다");
				
			}

			
			else alert("장바구니 추가 중 오류가 발생하였습니다");
				
		},
		error:function(){
			alert("error");
		}
	});
}

</script>