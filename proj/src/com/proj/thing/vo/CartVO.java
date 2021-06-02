package com.proj.thing.vo;

public class CartVO {
	private String user_id;
	private int thing_id;
	private int count;

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
}
