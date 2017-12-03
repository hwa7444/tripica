package com.DAO;

public class realVO {
	String pname;
	String pcontent;
    String plat;
    String plng;
	String pimg;
	public realVO(String pname, String pcontent, String plat, String plng, String pimg) {
		this.pname = pname;
		this.pcontent = pcontent;
		this.plat = plat;
		this.plng = plng;
		this.pimg = pimg;
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
	public String getPimg() {
		return pimg;
	}
	
	
}
