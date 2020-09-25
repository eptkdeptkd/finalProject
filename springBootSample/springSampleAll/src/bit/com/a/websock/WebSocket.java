package bit.com.a.websock;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

// web socket server
public class WebSocket extends TextWebSocketHandler {
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	public WebSocket() {
		System.out.println("EchoHandler 생성됨 " + new Date());
	}

	@Override	// accept
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 연결된 후에 실행		
		System.out.println("연결됨 " + session.getId() + " " + new Date());
		users.put(session.getId(), session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결 종료
		System.out.println("연결종료 " + session.getId());
		users.remove(session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 메시지 수신
		
		System.out.println("메시지수신:" + message.getPayload() + " " + new Date());
		
		// 송신(send)
		for (WebSocketSession s : users.values()) {
			s.sendMessage(message);			
		}
		
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// 예외 발생
		System.out.println(session.getId() + " Exception 발생 " + new Date());
	}
	
	
}









