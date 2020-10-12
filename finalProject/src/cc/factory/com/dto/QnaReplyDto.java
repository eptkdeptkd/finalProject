package cc.factory.com.dto;

/*
drop table CC_QNA_RE
cascade constraints;

drop sequence seq_qna_re;

CREATE TABLE CC_QNA_RE (
    seq	number(8) primary key,
    qnaseq	number(8),
    id	varchar2(200),
    content	varchar2(4000) not null,
    wdate date
);

alter table cc_qna_re
add constraint fk_qna_re_id
foreign key (id) references cc_member(id);

alter table cc_qna_re
add constraint fk_qna_re_seq
foreign key (qnaseq) references cc_qna(seq);

create sequence seq_qna_re
start with 1
increment by 1;
 */
public class QnaReplyDto {

	private int seq;		//리플 시퀀스
	private int qnaseq;		//qna와 연계된 시퀀스
	private String id;		//아이디..
	private String content;	//내용
	private String wdate;	//작성시간
	
	public QnaReplyDto() {
		
	}
	
	public QnaReplyDto(int seq, int qnaseq, String id, String content, String wdate) {
		super();
		this.seq = seq;
		this.qnaseq = qnaseq;
		this.id = id;
		this.content = content;
		this.wdate = wdate;
	}
	
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getQnaseq() {
		return qnaseq;
	}

	public void setQnaseq(int qnaseq) {
		this.qnaseq = qnaseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "QnaReplyDto [seq=" + seq + ", qnaseq=" + qnaseq + ", id=" + id + ", content=" + content + ", wdate="
				+ wdate + "]";
	}
	
	
}
