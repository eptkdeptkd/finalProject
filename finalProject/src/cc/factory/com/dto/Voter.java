package cc.factory.com.dto;

import java.io.Serializable;
import java.util.Date;
/*
DROP TABLE CC_VOTER
CASCADE CONSTRAINTS;

DROP SEQUENCE CC_VOTER_SEQ;

CREATE TABLE CC_VOTER(
	VOTERID NUMBER NOT NULL,
	POLLID NUMBER NOT NULL,
	POLLSUBID NUMBER NOT NULL,
	ID VARCHAR2(50) NOT NULL,
	REGDATE DATE NOT NULL,
	CONSTRAINT CC_VOTER_PK PRIMARY KEY(VOTERID)
);

CREATE SEQUENCE CC_VOTER_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE CC_VOTER ADD CONSTRAINT CC_VOTER_FK
FOREIGN KEY(POLLID)
REFERENCES CC_POLL(POLLID);

ALTER TABLE CC_VOTER ADD CONSTRAINT CC_VOTER_FK2
FOREIGN KEY(POLLSUBID)
REFERENCES CC_POLLSUB(POLLSUBID);

ALTER TABLE CC_VOTER ADD CONSTRAINT CC_VOTER_FK3
FOREIGN KEY(ID)
REFERENCES CC_MEMBER(ID);
*/
// 투표자
public class Voter implements Serializable {

	private int voterid;	// sequence
	private int pollid;		// 투표 질의 번호		1
	private int pollsubid;	// 보기 번호			2
	private String id;		// 투표한 사람 누구		'aaa'
	private Date regdate;	// 언제
	
	public Voter() {
	}

	public Voter(int voterid, int pollid, int pollsubid, String id, Date regdate) {
		super();
		this.voterid = voterid;
		this.pollid = pollid;
		this.pollsubid = pollsubid;
		this.id = id;
		this.regdate = regdate;
	}

	public Voter(int pollid, int pollsubid, String id) {
		super();
		this.pollid = pollid;
		this.pollsubid = pollsubid;
		this.id = id;
	}

	public int getVoterid() {
		return voterid;
	}

	public void setVoterid(int voterid) {
		this.voterid = voterid;
	}

	public int getPollid() {
		return pollid;
	}

	public void setPollid(int pollid) {
		this.pollid = pollid;
	}

	public int getPollsubid() {
		return pollsubid;
	}

	public void setPollsubid(int pollsubid) {
		this.pollsubid = pollsubid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Voter [voterid=" + voterid + ", pollid=" + pollid + ", pollsubid=" + pollsubid + ", id=" + id
				+ ", regdate=" + regdate + "]";
	}
}
