package com.DAO;

public class memberVO {
	String id;
	String pw;
	String nick;
	int gender;
	int ph;
	String birth;
	public memberVO(String id, String pw, String nick, int gender, int ph, String birth) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.gender = gender;
		this.ph = ph;
		this.birth = birth;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getNick() {
		return nick;
	}
	public int getGender() {
		return gender;
	}
	public int getPh() {
		return ph;
	}
	public String getBirth() {
		return birth;
	}

}
