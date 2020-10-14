<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>   

<!--Coffee menu detail - 메뉴 상세 페이지-->
    <section id="menu" class="section">
        <div class="section_container">
            <div class="coffee_pictureinfo">
                <div class="picture_box">
                    <a href="" class="content_coffee_detail" target="blank">
                    <img src="http://192.168.0.195:8090/finalProject/upload/${dto.newname }" alt="menu" class="coffee_img" />
                    </a>
                </div>
                <div class="info_box">
                    <div class="info_top">
                        <h2 class="coffee_name_detail">${dto.name }</h2>
                        <h2 class="coffee_price_detail">￦${dto.price }</h2>
                    </div>
                    <div class="info_number">
                        <input type="button" id="minusbtn" value="-"> &nbsp;&nbsp;
                        <input type="text" id="qtyText" value="1"> &nbsp;&nbsp;
                        <input type="button" id="plusbtn" value="+">
                    </div>
                    <div class="detail_explain">
                       ${dto.info }
                    </div>
                    <div class="info_addorder">
                        <button class="addorder_btn" id="addbutton" onclick="order(${dto.seq})">Add To Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
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

	var sid = "${login.id}";
	if(sid == null || sid == ""){
		swal('', '로그인 후 사용 가능합니다.', "warning");
		return;
	}
	
	$.ajax({
		url:"cart.do",
		data:{"id":"${login.id}", "coffee_seq":seq, "price":price,"qty":qty },
		type:"post",
		success:function(b){
			if(b) {
				swal('', '정상적으로 카트에 담겼습니다', "success");
			}
			else swal('', '장바구니 추가 중 문제가 발생하였습니다', "success");
		},
		error:function(){
			alert("error");
		}
	});
}
/*
$(".cfimg").mousemove(function(e){
	var x = (e.clientX-10)+20;
	var y = (e.clientY-10)+20;

	var imgsrc = "http://192.168.0.195:8090/finalProject/upload/${dto.newname }";
	
	$(".cfimg").css("background-image","url("+imgsrc+")");
	$(".cfimg").css("transform","scale(2)");
	$(".cfimg").css("backgroundPosition", x+"px "+y+"px");
	
});

$(".cfimg").mouseout(function(){
	$(".cfimg").css("background-image","http://192.168.0.195:8090/finalProject/upload/${dto.newname }");
});
*/

</script>