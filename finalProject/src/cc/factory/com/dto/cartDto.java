package cc.factory.com.dto;

import java.io.Serializable;

public class cartDto implements Serializable {

		private int seq;
		private String id;
		private int coffee_seq;
		private String name;
		private String price;
		private int qty;
		
		public cartDto() {
		}
		
		public cartDto(int seq, String id, int coffee_seq, String name, String price, int qty) {
			super();
			this.seq = seq;
			this.id = id;
			this.coffee_seq = coffee_seq;
			this.name = name;
			this.price = price;
			this.qty = qty;
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

		public int getCoffee_seq() {
			return coffee_seq;
		}

		public void setCoffee_seq(int coffee_seq) {
			this.coffee_seq = coffee_seq;
		}

		public String getPrice() {
			return price;
		}

		public void setPrice(String price) {
			this.price = price;
		}

		public String getName() {
			return name;
		}


		public void setName(String name) {
			this.name = name;
		}


		public int getQty() {
			return qty;
		}

		public void setQty(int qty) {
			this.qty = qty;
		}

		@Override
		public String toString() {
			return "cartDto [seq=" + seq + ", id=" + id + ", coffee_seq=" + coffee_seq + ", name=" + name + ", price="
					+ price + ", qty=" + qty + "]";
		}


}
