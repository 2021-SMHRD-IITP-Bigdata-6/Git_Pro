package com.dogpro.memberDTO;

public class imgfileDTO {
	
	private int num;
    private String author;
    private String title;
    private String file;
    private String day;
	public imgfileDTO(int num, String file, String day) {
		super();
		this.num = num;
		this.file = file;
		this.day = day;
	}
	public int getNum() {
		return num;
	}
	public String getFile() {
		return file;
	}
	public String getDay() {
		return day;
	}
	
    
    
}
