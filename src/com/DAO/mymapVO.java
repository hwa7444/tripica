package com.DAO;

public class mymapVO {

	
	String pname;
	String pcontent;
	String plat;
	String plng;
	String pgroup;
	int userid;
	
	public mymapVO() {
	}
	
	public mymapVO(int userid, String pgroup) {
		this.userid = userid;
		this.pgroup = pgroup;
	}

	public mymapVO(String pname, String pcontent, String plat, String plng, String pgroup, int userid) {
		this.pname = pname;
		this.pcontent = pcontent;
		this.plat = plat;
		this.plng = plng;
		this.pgroup = pgroup;
		this.userid = userid;
	}

	public mymapVO(String pname, String pcontent, String plat, String plng, String pgroup) {
		this.pname = pname;
		this.pcontent = pcontent;
		this.plat = plat;
		this.plng = plng;
		this.pgroup = pgroup;
	}

	public String getPname() {
		return pname;
	}

	public String getPcontent() {
		return pcontent;
	}

	public String getPlat() {
		return plat;
	}

	public String getPlng() {
		return plng;
	}

	public String getPgroup() {
		return pgroup;
	}

	public int getUserid() {
		return userid;
	}
	
}
