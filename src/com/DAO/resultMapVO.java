package com.DAO;

public class resultMapVO {
	String tour_name;
	String rate;
	String plat;
	String plong;
	
	public resultMapVO(String tour_name, String rate, String plat, String plong) {
		super();
		this.tour_name = tour_name;
		this.rate = rate;
		this.plat = plat;
		this.plong = plong;
	}

	public String getTour_name() {
		return tour_name;
	}

	public String getRate() {
		return rate;
	}

	public String getPlat() {
		return plat;
	}

	public String getPlong() {
		return plong;
	}
	
}
