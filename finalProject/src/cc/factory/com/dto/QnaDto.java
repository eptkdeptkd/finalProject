package cc.factory.com.dto;

public class QnaDto {
	
	private int seq;		// sequence
	private String id;		// 작성자
	
	private String title;	// 제목
	private String content;	// 내용
	
	private int secret;
	private int readcount;	// 조회수
	private String wdate;	// 작성일
	
	public QnaDto() {
		
	}

	public QnaDto(int seq, String id, String title, String content, int secret, int readcount, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.secret = secret;
		this.readcount = readcount;
		this.wdate = wdate;
	}

	public QnaDto(String title, String content, int secret) {
		super();
		this.title = title;
		this.content = content;
		this.secret = secret;
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

	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "QnaDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", secret=" + secret
				+ ", readcount=" + readcount + ", wdate=" + wdate + "]";
	}
	
}
