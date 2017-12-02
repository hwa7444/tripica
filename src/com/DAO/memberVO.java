package com.DAO;

public class memberVO {
	int userid;
	String id;
	String pw;
	String nick;
	int gender;

	String ph;
	String birth;

	public memberVO(String id, String pw, String nick, int gender, String ph, String birth) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.gender = gender;
		this.ph = ph;
		this.birth = birth;
	}

	public memberVO(int userid, String id, String pw, String nick, int gender, String ph, String birth) {
		super();
		this.userid = userid;
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.gender = gender;
		this.ph = ph;
		this.birth = birth;
	}

	public memberVO(String id) {
		super();
		this.id = id;
	}

	public int getUserid() {
		return userid;
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

	public String getPh() {
		return ph;
	}

	public String getBirth() {
		return birth;
	}

}
