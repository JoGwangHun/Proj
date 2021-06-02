package com.proj.thing.vo;

public class CartVO {
	private String user_id;
	private int thing_id;
	private int count;
	private String thing_name;
	private int price;
	private int totalPrice;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getThing_id() {
		return thing_id;
	}

	public void setThing_id(int thing_id) {
		this.thing_id = thing_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getThing_name() {
		return thing_name;
	}

	public void setThing_name(String thing_name) {
		this.thing_name = thing_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
}
