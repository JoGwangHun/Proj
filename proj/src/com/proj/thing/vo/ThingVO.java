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
	private String thingImageDetail; // 상세설명이미지
	private String thingImageDetail2; // 상세설명이미지
	private int price1;
	private int price2;
	private int price3;
	private int price4;

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

	public int getPrice1() {
		return price1;
	}

	public void setPrice1(int price1) {
		this.price1 = price1;
	}

	public int getPrice2() {
		return price2;
	}

	public void setPrice2(int price2) {
		this.price2 = price2;
	}

	public int getPrice3() {
		return price3;
	}

	public void setPrice3(int price3) {
		this.price3 = price3;
	}

	public int getPrice4() {
		return price4;
	}

	public void setPrice4(int price4) {
		this.price4 = price4;
	}

	public void setThingEnDate(String thingEnDate) {
		this.thingEnDate = thingEnDate;
	}

	public String getThingImageDetail() {
		return thingImageDetail;
	}

	public void setThingImageDetail(String thingImageDetail) {
		this.thingImageDetail = thingImageDetail;
	}

	public String getThingImageDetail2() {
		return thingImageDetail2;
	}

	public void setThingImageDetail2(String thingImageDetail2) {
		this.thingImageDetail2 = thingImageDetail2;
	}
}
