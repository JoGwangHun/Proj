package com.proj.thing.vo;

import java.util.Date;

public class ThingVO {
	private int thingId;
	private String thingImage;
	private String thingName;
	private String thingPrice;
	private Date thingEnDate;
	private String thingDesc;

	public int getThingId() {
		return thingId;
	}

	public void setThingId(int thingId) {
		this.thingId = thingId;
	}

	public String getThingImage() {
		return thingImage;
	}

	public void setThingImage(String thingImage) {
		this.thingImage = thingImage;
	}

	public String getThingName() {
		return thingName;
	}

	public void setThingName(String thingName) {
		this.thingName = thingName;
	}

	public String getThingPrice() {
		return thingPrice;
	}

	public void setThingPrice(String thingPrice) {
		this.thingPrice = thingPrice;
	}

	public Date getThingEnDate() {
		return thingEnDate;
	}

	public void setThingEnDate(Date thingEnDate) {
		this.thingEnDate = thingEnDate;
	}

	public String getThingDesc() {
		return thingDesc;
	}

	public void setThingDesc(String thingDesc) {
		this.thingDesc = thingDesc;
	}
}
