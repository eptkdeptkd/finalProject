package cc.factory.com.dto;

import java.io.Serializable;
import java.util.Date;

/*
DROP TABLE CC_POLL
CASCADE CONSTRAINTS;

DROP SEQUENCE CC_POLL_SEQ;

CREATE TABLE CC_POLL(
	POLLID NUMBER NOT NULL,
	ID VARCHAR2(50) NOT NULL,
	QUESTION VARCHAR2(1000) NOT NULL,
	SDATE DATE NOT NULL,
	EDATE DATE NOT NULL,
	ITEMCOUNT NUMBER NOT NULL,
	POLLTOTAL NUMBER NOT NULL,
	REGDATE DATE NOT NULL,
	CONSTRAINT CC_POLL_PK PRIMARY KEY(POLLID)
);

CREATE SEQUENCE CC_POLL_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE CC_POLL ADD CONSTRAINT CC_POLL_FK
FOREIGN KEY(ID)
REFERENCES CC_MEMBER(ID);
*/

// 투표 질의 
public class PollDto implements Serializable {
	private int pollid;			// squence 투표번호
	private String id;			// 투표 만든 사람 -> admin
	private String question;	// 투표 질의 -> 좋아하는 과일은?
	private Date sdate;			// 투표 시작일
	private Date edate;			// 투표 종료일
	private Date regdate;		// 투표 만든 날	
	
	private int itemcount;		// 보기수 -> 2 ~ 10
	private int polltotal;		// 이 항목에 투표한 사람 수	
	
	private boolean vote;		// 투표를 했는지? 안했는지

	public PollDto() {
	}
		
	public PollDto(int pollid, String id, String question, Date sdate, Date edate, Date regdate, int itemcount,
			int polltotal, boolean vote) {
		super();
		this.pollid = pollid;
		this.id = id;
		this.question = question;
		this.sdate = sdate;
		this.edate = edate;
		this.regdate = regdate;
		this.itemcount = itemcount;
		this.polltotal = polltotal;
		this.vote = vote;
	}
	
	public PollDto(String id, String question, Date sdate, Date edate, int itemcount, int polltotal) {
		super();
		this.id = id;
		this.question = question;
		this.sdate = sdate;
		this.edate = edate;
		this.itemcount = itemcount;
		this.polltotal = polltotal;
	}

	public int getPollid() {
		return pollid;
	}

	public void setPollid(int pollid) {
		this.pollid = pollid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getItemcount() {
		return itemcount;
	}

	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}

	public int getPolltotal() {
		return polltotal;
	}

	public void setPolltotal(int polltotal) {
		this.polltotal = polltotal;
	}

	public boolean isVote() {
		return vote;
	}

	public void setVote(boolean vote) {
		this.vote = vote;
	}

	@Override
	public String toString() {
		return "PollDto [pollid=" + pollid + ", id=" + id + ", question=" + question + ", sdate=" + sdate + ", edate="
				+ edate + ", regdate=" + regdate + ", itemcount=" + itemcount + ", polltotal=" + polltotal + ", vote="
				+ vote + "]";
	}
	
	
}
