<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

  <section id="menu" class="section">
    <div class="section_container">
<table>
	<thead>
		 <th>선택</th>
		 <th>커피</th>
		 <th>가격</th>
		 <th>옵션</th>
	</thead>
<c:if test="${empty list }">
	<tr>
		<td colspan="4" style="text-align:center;">주문한 내역이 없습니다</td>
	</tr>
</c:if>
<c:if test="${not empty list }">
	<c:forEach items="${list }" var="dto" varStatus="vs" >
		<tr>
			<td>
				<input type="checkbox" name="chk" value="${dto.coffee_seq}" seq="${dto.seq }">
			</td>
			<td>
				${dto.name }
			</td>
			<td>
				${dto.price }
			</td>
			<td>
				shot : <button type="button" class="minusbtn">-</button>&nbsp;
				<input type="text" value="2" class="shot">&nbsp;<button type="button" class="plusbtn">+</button> <br>
				syrup : <select id="sel">
							<option value="0" selected>no syrup</option>
							<c:if test="${not empty slist }">
								<c:forEach items="${slist }" var="sy" varStatus="vss">
									<option value="${sy.price }" sname="${sy.name }">${sy.name }</option>
								</c:forEach>
							</c:if>
						 </select>			
			</td>
			<td>
				<input type="text" placeholder="요청 사항을 적어주세요">
			</td>
		</tr>
	</c:forEach>
</c:if>
</table>

<input type="button" value="order" id="order">

</div>
</section>

<script type="text/javascript">
let seq = "";
let cfseq = "";
let price = 0;
let pname = "";
let cfcount = 0;
let detail = "";
$(".minusbtn").click(function(){
	var tr = $(this).closest('tr');
	var td = tr.find('td:eq(3)').children();
	var qty = td.eq(1).val();
	if(qty-1 > 0){
		qty =parseInt(qty)-1;
		td.eq(1).val(qty);
	}
});

$(".plusbtn").click(function(){
	var tr = $(this).closest('tr');
	var td = tr.find('td:eq(3)').children();
	var qty = td.eq(1).val();
	qty = parseInt(qty) +1;
	td.eq(1).val(qty);
});

$("#order").click(function(){
	price = 0;
	$("input:checkbox[name=chk]").each(function(){
		if(this.checked){
	
			cfseq += ","+$(this).val();
			seq += ","+$(this).attr("seq");
			var tr = $(this).parent().parent();
			var td = tr.children();

			var cfname = td.eq(1).html().trim();
			var cfprice = td.eq(2).html().trim();
			var td2 = td.eq(3).children(); // 1, 4
			var sh = td2.eq(1).val();
			var syprice=$("#sel").val();
			var syname = $("#sel option:checked").text();
			console.log(syname);
			var ask = td.eq(4).children().eq(0).val().trim();
			var shprice = 0;
			
			if(sh>=3){
				shprice = sh * 500;
			}

			price = parseInt(price) + parseInt(cfprice) + parseInt(shprice) + parseInt(syprice);
			pname = td.eq(1).html().trim();

			var str = cfname +","+sh+","+syname+","+ask;
			detail += "_"+str ;
			cfcount += 1;
		}
	});

	if(cfcount<1){
		alert("선택 후 주문해주시기 바랍니다");
	}else{
		var oname = pname;
		if(pname.length>6){
			oname = oname.substring(0,6)+"..";
		}
		
		if(cfcount > 1){
			oname += " 외 "+ cfcount +"개";
		}

		$.ajax({
    		url:"getVC.do",
    		data:{"id":"OJEA"},
    		type:"post",
    		success:function(data){
				if(data==0){
					price = price- 1000;
					alert("첫번째 방문이시므로 1000원 할인되었습니다");
    			}else if(data%10 ==0){
					price = price- 1000;
					alert(data+"번째 방문이시므로 1000원 할인되었습니다");
            	}

				/*
				var IMP = window.IMP; // 생략해도 괜찮습니다.
				IMP.init("imp34353297"); 
			
				// IMP.request_pay(param, callback) 호출
				  IMP.request_pay({ // param
				    pg: "html5_inicis",
				    merchant_uid: "mearchant_"+new Date(),
				    name: oname,
				    amount: price,
				   // buyer_name: ${loginDto.name},
				    buyer_name: "OJEA",
				  }, function (rsp) { // callback
				    if (rsp.success) { // 결제 성공
			
				    	$.ajax({
				    		url:"order.do",
				    		//data:{"id":${loginDto.id}, "coffee_seq":seq, "price":price },
				    		data:{"id":"aaa", "name":oname, "price":price, "coffee_seq":cfseq, "detail":detail },
				    		type:"post",
				    		success:function(msg){
					    		var sp = msg.indexOf("/");
					    		var msg1 = msg.substring(0,sp);
								var msg2 = msg.substring(sp+1);
					    		
								alert(msg2);
								if(msg1=="1"){
									location.href="ofinish.do";
								}else{
									location.href="cartMove.do";
								}
				    		},
				    		error:function(){
				    			alert("error");
				    		}
				    	});
					       
				    } else {	// 결제 실패
				        alert("결제 실패 하였습니다 -> " + rsp.error_msg);
				    }
				  });
				*/
				$.ajax({
		    		url:"order.do",
		    		//data:{"id":${loginDto.id}, "coffee_seq":seq, "price":price },
		    		data:{"id":"aaa", "name":oname, "price":price, "coffee_seq":cfseq, "detail":detail,"seqArr":seq },
		    		type:"post",
		    		success:function(msg){
			    		var sp = msg.indexOf("/");
			    		var msg1 = msg.substring(0,sp);
						var msg2 = msg.substring(sp+1);
			    		
						alert(msg2);
						if(msg1=="1"){
							location.href="ofinish.do";
						}else{
							location.href="cartMove.do";
						}
		    		},
		    		error:function(){
		    			alert("error");
		    		}
		    	});		
		    	
    		},
    		error:function(){
    			alert("error");
    		}
    	});
	

	}
});

</script>