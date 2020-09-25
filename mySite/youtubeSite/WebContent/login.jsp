<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> <!-- 어떤 기기든지 호환 될 수 있도록  -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 부트 스트랩을 사용하겠다고 명시 -->
<title>Insert title here</title>
<script type="text/javascript" src ="./jquery/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
 	<nav class="navbar navbar-default"> <!-- 하나의 웹사이트에 전반적인 구성을 알려주는 것 -->
 		<div class="navbar-header">
 			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
 			aria-expanded="false">
 			<span class="icon-bar"></span>
 			<span class="icon-bar"></span>
 			<span class="icon-bar"></span>
 			</button>
		<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
 		</div>
 		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
 			<ul class="nav navbar-nav">
 				<li><a href="main.jsp">메인</a></li>
 				<li><a href="bbs.jsp">게시판</a></li>
 			</ul>
 			<ul class="nav navbar-nav navbar-right">
 				<li class="dropdown">
 					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" arai-haspopup="true"
 					aria-expanded="false">접속하기<span class="coret"></span></a>
 				<ul class="dropdown-menu">
 					<li class="active"><a href="login.jsp">로그인</a></li>
 					<li><a href="join.jsp">회원가입</a></li>
 				</ul>
 				</li>	
 			</ul>
 		</div>
 	</nav>
 	<div class="container">
 		<div class="col-lg-4"></div>
 		<div class="col-lg-4">
 			<div class="jumbotron" style="padding-top:20px;">
 				<form method="post" action="loginAction.jsp">
 					<h3 style="text-align:center;">로그인화면</h3>
 					<div class="form-group">
 						<input type="text" class="form-control" placeholder="아이디" name="user-ID" maxlength="20">
 					</div>
 					<div class="form-group">
 						<input type="password" class="form-control" placeholder="비밀번호" name="user-ID" maxlength="20">
 					</div>
 					<input type="submit" class="btn btn-primary form-control" value="로그인">
 				</form>
 			</div>
 		</div>
 	</div>
</body>
</html>