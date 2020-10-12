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
      <a href="main.do"><img src="imgs/logo.png" alt="logo" /></a>
    </div>
    <ul class="navbar_menu">
      <li class="navbar_menu_item">
      	<a href="coffeeMain.do">Menu</a>
      </li>
      <li class="navbar_menu_item">
      <a href="coffeeAddMove.do">커피추가 About</a>
      </li>
       <li class="navbar_menu_item">
      <a href="coffeeDelMove.do">커피삭제 About</a>
      </li>
      <li class="navbar_menu_item">
      <a href="orderhandleMove.do">커피주문처리  What's New</a>
      </li>
      <li class="navbar_menu_item">
      	<a href="cartMove.do">장바구니</a>
      </li>
      
      <li class="navbar_menu_item">
      	<a href="addSide.do">사이드추가</a>
      </li>
      
      <li class="navbar_menu_item">
      	<a href="sideList.do">사이드삭제</a>
      </li>
      <li class="navbar_menu_item">
      	<a href="calendar.do">달력</a>
      </li>
      
      <li class="navbar_menu_item">
      	<a href="qna.do">qna 게시판</a>
      </li>
      
      <li class="navbar_menu_item">
      	<a href="pslist.do">후기 게시판</a>
      </li>
      
      <c:if test="${empty login }">
      	<li class="navbar_menu_item">
      		<a href="login.do"> Sign In</a>
     	 </li>
      </c:if>
      <c:if test="${not empty login }">
	      <li class="navbar_menu_item">
	      	<a href="mypage.do">마이페이지</a>
	      </li>
	      <li class="navbar_menu_item">
			<a href="sessionOut.do">Sign Out</a>
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
	}

	function disconnect(){
		wsocket.close();
	}

	function onOpen(evt){ // 연결 되었을 때 
	}

	function onClose(){ // 끊겼을 때 
	}

	function onMessage(evt){ // 실제 메세지가 수신(recv)
		var data = evt.data;
		alert(data);
	}

    </script>











