package com.DAO;

public class bulletinVO {

	
	private int num;
	private String title;
	private String nick;
	private String fileName;
	private String content;
	private String writeDay;
	private int checkD;
	
	public bulletinVO(int num, String title, String nick, String fileName, String content, String writeDay,
			int checkD) {
		super();
		this.num = num;
		this.title = title;
		this.nick = nick;
		this.fileName = fileName;
		this.content = content;
		this.writeDay = writeDay;
		this.checkD = checkD;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteDay() {
		return writeDay;
	}

	public void setWriteDay(String writeDay) {
		this.writeDay = writeDay;
	}

	public int getCheckD() {
		return checkD;
	}

	public void setCheckD(int checkD) {
		this.checkD = checkD;
	}
	
	
	
}
