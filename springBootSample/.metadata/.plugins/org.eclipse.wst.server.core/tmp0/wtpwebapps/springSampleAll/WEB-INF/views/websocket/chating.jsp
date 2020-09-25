<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table class="list_table" style="width: 85%">
<colgroup>
	<col style="width: 200px"><col style="width: 500px">
</colgroup>

<tr>
	<th>채팅명</th>
	<td style="text-align: left">
		<input type="text" id="name">
		<input type="button" id="enterBtn" value="입장" onclick="connect()">
		<input type="button" id="exitBtn" value="나가기" onclick="disconnect()">
	</td>
</tr>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">
		<input type="text" id="id" value="${login.id }">
	</td>
</tr>

<tr>	
	<td colspan="2">
		<textarea rows="10" cols="70" id="charMessageArea"></textarea>
	</td>
</tr>

<tr>
	<td colspan="2">
		<input type="text" id="message" size="50">
		<input type="button" id="sendBtn" value="전송" onclick="send()">
	</td>
</tr>

</table>    

<script type="text/javascript">
var wsocket;

function connect(){

	if(wsocket != undefined && wsocket.readyState != WebSocket.CLOSED){
		// 이미 소켓이 생성된 경우. -> 서버에 접속된 경우
		alert('이미 입장하셨습니다');
		return;
	}

	// Web Socket 생성 --------------
//	if( $("#name").val() == "aaa" ){
//		wsocket = new WebSocket("ws://localhost:8090/springSampleAll/echo.do");
//	}
//	else{
		wsocket = new WebSocket("ws://192.168.0.7:8090/springSampleAll/echo.do");
//	}

	//alert("wsocket:" + wsocket);

	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.close = onClose;	
}

function disconnect(){
	wsocket.close();
	location.href = 'chating.do';
}

function onOpen(evt){	// 연결되었을 때
	appendMessage("연결되었습니다");
}

function onMessage(evt){	// 메시지 수신(recv)
	let data = evt.data;
	if(data.substring(0, 4) == "msg:"){	// msg:안녕하세요
		appendMessage( data.substring(4) );
	}
}

function onClose(evt){	// 끊겼을 때
	appendMessage("연결이 끊겼습니다");
}

function send(){	// 메시지 송신(send)
	let id = $("#name").val();
	let msg = $("#message").val();

	// 실제로 전송되는 부분
	wsocket.send("msg:" + id + ":" + msg);
	$("#message").val("");	
}

function appendMessage( msg ){
	// 메시지를 추가하고 개행
	$("#charMessageArea").append(msg + "\n");

	// 스크롤을 위로 올려준다
	const top = $("#charMessageArea").prop("scrollHeight");
	$("#charMessageArea").scrollTop(top);
}


</script>







