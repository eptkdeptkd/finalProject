package cc.factory.com.dto;

import java.io.Serializable;
/*
drop table CC_INFO_RE
cascade constraints;

drop sequence seq_info_re;

CREATE TABLE CC_INFO_RE (
    seq	number(8) primary key,
    infoseq	number(8),
    id varchar2(200),
    content	varchar2(4000) not null,
    wdate date
);

alter table cc_info_re
add constraint fk_info_re_id
foreign key (id) references cc_member(id);

alter table cc_info_re
add constraint fk_info_re_seq
foreign key (infoseq) references cc_info(seq);

create sequence seq_info_re
start with 1
increment by 1;


alter table cc_info_re add del number(3)


commit
 */
public class InfoReDto implements Serializable {

	private int infoRe_Seq;
	private int info_Seq;
	private String id;
	private String content;
	private String wdate;
	private int del;
	
	public InfoReDto() {
		// TODO Auto-generated constructor stub
	}

	



	public InfoReDto(int info_Seq, String id, String content) {
		super();
		this.info_Seq = info_Seq;
		this.id = id;
		this.content = content;
	}





	public InfoReDto(int infoRe_Seq, int info_Seq, String id, String content, String wdate, int del) {
		super();
		this.infoRe_Seq = infoRe_Seq;
		this.info_Seq = info_Seq;
		this.id = id;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
	}

	public int getInfoRe_Seq() {
		return infoRe_Seq;
	}

	public void setInfoRe_Seq(int infoRe_Seq) {
		this.infoRe_Seq = infoRe_Seq;
	}

	public int getInfo_Seq() {
		return info_Seq;
	}

	public void setInfo_Seq(int info_Seq) {
		this.info_Seq = info_Seq;
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

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "infoReDto [infoRe_Seq=" + infoRe_Seq + ", info_Seq=" + info_Seq + ", id=" + id + ", content=" + content
				+ ", wdate=" + wdate + ", del=" + del + "]";
	}

	

}
