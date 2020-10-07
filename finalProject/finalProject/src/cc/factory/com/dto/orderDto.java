package cc.factory.com.dto;

import java.io.Serializable;
import java.util.Map;

public class orderDto implements Serializable {
	private int seq;
	private String id;
	private String name;
	private String price;
	private String odate;
	private String coffee_seq;	
	private String detail;
	
	private String seqArr;
	
	public orderDto() {
	}


	public orderDto(int seq, String id, String name, String price, String odate) {
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.price = price;
		this.odate = odate;
	}
	
	public orderDto(int seq, String id, String name, String price, String odate, String coffee_seq, String detail) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.price = price;
		this.odate = odate;
		this.coffee_seq = coffee_seq;
		this.detail = detail;
	}


	public orderDto(int seq, String id, String name, String price, String odate, String coffee_seq, String detail,
			String seqArr) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.price = price;
		this.odate = odate;
		this.coffee_seq = coffee_seq;
		this.detail = detail;
		this.seqArr = seqArr;
	}


	public orderDto(int seq, String id, String name, String price, String odate, String coffee_seq) {
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.price = price;
		this.odate = odate;
		this.coffee_seq = coffee_seq;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String getCoffee_seq() {
		return coffee_seq;
	}

	public void setCoffee_seq(String coffee_seq) {
		this.coffee_seq = coffee_seq;
	}

	public String getDetail() {
		return detail;
	}


	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getSeqArr() {
		return seqArr;
	}


	public void setSeqArr(String seqArr) {
		this.seqArr = seqArr;
	}
	
	@Override
	public String toString() {
		return "orderDto [seq=" + seq + ", id=" + id + ", name=" + name + ", price=" + price + ", odate=" + odate
				+ ", coffee_seq=" + coffee_seq + ", detail=" + detail + "]";
	}


}
