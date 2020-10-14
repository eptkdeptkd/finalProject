package cc.factory.com.dto;

import java.io.Serializable;

public class alarmDto implements Serializable {
	private int seq;
	private String recv_id;
	private String send_id;
	private String content;
	
	public alarmDto() {
	}
	
	public alarmDto(String recv_id, String send_id, String content) {
		this.recv_id = recv_id;
		this.send_id = send_id;
		this.content = content;
	}


	public alarmDto(int seq, String recv_id, String send_id, String content) {
		this.seq = seq;
		this.recv_id = recv_id;
		this.send_id = send_id;
		this.content = content;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getRecv_id() {
		return recv_id;
	}

	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}

	public String getSend_id() {
		return send_id;
	}

	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "alarmDto [seq=" + seq + ", recv_id=" + recv_id + ", send_id=" + send_id + ", content=" + content + "]";
	}
	
}
