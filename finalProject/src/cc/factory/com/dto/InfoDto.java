package cc.factory.com.dto;

import java.io.Serializable;
/*
DROP TABLE CC_INFO
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CC_INFO;

CREATE TABLE CC_INFO(
	SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(50) NOT NULL,
	
	REF NUMBER(8) NOT NULL,
	STEP NUMBER(8) NOT NULL,
	DEPTH NUMBER(8) NOT NULL,
	
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	WDATE DATE NOT NULL,
	
	DEL NUMBER(1) NOT NULL,
	READCOUNT NUMBER(8) NOT NULL
);

CREATE SEQUENCE SEQ_CC_INFO
START WITH 1
INCREMENT BY 1;

ALTER TABLE CC_INFO
ADD CONSTRAINT FK_CC_INFO_ID FOREIGN KEY(ID)
REFERENCES CC_MEMBER(ID);

alter table CC_INFO add FILENAME VARCHAR2(50)
alter table CC_INFO add OLDFILENAME VARCHAR2(50)

*/
// BBS: Bulletin Board System (게시판)
public class InfoDto implements Serializable {

	private int seq;		// sequence
	private String id;		// 작성자
	
	private int ref;		// 그룹번호
	private int step;		// 행(row)번호
	private int depth;		// 깊이
	
	private String title;	// 제목
	private String content;	// 내용
	private String wdate;	// 작성일
	
	private int del;		// 삭제
	private int readcount;	// 조회수
	
	private String filename;	
	private String oldfilename;
	
	
	public InfoDto() {
	}

	public InfoDto(String id, String title, String content, String filename, String oldfilename) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.oldfilename = oldfilename;
	}

	public InfoDto(int seq, String id, int ref, int step, int depth, String title, String content, String wdate,
			int del, int readcount, String filename, String oldfilename) {
		super();
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
		this.filename = filename;
		this.oldfilename = oldfilename;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
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

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getOldfilename() {
		return oldfilename;
	}

	public void setOldfilename(String oldfilename) {
		this.oldfilename = oldfilename;
	}

	@Override
	public String toString() {
		return "InfoDto [seq=" + seq + ", id=" + id + ", ref=" + ref + ", step=" + step + ", depth=" + depth
				+ ", title=" + title + ", content=" + content + ", wdate=" + wdate + ", del=" + del + ", readcount="
				+ readcount + ", filename=" + filename + ", oldfilename=" + oldfilename + "]";
	}

}





