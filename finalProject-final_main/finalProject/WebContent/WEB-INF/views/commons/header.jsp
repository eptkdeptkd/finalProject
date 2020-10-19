<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>    

<div id="test" style="background-color:grey; color: black;">

  <!--Header-->
  <nav id="navbar">
    <div class="navbar_logo">
      <a href="main.do"><img src="image/logo.png" alt="logo" /></a>
    </div>
    <ul class="navbar_menu">
      <li class="navbar_menu_item">
      	<a href="coffeeMain.do">Menu</a>
      </li>
      
      <li class="navbar_menu_item">
	      <a href="#">게시판</a>
	      	<ul class="navbar_sub_menu">
	      		<li><a href="infoimage.do">공지사항</a></li>
	      		<li><a href="qna.do">Q&A 게시판</a></li>
	      		<li><a href="pslist.do">후기 게시판</a></li>
	      	</ul>
	  </li>
      
      <li class="navbar_menu_item">
	      <a href="#">이벤트</a>
	      	<ul class="navbar_sub_menu">
	      		<li><a href="polllist.do">설문조사</a></li>
	      		<li><a href="calendar.do">이벤트 일정</a></li>
	      		<li><a href="ranking.do">랭킹</a></li>
	      	</ul>
	  </li>

      <c:if test="${empty login }">
      	<li class="navbar_menu_item">
      		<a href="login.do"> Sign In</a>
     	 </li>
      </c:if>
      <c:if test="${not empty login }">
      	<c:if test="${login.auth ==3 }">
	      <li class="navbar_menu_item">
	      <a href="#">MY PAGE</a>
	      	<ul class="navbar_sub_menu">
	      		<li><a href="mypage.do">마이페이지</a></li>
	      		<li><a href="cartMove.do">장바구니</a></li>
	      	</ul>
	      </li>
	     </c:if>
	     <c:if test="${login.auth ==1 }">
	      <li class="navbar_menu_item">
	      	<a href="adminlink.do">관리자페이지</a>
	      </li>
	     </c:if>
	      <li class="navbar_menu_item">
			<a onclick="logOut()">Sign Out</a>
		  </li>
      </c:if>
      
    </ul>
    <!-- Toggle button -->
    <button class="navbar_toggle-btn">
      <i class="fas fa-bars"></i>
    </button>
  </nav>
  

</div>

<script type="text/javascript">
	var wsocket;

	function connect(){

		if(wsocket != undefined && wsocket.readyState != WebSocket.CLOSED ){
			return ;
		}

		// web socket 생성 ---------------------
		wsocket = new WebSocket("ws://192.168.0.195:8090/finalProject/echo.do");

		wsocket.onopen = onOpen; // 함수명을 넣어줘서 초기화
		wsocket.onmessage = onMessage;
		wsocket.close = onClose;
		wsocket.onerror = function(err) {
			console.log("Error = " +err);
		};
	}

	function disconnect(){
		wsocket.close();
	}

	function onOpen(evt){ // 연결 되었을 때 
		//console.log("연결");
	}

	function onClose(){ // 끊겼을 때 
		//console.log("연결 끊김");
	}

	function onMessage(evt){ // 실제 메세지가 수신(recv)
		var data = evt.data;
		var index = data.indexOf(":");
		data = data.substr(index+1,data.length);
		swal('알림',data);
	}

	$(document).ready(function(){
		// 추가
		var dto = "${login.id}";
		if(dto!=null || dto.id != ""){
			connect();
		}
	});

	function logOut(){
		disconnect();
		location.href="sessionOut.do";
	}
    </script>











