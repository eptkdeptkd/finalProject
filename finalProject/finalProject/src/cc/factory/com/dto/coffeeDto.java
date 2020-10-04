package cc.factory.com.dto;

import java.io.Serializable;

public class coffeeDto implements Serializable {

	private int seq;
	private String name;
	private String originname;
	private String newname;
	private String price;
	
	public coffeeDto() {
	}


	public coffeeDto(int seq, String name, String originname, String newname, String price) {
		this.seq = seq;
		this.name = name;
		this.originname = originname;
		this.newname = newname;
		this.price = price;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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
	
	public String getOriginname() {
		return originname;
	}

	public void setOriginname(String originname) {
		this.originname = originname;
	}

	public String getNewname() {
		return newname;
	}

	public void setNewname(String newname) {
		this.newname = newname;
	}


	@Override
	public String toString() {
		return "coffeeDto [seq=" + seq + ", name=" + name + ", originname=" + originname + ", newname=" + newname
				+ ", price=" + price + "]";
	}
	
}
