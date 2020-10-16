<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/oj/regi.css">

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<section id="menu" class="section">
        <div class="section_container">
<h1>회원가입</h1>
      <form action="" method="post" id="_frmForm" name="frmForm">
        
        <div class="int-area">
          <input type="text" name="id" id="_id" autocomplete="off" placeholder="아이디를 입력해주세요"/>
          <label for="id">ID</label>
          <button id="_btnGetId" class="idcheck" title="id체크">아이디체크</button>
          <div id="_rgetid"></div>
        </div>
       
        <div class="int-area">
          <input type="password" name="pwd" id="_pwd" autocomplete="off" placeholder="비밀번호를 입력해주세요"/>
          <label for="pw">PASSWORD</label>
        </div>
        
         <div class="int-area">
          <input type="password" name="pwd2" id="_pwd2" autocomplete="off"/>
          <label for="pw2">PASSWORD2</label>
        </div>
        
         <div class="int-area">
          <input type="text" name="name" id="_name" autocomplete="off"/>
          <label for="name">NAME</label>
        </div>
        
        <div class="int-area">
          <input type="email" name="email" id="_email" autocomplete="off"/>
          <label for="email">EMAIL</label>
        </div>
        
        <div class="btn-area">
          <button type="button" id="_btnRegi" title="회원가입">회원가입</button>
        </div>
        
      </form>
      </div>
</section>

<script type="text/javascript">
let getCheck= RegExp(/^[a-zA-Z0-9]{10,12}$/);

$("#_btnRegi").click(function(){
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getName= RegExp(/^[가-힣]+$/);

	if($("#_id").val() == ""){
        alert("아이디를 입력해주시기 바랍니다");
        $("#_id").next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
        $("#_id").focus();
        return false;
      }
      //ID의 유효성 검사
      if(!getCheck.test($("#_id").val())){
        alert("ID는 영어,숫자를 사용하여 10~12내로 입력해주세요");
        $("#_id").next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
        $("#_id").val("");
        $("#_id").focus();
        return false;
      }
      //비밀번호
      if(!getCheck.test($("#_pwd").val())) {
      alert("PW는 영어OR숫자 4~12 입력해주세요");
      $("#_pwd").next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
      $("#_pwd").val("");
      $("#_pwd").focus();
      return false;
      }
      //아이디랑 비밀번호랑 같은지
      if ($("#_id").val()==($("#_pwd").val())) {
      alert("비밀번호가 ID와 같습니다");
      $("#_pwd").next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
      $("#_pwd").val("");
      $("#_pwd").focus();
    }
      //비밀번호 똑같은지
      if($("#_pwd").val() != ($("#_pwd2").val())){ 
      alert("비밀번호가 다릅니다.");
      $("#_pwd").next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
      $("#_pwd").val("");
      $("#_pwd2").val("");
      $("#_pwd").focus();
      return false;
     }
      //이름 유효성
      if (!getName.test($("#_name").val())) {
        alert("한글로만 이름 똑띠 쓰세요");
        $("#_name").next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
        $("#_name").val("");
        $("#_name").focus();
        return false;
      }
     //이메일 공백 확인
      if($("#_email").val() == ""){
        alert("이메일을 입력해주세요");
        $("#_email").next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
        $("#_email").focus();
        return false;
      }
      //이메일 유효성 검사
      if(!getMail.test($("#_email").val())){
        alert("이메일형식에 맞게 입력해주세요")
        $("#_email").next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
        $("#_email").val("");
        $("#_email").focus();
        return false;
      }
    $("#_frmForm").attr("action","regiAf.do").submit();
});

$("#_btnGetId").click(function(){
	
	if($("#_id").val().trim() == ""){
		// alert("id를 입력해 주십시오");
		$("#_id").val("");
		$("#_id").focus();
		$("#_id").val("");
		$("#_rgetid").html("아이디를 입력해 주십시오");		
	}
	
	   //이름의 유효성 검사
    if(!getCheck.test($("#_id").val())){
      alert("ID는 영어OR숫자 10~12 입력해주세요 ");
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






