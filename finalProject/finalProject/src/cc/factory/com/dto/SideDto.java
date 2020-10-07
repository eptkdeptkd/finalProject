package cc.factory.com.dto;

import java.io.Serializable;

public class SideDto implements Serializable {

	private int seq;
	private String name;
	private int price;

	public SideDto() {

	}

	public SideDto(int seq, String name, int price) {
		super();
		this.seq = seq;
		this.name = name;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "SideDto [seq=" + seq + ", name=" + name + ", price=" + price + "]";
	}
	
}
