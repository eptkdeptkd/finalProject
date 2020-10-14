package cc.factory.com.dto;

import java.io.Serializable;
/*

DROP TABLE CC_CALENDAR
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CALENDAR;

CREATE TABLE CC_CALENDAR(
	SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(50) NOT NULL,
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	STARTDATE VARCHAR2(19) NOT NULL,
	WDATE DATE NOT NULL	
);

CREATE SEQUENCE SEQ_CALENDAR
START WITH 1
INCREMENT BY 1;

ALTER TABLE CC_CALENDAR
ADD CONSTRAINT FK_CAL_ID FOREIGN KEY(ID)
REFERENCES CC_MEMBER(ID);
 */
public class CalendarDto implements Serializable {

	private int seq;
	private String id;
	private String title;
	private String content;
	private String startdate;
	private String wdate;	// 작성일		  20/07/31()	
	
	public CalendarDto() {
		// TODO Auto-generated constructor stub
	}

	public CalendarDto(int seq, String id, String title, String content, String startdate, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.startdate = startdate;
		this.wdate = wdate;
	}

	public CalendarDto(String id, String title, String content, String startdate) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.startdate = startdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "CalendarDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", startdate="
				+ startdate + ", wdate=" + wdate + "]";
	}




}