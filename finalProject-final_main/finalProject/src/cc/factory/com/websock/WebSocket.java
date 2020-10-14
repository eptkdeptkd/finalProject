package cc.factory.com.websock;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import cc.factory.com.dto.alarmDto;
import cc.factory.com.login.MemberDto;
import cc.factory.com.service.adminService;

//@Component 자동생성 
// web socket server 
public class WebSocket extends TextWebSocketHandler{
	
	@Autowired
	adminService service;
	
	//로그인한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	// 1대1
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	public WebSocket() {
		System.out.println("EchoHandler create " + new Date());
	}

	@Override// accept 해당 
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 연결된 후에 실행
		/*
		 	접속이 한번 되면 다시 연결되지 않는다
		 	
		 */
		//System.out.println("연결 됨" + session.getId() ); // websocketsession만 가지고 있는 데이터
		
		String id = getId(session);
		System.out.println("연결 됨" + id );
		users.put(id,session);
	}

	@Override // 연결이 종료 되었을 때 
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결 종료 " + session.getId());
		users.remove(session.getId());
	}

	@Override // 메세지 수신을 해서 다시 보내주는 부분
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+"_ message =  " + message.getPayload());
		/* 모든 사용자에게 보내는 것
		for(WebSocketSession s : users.values()) {
			s.sendMessage(message);
		}
		*/
		
		String msgStr = message.getPayload();
		System.out.println("msgStr " + msgStr);
		
		String[] msg = msgStr.split(",");
		if(msg!=null) {
			String send_id = msg[0];
			String recv_id = msg[1];
			String content = recv_id+"님, 커피를 찾아가주세요";
			alarmDto dto = new alarmDto(recv_id,send_id,content);
			service.addAlarm(dto);
			
			WebSocketSession ms = users.get(recv_id);
			if(ms!=null){
				TextMessage tmp = new TextMessage(send_id+":"+content);
				ms.sendMessage(tmp);
			}
			
		}
		
	}

	@Override // 에러 발생 했을 때 실행되는 부분
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId()+" Exception발생 "+ exception.getMessage());
	}
	
	private String getId(WebSocketSession session) {
		Map<String,Object> httpSession = session.getAttributes();
		MemberDto loginUser = (MemberDto)httpSession.get("login");
		
		if(loginUser==null) return session.getId();
		else return loginUser.getId();
	}
	
}