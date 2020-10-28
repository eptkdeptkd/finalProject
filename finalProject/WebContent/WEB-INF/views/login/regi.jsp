<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/oj/regi.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<section id="menu" class="section">
        <div class="section_container">
			
			<h1>회원가입</h1>
        
        <div class="int-area">
        <input type="text" id="_id" autocomplete="off" required="required" placeholder="ID는 영어,숫자를 사용하여 7~12내로 입력해주세요"/>
           <label for="id">ID</label>
           <div class="regi_btn">
           		<button id="_GetId" title="id체크">중복확인</button>
	       </div>
        </div>
     	<div id="_rgetid"></div>
       	
        
        <form method="post" id="_frmForm">
        <input type="hidden" id="id" required="required" name="id">
       
        <div class="int-area">
          <input type="password" name="pwd" id="_pwd" required="required" autocomplete="off" placeholder="PW는 영어,숫자를 사용하여 7~12내로 입력해주세요"/>
          <label for="pw">PASSWORD</label>
        </div>
        
         <div class="int-area">
          <input type="password" name="pwd2" id="_pwd2" required="required" autocomplete="off" placeholder="PW는 영어,숫자를 사용하여 7~12내로 입력해주세요"/>
          <label for="pw2">PASSWORD2</label>
        </div>
        
         <div class="int-area">
          <input type="text" name="name" id="_name" required="required" autocomplete="off" placeholder="이름은 한글로만" />
          <label for="name">NAME</label>
        </div>
        
        <div class="int-area">
          <input type="email" name="email" id="_email" required="required" autocomplete="off" placeholder="aaa@aaa.com"/>
          <label for="email">EMAIL</label>
        </div>
        
      </form>
      </div>
      
        <div class="regi_btn1">
          <button type="button" id="_btnRegi" title="회원가입">회원가입</button>
        </div>
        
</section>

<script type="text/javascript">



$("#_btnRegi").click(function(){

	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getCheck= RegExp(/^[a-zA-Z0-9]{7,12}$/);
	var getName= RegExp(/^[가-힣]+$/);
	
	if($("#_id").val() == ""){
		swal("warning!", "아이디를 입력해주세요!", "warning!");
        $("#_id").focus();
        return false;
      }
      //ID의 유효성 검사
      if(!getCheck.test($("#_id").val())){
     //   alert("ID는 영어,숫자를 사용하여 7~12내로 입력해주세요");
        swal("warning!", "ID는 영어,숫자를 사용하여 7~12내로 입력해주세요", "warning");
        $("#_id").val("");
        $("#_id").focus();
        return false;
      }
      //비밀번호
      if(!getCheck.test($("#_pwd").val())) {
      swal("warning!", "PW는 영어,숫자를 사용하여 7~12내로 입력해주세요", "warning");
      $("#_pwd").val("");
      $("#_pwd").focus();
      return false;
      }
      //아이디랑 비밀번호랑 같은지
      if ($("#_id").val()==($("#_pwd").val())) {
    //  alert("비밀번호가 ID와 같습니다");
      swal("warning!", "비밀번호가 ID와 같습니다", "warning");
      $("#_pwd").val("");
      $("#_pwd").focus();
      return false;
    }
      //비밀번호 똑같은지
      if($("#_pwd").val() != ($("#_pwd2").val())){ 
   	  swal("warning!", "1차 2차 비밀번호가 다릅니다", "warning");
      $("#_pwd").val("");
      $("#_pwd2").val("");
      $("#_pwd").focus();
      return false;
     }
      //이름 유효성
      if (!getName.test($("#_name").val())) {
     //   alert("한글로만 이름 똑띠 쓰세요");
       swal("warning!", "한글로만 이름 똑띠 쓰세요", "warning"); 
        $("#_name").val("");
        $("#_name").focus();
        return false;
      }
     //이메일 공백 확인
      if($("#_email").val() == ""){
     //   alert("이메일을 입력해주세요");
     swal("warning!", "이메일을 입력해주세요", "warning"); 
        $("#_email").focus();
        return false;
      }
      //이메일 유효성 검사
      if(!getMail.test($("#_email").val())){
     //   alert("이메일형식에 맞게 입력해주세요")
        swal("warning!", "이메일형식에 맞게 입력해주세요", "warning");
        $("#_email").val("");
        $("#_email").focus();
        return false;
      }

      $("#id").val( $("#_id").val() );
      
    $("#_frmForm").attr("action","regiAf.do").submit();
      
});
  
$("#_GetId").click(function(){

	console.log('click');

	var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);

	if($("#_id").val().trim() == ""){
		// alert("id를 입력해 주십시오");
		swal("warning!", "id를 입력해 주십시오", "warning");
		$("#_id").val("");
		$("#_id").focus();
		$("#_id").val("");
		$("#_rgetid").html("아이디를 입력해 주십시오");		
	}
	   //이름의 유효성 검사
    if(!getCheck.test($("#_id").val())){
     // alert("ID는 영어OR숫자 4~12 입력해주세요 ");
      swal("warning!", "ID는 영어,숫자를 사용하여 7~12내로 입력해주세요", "warning");
      $("#_id").val("");
      $("#_id").focus();
    //  return false;
    }
	else{
		
		
		$.ajax({
			url:"getId.do",
			type:"post",
			data:{ id:$("#_id").val() },
			success:function( msg ){
				if(msg == 'YES'){
					swal("X.X" , "이 ID는 사용할 수 없습니다.", "warning");
				//	alert('이 ID는 사용할 수 없습니다');
				//	alert("이 ID를 사용할 수 없습니다");
					$("#_rgetid").html("사용할 수 없는 ID입니다");
					//$("#_id").val();
					//$("#_id").val();
					return false;
				}
				else{
					swal("GOOD JOB!" , "이 ID는 사용할 수 있습니다.", "success");
				//	alert('이 ID는 사용할 수 있습니다');
					$("#_rgetid").html("이 ID는 사용할 수 있습니다");
					//$("#_id").val(  $("#_id").val().trim()  );
				}
			},
			error:function(){
				alert("error");
			}			
		});
		
	}	
});


let id = $("#_id");
let pw = $("#_pwd");
let pw2 = $("#_pwd2");
let name = $("#_name");
let email = $("#_email");
let btn = $("#_btnRegi");

$(btn).on('click', function () {

	if($(id).val() == "" ){
		$(id).next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
	}
	if($(pw).val() == ""){
		$(pw).next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
	}
	if($(pw2).val() == ""){
		$(pw2).next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
	}
	if($(name).val() == ""){
		$(name).next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
	}
    if($(email).val() == ""){
		$(email).next('label').addClass('warning');
		setTimeout(function () {
			$('label').removeClass('warning');
		},1500);
	}
	
}); 




</script>






