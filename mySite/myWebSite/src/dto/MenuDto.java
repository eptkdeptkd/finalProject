package dto;

import java.io.Serializable;

public class MenuDto implements Serializable {
	private int seq;
	private String name;
	private String id;
	private int ordernum;
	
	public MenuDto() {
	}
	
	public MenuDto(String name,int ordernum,int seq) {
		this.name = name;
		this.ordernum = ordernum;
		this.seq = seq;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}

	@Override
	public String toString() {
		return "MenuDto [name=" + name + ", id=" + id + ", ordernum=" + ordernum + "]";
	}
	
}
