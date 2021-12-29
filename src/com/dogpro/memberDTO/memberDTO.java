package com.dogpro.memberDTO;

public class memberDTO {
	private String dogkind;
	private String dogage;
	private String dogweight;
	private String dogname;
	private String nickname;
	private String id;
	private String pw;
	private String tel;
	private String date;

	public memberDTO(String id, String pw, String nickname, String tel, String dogkind, String dogname,
			String dogweight, String dogage, String date) { // 회원가입
		super();
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.tel = tel;
		this.dogkind = dogkind;
		this.dogname = dogname;
		this.dogage = dogage;
		this.dogweight = dogweight;
		this.date = date;
	}

	public memberDTO(String dogkind, String dogage, String dogweight, String dogname, String nickname, String tel) {
		super();
		this.dogkind = dogkind;
		this.dogage = dogage;
		this.dogweight = dogweight;
		this.dogname = dogname;
		this.nickname = nickname;
		this.tel = tel;

	}

	public memberDTO(String nickname, String pw, String tel, String dogkind) {
		this.nickname = nickname;
		this.pw = pw;
		this.tel = tel;
		this.dogkind = dogkind;
	}

	public memberDTO(String id, String pw, String dogkind) {
		super();
		this.dogkind = dogkind;
		this.id = id;
		this.pw = pw;
	}

	public memberDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public String getDogname() {
		return dogname;
	}

	public String getDogkind() {
		return dogkind;
	}

	public void setDogkind(String dogkind) {
		this.dogkind = dogkind;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDogage() {
		return dogage;
	}

	public void setDogage(String dogage) {
		this.dogage = dogage;
	}

	public String getDogweight() {
		return dogweight;
	}

	public void setDogweight(String dogweight) {
		this.dogweight = dogweight;
	}

	public void setDogname(String dogname) {
		this.dogname = dogname;
	}

	public memberDTO(String dogname) {
		super();
		this.dogname = dogname;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}