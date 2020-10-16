<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/oj/login.css">

<meta charset="UTF-8">
<title>Insert title here</title>


<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js"
	type="text/javascript"></script>

</head>
<body>
	<section id="menu" class="section">
        <div class="section_container">
    <form action="loginAf.do" name="frmFrom" id="_frmForm" method="post">
        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
        
        <div class="logintext">
        <i class="fas fa-user fa-2x"></i>
        <input type="text" id="_userid" name="id" data-msg="ID를" size="20px" title="아이디" placeholder="ID">
        </div>
        
        <div class="logintext">
        <i class="fas fa-lock fa-2x"></i>
        <input type="password" id="_pwd" name="pwd" data-msg="Password를 " size="20px" title="패스워드"  placeholder="PASSWORD">
        </div>
        
        <div class="">
        <button type="button" class="btnlogin" id="_btnLogin">로그인</button>
        <button type="button" class="btnlogin" id="_btnRegi">회원가입</button>
        </div>
        
    </form>
	</div>
	</section>


	<script type="text/javascript">
		$("#_btnLogin").click(function() {
			//alert("login click");

			if ($("#_userid").val().trim() == "") {
				alert($("#_userid").attr("data-msg") + "입력해 주십시오");
				$("#_userid").focus();
			} else if ($("#_pwd").val().trim() == "") {
				alert("Password를 입력해 주십시오");
				$("#_pwd").focus();
			} else {
				$("#_frmForm").attr({
					"action" : "loginAf.do",
					"target" : "_self"
				}).submit();
			}
		});

		let user_id = $.cookie("user_id");
		if (user_id != null) {
			//alert("쿠키 있음");
			$("#_userid").val(user_id);
			$("#chk_save_id").attr("checked", "checked");
		}

		$("#chk_save_id").click(function() {

			if ($("#chk_save_id").is(":checked")) { // 첵크 되었을 때
				if ($("#_userid").val().trim() == "") {
					alert("id를 입력해 주십시오");
					$("#chk_save_id").prop("checked", false);
				} else {
					$.cookie("user_id", $("#_userid").val(), {
						expires : 356,
						path : '/'
					});
				}
			} else {
				alert("쿠키 삭제");
				$.removeCookie("user_id", {
					path : '/'
				});
			}
		});

		$("#_btnRegi").click(function() {
			location.href = "regi.do";
		});
		
		//카카오 로그인 화면
		(function(){

			const ryan = document.querySelector('#ryan');
			const face = document.querySelectorAll('.ears, .eyes, .muzzle');
			const email = document.querySelector('input[type="text"]');
			const password = document.querySelector('input[type="password"]');
			const fauxInput = document.createElement('div');
			const span = document.createElement('span');
			let timer = null;

			function rotate3d(x, y, z, rad) {
			    const value = `rotate3d(${'${x}'}, ${'${y}'}, ${'${z}'}, ${'${rad}'}rad)`;
			    for (let i=0; i < face.length; i++) {
			        face[i].style.transform = value;
			    }
			}

			function focus(event) {
			    event.target.classList.add('focused');
			    copyStyles(event.target);
			    event.target.type === 'password' ? lookAway(event) : look(event);
			}

			function reset(event) {
			    event.target.classList.remove('focused');
			    ryan.classList.remove('playing');

			    clearTimeout(timer);
			    timer = setTimeout( () => {
			        ryan.classList.remove('look-away', 'down', 'up');
			        rotate3d(0,0,0,0);
			    }, 1 );
			}

			function copyStyles(el) {
			    const props = window.getComputedStyle(el, null);

			    if ( fauxInput.parentNode === document.body ) {
			        document.body.removeChild(fauxInput);
			    }

			    fauxInput.style.visibility = 'hidden';
			    fauxInput.style.position = 'absolute';
			    fauxInput.style.top = Math.min(el.offsetHeight * -2, -999) + 'px';

			    for(let i=0; i < props.length; i++) {
			        if (['visibility','display','opacity','position','top','left','right','bottom'].indexOf(props[i]) !== -1) {
			            continue;
			        }
			        fauxInput.style[props[i]] = props.getPropertyValue(props[i]);
			    }

			    document.body.appendChild(fauxInput);
			}

			function look(event) {
			    const el = event.target;
			    const text = el.value.substr(0, el.selectionStart);

			    span.innerText = text || '.';

			    const ryanRect = ryan.getBoundingClientRect();
			    const inputRect = el.getBoundingClientRect();
			    const caretRect = span.getBoundingClientRect();
			    const caretPos = caretRect.left + Math.min(caretRect.width, inputRect.width) * !!text;
			    const distCaret = ryanRect.left + ryanRect.width/2 - inputRect.left - caretPos;
			    const distInput = ryanRect.top + ryanRect.height/2 - inputRect.top;
			    const y = Math.atan2(-distCaret, Math.abs(distInput)*3);
			    const x =  Math.atan2(distInput, Math.abs(distInput)*3 / Math.cos(y));
			    const angle = Math.max(Math.abs(x), Math.abs(y));

			    rotate3d(x/angle, y/angle, y/angle/2, angle);
			}

			function lookAway(event) {
			    const el = event.target;
			    const ryanRect = ryan.getBoundingClientRect();
			    const inputRect = el.getBoundingClientRect();
			    const distInput = ryanRect.top + ryanRect.height/2 - inputRect.top;

			    ryan.classList.add( 'look-away', distInput < 0 ? 'up' : 'down' );

			    clearTimeout(timer);
			    timer = setTimeout( () => {
			        ryan.classList.add( 'playing' );
			    }, 300);
			}

			fauxInput.appendChild(span);

			email.addEventListener( 'focus', focus, false );
			email.addEventListener( 'keyup', look, false );
			email.addEventListener( 'click', look, false );
			email.addEventListener( 'blur', reset, false );

			password.addEventListener( 'focus', lookAway, false );
			password.addEventListener( 'blur', reset, false );

			})();		
		
		
	</script>


</body>
</html>





