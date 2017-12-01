package com.DAO;

public class tourVO {
	int num;
	String name, type, address, comment, img;

	public int getNum() {
		return num;
	}

	public String getName() {
		return name;
	}

	public String getType() {
		return type;
	}

	public tourVO(int num, String name, String type, String comment, String img) {
		super();
		this.num = num;
		this.name = name;
		this.type = type;
		this.comment = comment;
		this.img = img;
	}

	public String getAddress() {
		return address;
	}

	public String getComment() {
		return comment;
	}

	public String getImg() {
		return img;
	}

	public tourVO(int num, String name, String type, String address, String comment, String img) {
		super();
		this.num = num;
		this.name = name;
		this.type = type;
		this.address = address;
		this.comment = comment;
		this.img = img;
	}

	public tourVO(String name, String type, String comment, String img) {
		super();
		this.name = name;
		this.type = type;
		this.comment = comment;
		this.img = img;
	}

	

	

	
}
