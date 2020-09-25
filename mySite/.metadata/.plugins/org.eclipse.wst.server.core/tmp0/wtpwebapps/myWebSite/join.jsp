<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src ="./jquery/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
/*             if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            } */

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>
<style type="text/css">
body{
	background: linear-gradient(to right, skyblue, pink);
}
#oneline{
	border : 2px solid white;
	width : 700px;
	height : 850px;
	opacity : 0.7;
	margin-left : 35%;
}
#info{
	width:300px;
	height:30px;
	margin-top:20px;
	padding-top : 10px;
	margin-left: 40px;
	padding-left: 30px;
	color:white;
	font-size:26pt;
	font-weight: 1200;
	letter-spacing: -5px;
	/* text-shadow: 2px 2px 5px #0077b6; */
	/* box-shadow : 2px 2px 2px #0077b6; */
	border-radius: 0.3em;
	/* text-decoration : underline; */
}
input[type="text"]{
	border-left : 0px;
	border-right: 0px;
	border-top: 0px;
	border-bottom: 1px solid #03045e;
	margin-left : 40px;
	margin-top : 20px;
	height:30px;
	width : 450px;
	border-radius :5px 5px 5px 5px;
/* 	background-color:#90e0ef;*/
	opacity : 0.7; 
}
input[type="button"]{
	margin-left:30px;
	height : 35px;
	width : 140px;
	background-color:#07beb8;
	font-weight:750;
	color: white;
	border:none;
	cursor:pointer;
	border-radius:10px 10px 10px 10px;
	text-align: center;
	opacity : 0.7;
}
input[type="checkbox"]{
	border:none;
	margin-left : 40px;
	margin-top : 20px;
}
.c{
	color:#343a40;
	font-weight:950;
	background-color:white;
	border-radius:2px 2px 2px 2px;
	font-family:굴림;
	opacity:0.6;
}
#pwdlab{
	color:red;
	margin-left : 40px;
	font-family:굴림;
	font-size:9pt;
}
</style>
</head>
<body>

<form id="frm" method="post">
<input type="hidden" name="work" value="join">
<div id="oneline">
<p id="info">회원가입</p>

<input type="text" name="id" id="_id" placeholder="아이디를 입력해주세요(필수 입력)" required>
<input type="button" id="idBtn" value="아이디 확인"><br>

<input type="text" name="nickname" id="nickname" placeholder="별명을 입력해주세요(필수 입력)" required>

<input type="text" name="pwd" id="_pwd" placeholder="비밀번호를 입력해주세요(필수 입력)" required><br>
<input type="text" name="pwddb" id="_pwddb" placeholder="비밀번호 확인" required><br>
<p id='pwdlab'></p>

<input type="text" id="birthday" name="birthday" placeholder="생년월일을 선택해주세요(필수 입력)" required autocomplete="off"><br>

<input type="text" id="sample4_postcode" name="postcode" placeholder="우편번호">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
<input type="text" id="sample4_roadAddress" name="roadaddr" placeholder="도로명주소"><br>
<input type="text" id="sample4_jibunAddress" name="jibunaddr" placeholder="지번주소"><br>
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="sample4_detailAddress" name="detailaddr" placeholder="상세주소"><br>
<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->

<input type="text" id="pnumber" name="pnumber" placeholder="전화번호를 입력해주세요 (-생략)">
<input type="button" id="pnumBtn" value="비밀번호 확인"><br>
<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요">
<input type="button" id="emailBtn" value="이메일 확인"><br>

<input type="checkbox" name="snssend" id="msend" value="1" ><label class="c">메일 수신</label>
<input type="checkbox" name="snssend" id="ssend" value="2" ><label class="c">문자 수신</label><br>

<input type="button" id="joinBtn" value="가입" style="margin-top:50px; margin-left:100px; font-size:18pt;">
</div>
</form>

