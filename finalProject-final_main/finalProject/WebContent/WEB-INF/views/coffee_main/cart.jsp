<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

  <section id="menu" class="section">
        <div class="section_container">
            <h2>My Cart</h2>
            <div class="menu_admin">
                <table class="cart_table">
                    <thead>
                        <tr>
                            <th>
                                <h3>Check</h3>
                            </th>
                            <th>
                                <h3>Coffee</h3>
                            </th>
                            <th>
                                <h3>Price</h3>
                            </th>
                            <th>
                                <h3>Option</h3>
                            </th>
                            <th>
                                <h3>Comment</h3>
                            </th>
                            <%-- 
                            <th>
                            	<h3>Delete</h3>
                            </th>
                            --%>
                        </tr>
                    </thead>
                    <tbody>
                 <c:if test="${empty list }">
					<tr>
						<td colspan="5" style="text-align:center;">주문한 내역이 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach items="${list }" var="dto" varStatus="vs" >
						<tr>
							<td>
								<input type="checkbox" name="chk" value="${dto.coffee_seq}" seq="${dto.seq }">
							</td>
							<td>
								<p id="n${dto.seq }">${dto.name }</p>
							</td>
							<td>
								<p id="p${dto.seq }">${dto.price }</p>
							</td>
							<td>
								<div class="info_option">
	                                <p class="info_subtitle">shot:</p>
	                                <input type="button" value="-" class="minusbtn" onclick="minBtn(${dto.seq})"> &nbsp;&nbsp;
	                                <input type="text" value="1" class="shot" id="q${dto.seq }"> &nbsp;&nbsp;
	                                <input type="button" value="+" class="plusbtn" onclick="plBtn(${dto.seq})">
	                            </div>
	                            <div class="info_option">
	                                <p class="info_subtitle">syrup:</p>
	                                <select id="sel${dto.seq }">
	                                    <option value="0" selected>no syrup</option>
	                                   <c:if test="${not empty slist }">
	                                    <c:forEach items="${slist }" var="sy" varStatus="vss">
	                                        <option value="${sy.price }" sname="${sy.name }">${sy.name }</option>
	                                    </c:forEach>
	                                   </c:if>
                                </select>
                            </div>			
							</td>
							<td>
								 <input type="text" id="i${dto.seq }" class="info_input" size="20" placeholder="요청사항을 입력해주세요" required>
							</td>
						</tr>
					</c:forEach>
						</c:if>

                    </tbody>
                </table>
            </div>
            <div class="cart_order">
                <button class="order_btn" id="order">Order</button>
            </div>
        </div>
    </section>

<script type="text/javascript">
let seq = "";
let cfseq = "";
let price = 0;
let pname = ""; // 커피 명 (결제에 뜨게 하기 위해서)
let cfcount = 0;
let detail = "";
function minBtn(seq){
	var s = "#q"+seq;
	var qty = $(s).val();
	if(qty-1 >0){
		qty = parseInt(qty)-1;
		$(s).val(qty);
	}
}
function plBtn(seq){
	var s = "#q"+seq;
	var qty = $(s).val();
	qty = parseInt(qty)+1;
	$(s).val(qty);
}

$("#order").click(function(){
	price = 0;
	$("input:checkbox[name=chk]").each(function(){
		if(this.checked){
			var s = $(this).attr("seq");
			cfseq += ","+$(this).val();
			seq += ","+s;
			
			var sname = "#n"+s;
			pname = $(sname).html();
			var fname = "#p"+s;
			var cfprice = $(fname).html();
			var qname = "#q"+s;
			var sh = $(qname).val();
			var syname = "#sel"+s;
			var syprice = $(syname).val();
			var syname = $(syname+" option:checked").text();
			var aname = "#i"+s;
			var ask = $(aname).val();
			var shprice = 0;
			
			if(sh>=3){
				shprice = sh * 500;
			}

			price = parseInt(price) + parseInt(cfprice) + parseInt(shprice) + parseInt(syprice);

			var str = pname +","+sh+","+syname+","+ask;
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
    		data:{"id":"${login.id}"},
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
		    		data:{"id":"${login.id}", "name":oname, "price":price, "coffee_seq":cfseq, "detail":detail,"seqArr":seq },
		    		type:"post",
		    		success:function(msg){
			    		var sp = msg.indexOf("/");
			    		var msg1 = msg.substring(0,sp);
						var msg2 = msg.substring(sp+1);
			    		
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