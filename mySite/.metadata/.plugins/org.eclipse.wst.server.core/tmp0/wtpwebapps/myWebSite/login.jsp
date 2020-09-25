<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src ="./jquery/jquery-3.5.1.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<style type="text/css">
body{
	background: linear-gradient(to right, skyblue, pink);
}
#oneline{
	border : 2px solid white;
	width : 600px;
	height : 800px;
	opacity : 0.7;
	margin-left : 35%;
}
#tdiv{
	color: white;
	font-size : 36px;
	line-height : 1.2em;
	border : 2px solid white;
	margin-top: 50px;
	margin-left : 50px;
	width : 250px;
	height : 110px;
	padding-left :10px;
	padding-top: 10px;
}
#login{
	background-color : white;
	width: 450px;
	height: 500px;
	margin-top : 20px;
	margin-left : 50px;
	opacity : 0.4;
}
input{
	height :20px;
	bakcground-color:white;
	border-left:none;
	border-right:none;
	border-top:none;
	boder: 1px solid white;
	padding-left:50px;
	margin-top:60px;
}
button{
	margin-left:120px;
	background-color: white;
	color:lightgrey;
	border :none;
	border-radius:10px;
	width: 100px;
	height:30px;
	margin-top:20px;
}
#notrobot{
	visibility:hidden; 
}
#randomstr{
	background-color:black;
	width: 200px;
	height: 80px;
	margin-top:120px;
	margin-left:30px;
	border: 3px solid white;
	clear:both;
	text-align: center;
	margin-bottom:50px;
}
#testlab{
	font-size:8px;
	padding-left:30px;
	margin-top:-50px;
}
#randomin{
	color:white;
	padding-left:10px;
	padding-bottom:-25px;
	font-size:25px;
}
</style>
</head>
<body>

<form id="frm" method="post">
<input type="hidden" name="work" value="login">
<div id="oneline" >
<div id="tdiv">
너와 나의 <br> &nbsp;&nbsp;&nbsp; 비밀 일기
</div>
<div id="login">
<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요" size="30" value="client1">
<input type="checkbox" id="chk_save_id" name="chk_save_id" value="chk_save_id">Save ID<br>
<input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요" size="30" value="abcABC123!@#" style="float:left; "><br>

<div id="eyecon">
<img src="./images/eye.png" style="height:20px; width:50px; float:left; margin-top:60px; padding-left:20px;">
</div>
<div id="notrobot" style="visibility:hidden;">
	<div id="randomstr">
		<p id="randomin"></p>
	</div><br>
	<p id="testlab">위의 글자를 따라 써주시기 바랍니다</p>
	<input type="text" id="rotest" name="rotest" size="20" placeholder="보안 문자 입력">
	<p id="warnlab" style="padding-left:20px; color:grey; font-size:8pt;"></p>
</div>
</div>

<button type="button" id="loginbtn">로그인</button>
<button type="button" id="joinbtn">회원가입하기</button>
</div>
</form>

<script type="text/javascript">
let tbol = false;
let count = 0;
let str = ""; // 랜덤으로 들어갈 값

let user_id = $.cookie("user_id"); // cookie를 꺼내온 것
if(user_id != null){			   // 저장된 쿠키가 존재할 경우
	$("#id").val(user_id);
	$("#chk_save_id").attr("checked","checked");
}
$("#chk_save_id").click(function(){
	if( $("#chk_save_id").is(":checked") ){ // 저장하길 원하는 경우
		if($("#id").val().trim()==""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			$("#chk_save_id").prop("checked",false);
		}else{
			// 7일 :: -로 해놓으면 무한대 & path:'/' 모든 경로에 있는 것을 가지고 와라
			$.cookie("user_id",$("#id").val().trim(),{ expires:7, path:'/'} ); 
		}	
	}else{
		// 완전 삭제는 없고 기한을 삭제하는 것만 있다
		$.removeCookie("user_id",{path:'/'}); 
	}
});
$(document).ready(function() {
	$('#eyecon').mousedown(function() {
		$('#pwd').attr('type','text');
		$('#eyecon img').attr = $('#eyecon img').attr('src','./images/eyeclose.png');
	});
	$('#eyecon').mouseup(function() {
		$('#pwd').attr('type','password');
		$('#eyecon img').attr = $('#eyecon img').attr('src','./images/eye.png');
	});
	$('#loginbtn').click(function() {
		let pwd = $('#pwd').val().replace(" ","");
		let num = pwd.search(/[0-9]/g);
		let eng = pwd.search(/[a-z]/g);
		let eng2 = pwd.search(/[A-Z]/g);
		let spe = pwd.search(/[@!%]/gi);
		if($("#id").val().trim() == ""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
		}else if($("#pwd").val().trim() == ""){
			alert("비밀번호를 입력해주세요");
			$("#pwd").focus();
		}else if(pwd.length<8 || pwd.length>16){
			alert("8~16자리로 입력해주시기 바랍니다");
		}else if(num<0|| eng<0 || spe <0 || eng2 <0){
			alert("영문,숫자,특수문자를 혼합하여 입력해주시기 바랍니다");
		}else{
			$.ajax({
				 url:"./checkcont",
				 type:"post",
				 data:"work=isLogPos&id="+$("#id").val()+"&pwd="+pwd,
				 datatype:"text",
				 success:function(obj){
					let b = obj.b;
					console.log(count);
					 if(!b){
						 if(count>3){
							 $("#notrobot").attr("style","visibility:visible");
							// console.log($("#notrobot").attr("style"));
							 getRandom();
							 $("#randomin").text(str);
						 }
						 count++;
						 alert("아이디/비밀번호를 다시 확인 해주시기 바랍니다");
						 $("#id").val(""); $("#pwd").val(""); $("#id").focus();
					 }else{
						if(!tbol && count >3){
							alert("보안 문자를 입력해주세요");
							$("#rotest").focus();
						}else{
							count=0;
							let id = $("#id").val().replace(" ","");
							$("#frm").attr("action","logjoin?work=login&id="+id).submit();
						}
					 }
				 },
				 error:function(){
					 alert("error");
				 }
			 });
			}
	});
	$('#joinbtn').click(function() {
		location.href="logjoin?work=movejoin";
	});
	$('#rotest').focusout(function(){
		let input = $("#rotest").val();
		console.log("str = "+str+" , input = "+ input);
		if(str != input){
			$("#warnlab").text("정확하게 입력해주시기 바랍니다");
			tbol = false;
		}else {
			$("#warnlab").text("정확하게 입력 하였습니다");
			tbol=true;
		}
	});
	function getRandom() {
		str="";
		let num = new Array(5);
		for(i=0; i<num.length; i++){
			let n = parseInt((Math.random()*24));
			if(i%2==0){
				num[i] = n+"";
			}else{
				num[i] = String.fromCharCode( ((n+65)+"") );
			}
			str += num[i];
		}
		console.log("str = "+str);
	}
});

</script>
</script>


</body>
</html>