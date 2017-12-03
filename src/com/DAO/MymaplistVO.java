package com.DAO;

public class MymaplistVO {

	int num;
	String pgroup;
	String nick;
	int recom;
	String day;
	
	
	public MymaplistVO(int num, String pgroup, String nick, int recom, String day) {
		this.num = num;
		this.pgroup = pgroup;
		this.nick = nick;
		this.recom = recom;
		this.day = day;
	}


	public int getNum() {
		return num;
	}


	public String getPgroup() {
		return pgroup;
	}


	public String getNick() {
		return nick;
	}


	public int getRecom() {
		return recom;
	}


	public String getDay() {
		return day;
	}
	
	
	
}
