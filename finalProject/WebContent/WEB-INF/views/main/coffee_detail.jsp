<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>    

<div style="float:left;">
<img src="http://192.168.0.195:8090/finalProject/upload/${dto.newname }" width="250" height="300" id="cfimg">
&nbsp;&nbsp;
</div>
<div id="showimg" style="margin-left:300px; margin-top:10px; width:80px; height:80px;" ></div>
<br>

<h3 style="clear:both;">${dto.name }</h3>  
<h6>${dto.price }</h6>
<input type="button" id="minusbtn" value="-"> &nbsp;&nbsp;
<input type="text" id="qtyText" value="1"> &nbsp;&nbsp;
<input type="button" id="plusbtn" value="+"> 
<br>

<input type="button" onclick="order(${dto.seq})" value="장바구니 추가">

<br><br>
<hr>
<div>
${dto.info }
</div>


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
		//data:{"id":${login.id}, "coffee_seq":seq, "price":price },
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

$("#cfimg").mousemove(function(e){
	var x = e.clientX+20;
	var y = e.clientY+20;
	var imgsrc = "http://192.168.0.195:8090/finalProject/upload/${dto.newname }";

	$("#showimg").css("background-image","url("+imgsrc+")");
	$("#showimg").css("backgroundPosition", x+"px "+y+"px");
	
});
$("#cfimg").mouseout(function(){
	$("#showimg").css("background-image","");
});
</script>