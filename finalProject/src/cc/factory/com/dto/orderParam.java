package cc.factory.com.dto;

import java.io.Serializable;

public class orderParam implements Serializable {
	private String id;
	private int seq;
	private String today;
	private int readPerPage = 5;
	private int pageNumber = 0;
	private int start;
	private int end;
	private String content;
	
	public orderParam() {
	}

	public orderParam(String id, int seq, String content) {
		this.id = id;
		this.seq = seq;
		this.content = content;
	}


	public orderParam(String id, int seq, String today, int readPerPage, int pageNumber, int start, int end,
			String content) {
		this.id = id;
		this.seq = seq;
		this.today = today;
		this.readPerPage = readPerPage;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public int getReadPerPage() {
		return readPerPage;
	}

	public void setReadPerPage(int readPerPage) {
		this.readPerPage = readPerPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "orderParam [id=" + id + ", seq=" + seq + ", today=" + today + ", readPerPage=" + readPerPage
				+ ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + ", content=" + content + "]";
	}

}
