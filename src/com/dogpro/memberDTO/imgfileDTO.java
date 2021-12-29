package com.dogpro.memberDTO;

public class imgfileDTO {
	
	private int num;
    private String author;
    private String title;
    private String file;
    private String day;
	public imgfileDTO(int num, String author, String title, String file, String day) {
		super();
		this.num = num;
		this.author = author;
		this.title = title;
		this.file = file;
		this.day = day;
	}
	public int getNum() {
		return num;
	}
	public String getAuthor() {
		return author;
	}
	public String getTitle() {
		return title;
	}
	public String getFile() {
		return file;
	}
	public String getDay() {
		return day;
	}
	
    
    
}
