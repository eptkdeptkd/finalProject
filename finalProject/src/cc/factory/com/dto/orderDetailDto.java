package cc.factory.com.dto;

import java.io.Serializable;

public class orderDetailDto implements Serializable {
	private int seq;
	private int order_seq;
	private String coffee_name;
	private int shot;
	private String syrup;
	private String ask;
	
	public orderDetailDto() {
		super();
	}

	public orderDetailDto(int seq, int order_seq, String coffee_name, int shot, String syrup, String ask) {
		super();
		this.seq = seq;
		this.order_seq = order_seq;
		this.coffee_name = coffee_name;
		this.shot = shot;
		this.syrup = syrup;
		this.ask = ask;
	}

	public orderDetailDto(String coffee_name, int shot, String syrup, String ask) {
		super();
		this.coffee_name = coffee_name;
		this.shot = shot;
		this.syrup = syrup;
		this.ask = ask;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getOrder_seq() {
		return order_seq;
	}

	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}

	public String getCoffee_name() {
		return coffee_name;
	}

	public void setCoffee_name(String coffee_name) {
		this.coffee_name = coffee_name;
	}

	public int getShot() {
		return shot;
	}

	public void setShot(int shot) {
		this.shot = shot;
	}

	public String getSyrup() {
		return syrup;
	}

	public void setSyrup(String syrup) {
		this.syrup = syrup;
	}

	public String getAsk() {
		return ask;
	}

	public void setAsk(String ask) {
		this.ask = ask;
	}

	@Override
	public String toString() {
		return "orderDetailDto [seq=" + seq + ", order_seq=" + order_seq + ", coffee_name=" + coffee_name + ", shot="
				+ shot + ", syrup=" + syrup + ", ask=" + ask + "]";
	}
	
	
	
}
