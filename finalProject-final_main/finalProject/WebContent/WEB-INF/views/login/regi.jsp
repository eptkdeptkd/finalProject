<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

</head>
<body>

<section id="menu" class="section">
        <div class="section_container">
        
<div id="test" style="background-color: yellow;">

		<div id="content_wrap">
								
			<div class="login_title_warp">
				<div style="margin-top: 15px">
					<h2>회원가입</h2>
				</div>			
			</div>
			
			<div id="login_wrap">
				<form action="" method="post" id="_frmForm" name="frmForm">
				
				<table class="content_table" style="width:75%">
				<colgroup>
					<col style="width:30%">
					<col style="width:70%">
				</colgroup>
				
				<tr>
					<th>아이디 첵크</th>
					<td>
						<input type="text" name="id" id="_id" size="30">										
						<a href="#none" id="_btnGetId" title="id첵크">
							아이디체크<img alt="" src="./image/idcheck.png">
						</a>
						<div id="_rgetid"></div>						
					</td>				
				</tr>
			
				<tr>
					<th>패스워드</th>
					<td>
						<input type="password" name="pwd" id="_pwd" size="30">
					</td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td>
						<input type="password" name="pwd2" id="_pwd2" size="30">
					</td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" id="_name" size="30">
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" name="email" id="_email" size="30">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" style="height: 50px; text-align: center;">
					
					<a href="#none" id="_btnRegi" title="회원가입">
						회원가입<img alt="" src="./image/regi.jpg">
					</a>
					
					</td>
				</tr>
				</table>	
				</form>	
			</div>
			</div>		
		</div>	

</div>
</section>

<script type="text/javascript">



$("#_btnRegi").click(function(){

	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var getName= RegExp(/^[가-힣]+$/);
	
	if($("#_id").val() == ""){
        alert("아이디를 입력해주시기 바랍니다");
        $("#_id").focus();
        return false;
      }
      //ID의 유효성 검사
      if(!getCheck.test($("#_id").val())){
        alert("ID는 영어,숫자를 사용하여 4~12내로 입력해주세요");
        $("#_id").val("");
        $("#_id").focus();
        return false;
      }
      //비밀번호
      if(!getCheck.test($("#_pwd").val())) {
      alert("PW는 영어OR숫자 4~12 입력해주세요");
      $("#_pwd").val("");
      $("#_pwd").focus();
      return false;
      }
      //아이디랑 비밀번호랑 같은지
      if ($("#_id").val()==($("#_pwd").val())) {
      alert("비밀번호가 ID와 똑같으면 안!대!");
      $("#_pwd").val("");
      $("#_pwd").focus();
    }
      //비밀번호 똑같은지
      if($("#_pwd").val() != ($("#_pwd2").val())){ 
      alert("비밀번호가 틀렸네용.");
      $("#_pwd").val("");
      $("#_pwd2").val("");
      $("#_pwd").focus();
      return false;
     }
      //이름 유효성
      if (!getName.test($("#_name").val())) {
        alert("한글로만 이름 똑띠 쓰세용");
        $("#_name").val("");
        $("#_name").focus();
        return false;
      }
     //이메일 공백 확인
      if($("#_email").val() == ""){
        alert("이메일을 입력해주세요");
        $("#_email").focus();
        return false;
      }
      //이메일 유효성 검사
      if(!getMail.test($("#_email").val())){
        alert("이메일형식에 맞게 입력해주세요")
        $("#_email").val("");
        $("#_email").focus();
        return false;
      }
    $("#_frmForm").attr("action","regiAf.do").submit();
      
});
$("#_btnGetId").click(function(){

	var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);

	if($("#_id").val().trim() == ""){
		// alert("id를 입력해 주십시오");
		$("#_id").val("");
		$("#_id").focus();
		$("#_id").val("");
		$("#_rgetid").html("아이디를 입력해 주십시오");		
	}
	   //이름의 유효성 검사
    if(!getCheck.test($("#_id").val())){
      alert("ID는 영어OR숫자 4~12 입력해주세요 ");
      $("#_id").val("");
      $("#_id").focus();
      return false;
    }
	else{

		$.ajax({
			url:"getId.do",
			type:"post",
			data:{ id:$("#_id").val() },
			success:function( msg ){
				if(msg == 'YES'){
				//	alert("이 ID를 사용할 수 없습니다");
					$("#_rgetid").html("사용할 수 없는 ID입니다");
					$("#_rgetid").css("background-color", "#ff0000");
					$("#_id").val();
					$("#_id").val();
				}
				
				else{
					$("#_rgetid").html("이 ID는 사용할 수 있습니다");
					$("#_rgetid").css("background-color", "#0000ff");
					$("#_id").val(  $("#_id").val().trim()  );
				}
			},
			error:function(){
				alert("error");
			}			
		});
	}	
});




</script>


</body>
</html>





