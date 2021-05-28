package com.proj.thing.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ThingVO {
	private int thingId; // 물건 고유번호
	private String thingImage; // 물건 사진
	private String thingName; // 물건 이름
	private int thingPrice; // 물건 가격
	private String thingEnDate; // 물건 올린 날짜
	private String thingDesc; // 물건 설명
	private String thingKind; // 물건 종류

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

	public int getThingPrice() {
		return thingPrice;
	}

	public void setThingPrice(int thingPrice) {
		this.thingPrice = thingPrice;
	}

	public String getThingEnDate() {
		return thingEnDate;
	}

	public void setThingEnDate(Date thingEnDate) {
		SimpleDateFormat formatType = new SimpleDateFormat("yy.MM.dd");
		
		this.thingEnDate = formatType.format(thingEnDate);
	}

	public String getThingDesc() {
		return thingDesc;
	}

	public void setThingDesc(String thingDesc) {
		this.thingDesc = thingDesc;
	}

	public String getThingKind() {
		return thingKind;
	}

	public void setThingKind(String thingKind) {
		this.thingKind = thingKind;
	}
}