<script type="text/javascript">
let week = ['일','월','화','수','목','금','토']
let pwdBool = false;
let idchk = false;
let pnumchk = false;
let emailchk =false;
let mbool = false;
let sbool = false;
let d = new Date();
year = d.getFullYear()-20;
d = year+"."+d.getMonth()+"."+d.getDate();
console.log("d = "+d);
$(document).ready(function() {
	$('#idBtn').click(function() {
		let id = $('#_id').val().replace(" ","");
		if (id== ""){
			alert("아이디를 입력해주세요");
			$("#_id").focus();
		}else{
			$.ajax({
				url:"./checkcont",
				type:"get",
				data:"work=idchk&id="+$("#_id").val(),
				datatype:"text", 
				success:function(obj){
	/* 				console.log(obj);
					console.log(obj.b); */
					if(!obj.b){
						alert("사용 가능한 아이디 입니다");
						idchk = true;
					}else{
						alert("사용 불가능한 아이디 입니다");
						idchk=false;
						$("#_id").val("");
						$("#_id").focus();
					}
				},
				error:function(){
					alert("error");
				}
			});
		}
	});
	$("#pnumBtn").click(function() {
		let p = $("#pnumber").val().replace(" ","");
		if(p==""){
			alert("전화번호를 입력해주세요");
			$("#pnumber").focus();
		}else{
			$.ajax({
				url:"./checkcont",
				type:"get",
				data:"work=pnumchk&pnumber="+$("#pnumber").val(),
				datatype:"text", 
				success:function(obj){
	/* 				console.log(obj);
					console.log(obj.b); */
					if(!obj.b){
						alert("사용 가능합니다");
						pnumchk = true;
					}else{
						alert("이미 존재하는 전화번호 입니다");
						pnumchk=false;
						$("#pnumber").val("");
						$("#pnumber").focus();
					}
				},
				error:function(){
					alert("error");
				}
			});
		}
	});
	$("#emailBtn").click(function() {
		let p = $("#email").val().replace(" ","");
		if(p==""){
			alert("이메일을 입력해주세요");
			$("#email").focus();
		}else{
			$.ajax({
				url:"./checkcont",
				type:"get",
				data:"work=emailchk&email="+$("#email").val(),
				datatype:"text", 
				success:function(obj){
	/* 				console.log(obj);
					console.log(obj.b); */
					if(!obj.b){
						alert("사용 가능합니다");
						emailchk = true;
					}else{
						alert("이미 존재하는 전화번호 입니다");
						emailchk=false;
						$("#email").val("");
						$("#email").focus();
					}
				},
				error:function(){
					alert("error");
				}
			});
		}
	});
	$('#birthday').datepicker({
		dateFormat : "yy.mm.dd",
		dateNamesMin: week,
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		changeMonth: true,
		changeYear: true,
		yearRange: '-100:-5',
		defaultDate : d
	});
	$('#_pwd').focusout(function() {
		let pwd = $('#_pwd').val().replace(" ","");
		let num = pwd.search(/[0-9]/g);
		let eng = pwd.search(/[a-z]/g);
		let eng2 = pwd.search(/[A-Z]/g);
		let spe = pwd.search(/[@!%]/gi);
		if(pwd == ""){
			alert("비밀번호를 입력해주시기 바랍니다");
		}else if(pwd.length<8 || pwd.length>16) {
			alert("8~16자리로 입력해주시기 바랍니다");
			$("#_pwd").val(""); $("#_pwd").focus();
		}else if(num<0|| eng<0 || spe <0 || eng2 <0){
			alert("영문,숫자,특수무자를 혼합하여 입력해주시기 바랍니다");
			$("#_pwd").val(""); $("#_pwd").focus();
		}
	});
	$('#joinBtn').on('click',function(){
		
		if(pwdBool && sbool && mbool 
		&& $("#birthday").val().replace(" ","")!="" && $("#nickname").val().replace(" ","")!=""
			&& pnumchk && emailchk){
			$('#frm').attr("action","./logjoin").submit();
		}else if(!pwdBool){
			alert("비밀번호를 확인해주세요");
		}else if(!sbool){
			alert("전화번호를 확인해주세요");
		}else if(!mbool){
			alert("메일을 확인 해주세요");
		}else if($("#birthday").val().replace(" ","")==""){
			alert("생일번호를 입력해주세요");
		}else if($("#nickname").val().replace(" ","")==""){
			alert("별명을 확인해주세요");
		}else if(!pnumchk){
			alert("전화 번호를 확인해주세요");
		}else if(!emailchk){
			alert("이메일을 확인해주세요");
		}
	});
	$('#_pwddb').focusout(function() {
		let pwd1 = $('#_pwd').val();
		let pwd2 = $('#_pwddb').val();
		if(pwd1!=pwd2){
			$('#pwdlab').text('비밀번호가 동일하지 않습니다');
			pwdBool = false;
		}else{
			$('#pwdlab').text('비밀번호가 동일합니다');
			$('#pwdlab').attr('color','white');
			pwdBool = true;
		}
	});
	$("#msend").change(function() {
		if($("#msend").prop("checked")){
			if($("#email").val().replace(" ","")==""){
				alert("메일을 입력해주세요");
				mbool = false;
				$("#email").focus();
				$("#msend").prop("checked",false);
			}else		mbool=true;
		}
	});
	$("#ssend").change(function() {
		if($("#ssend").prop("checked")){
			if($("#pnumber").val().replace(" ","")==""){
				alert("전화번호를 입력해주세요");
				sbool = false;
				$("#pnumber").focus();
				$("#ssend").prop("checked",false);
			}else		sbool=true;
		}
	});
});
</script>

</body>
</html>