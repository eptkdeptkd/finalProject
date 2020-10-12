package cc.factory.com.dto;

import java.io.Serializable;
/*
DROP TABLE CC_POLLSUB
CASCADE CONSTRAINTS;

DROP SEQUENCE CC_POLLSUB_SEQ;

CREATE TABLE CC_POLLSUB(
	POLLSUBID NUMBER NOT NULL,
	POLLID NUMBER NOT NULL,
	ANSWER VARCHAR2(1000) NOT NULL,
	ACOUNT NUMBER NOT NULL,
	CONSTRAINT CC_POLLSUB_PK PRIMARY KEY(POLLSUBID)
);

CREATE SEQUENCE CC_POLLSUB_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE CC_POLLSUB ADD CONSTRAINT CC_POLLSUB_FK
FOREIGN KEY(POLLID)
REFERENCES CC_POLL(POLLID);
*/
// 투표 보기들
public class PollSubDto implements Serializable {

	private int pollsubid;	// sequence 
	private int pollid;		// 질문번호 <- 외래키
	private String answer;	// 보기명 <- 사과, 배, 바나나
	
	private int acount;		// 이 보기를 선택한 사람수	
	
	public PollSubDto() {
	}

	public PollSubDto(int pollsubid, int pollid, String answer, int acount) {
		super();
		this.pollsubid = pollsubid;
		this.pollid = pollid;
		this.answer = answer;
		this.acount = acount;
	}

	public int getPollsubid() {
		return pollsubid;
	}

	public void setPollsubid(int pollsubid) {
		this.pollsubid = pollsubid;
	}

	public int getPollid() {
		return pollid;
	}

	public void setPollid(int pollid) {
		this.pollid = pollid;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getAcount() {
		return acount;
	}

	public void setAcount(int acount) {
		this.acount = acount;
	}

	@Override
	public String toString() {
		return "PollSubDto [pollsubid=" + pollsubid + ", pollid=" + pollid + ", answer=" + answer + ", acount=" + acount
				+ "]";
	}
	
}
