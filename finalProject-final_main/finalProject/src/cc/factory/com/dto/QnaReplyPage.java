package cc.factory.com.dto;

import java.io.Serializable;

public class QnaReplyPage implements Serializable {

	private int qnaseq;
	
	private int pageNumber = 0;	// 현재 페이지
	private int recordCountPerPage = 10;	// 표현할 페이지의 글수
	
	private int start = 1;
	private int end = 10;
	
	public QnaReplyPage() {
	}

	public QnaReplyPage(int qnaseq, int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.qnaseq = qnaseq;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	public int getQnaseq() {
		return qnaseq;
	}

	public void setQnaseq(int qnaseq) {
		this.qnaseq = qnaseq;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
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

	@Override
	public String toString() {
		return "QnaReplyPage [qnaseq=" + qnaseq + ", pageNumber=" + pageNumber + ", recordCountPerPage="
				+ recordCountPerPage + ", start=" + start + ", end=" + end + "]";
	}

	
}
