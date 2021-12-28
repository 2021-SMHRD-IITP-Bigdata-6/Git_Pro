package com.dogpro.memberDTO;

public class dogDTO {
 private String dogkind;
 private String dogage;
 private String dogweight;
	private String dogname;
	
   public String getDogname() {
		return dogname;
	}

	public String getDogkind() {
	return dogkind;
}

public dogDTO(String dogkind, String dogage, String dogweight, String dogname, String nickname, String tel
			) {
		super();
		this.dogkind = dogkind;
		this.dogage = dogage;
		this.dogweight = dogweight;
		this.dogname = dogname;
		this.nickname = nickname;
		this.tel = tel;
		
	}

public void setDogkind(String dogkind) {
	this.dogkind = dogkind;
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

public dogDTO( String id, String pw, String nickname, String tel, String dogname,
		String dogkind,String dogage,String dogweight) {
		super();
		this.id = id;
		this.pw = pw;
		this.tel = tel;
		this.nickname = nickname;
		this.dogkind = dogkind;
		this.dogname = dogname;
		this.dogage = dogage;
		this.dogweight = dogweight;
		
		
		
	}

public dogDTO(String dogname) {
		super();
		this.dogname = dogname;
	}
private String nickname;
   private String id;
   private String pw;
   private String tel;
   private String email;
    public dogDTO(String nickname , String pw,String tel, String email) {
    	this.nickname = nickname;
    	this.pw = pw;
    	this.tel= tel;
    	this.email=email;
    }
 
  

public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public dogDTO(String id, String pw) {
	   super();
	   this.id = id;
	   this.pw = pw;
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
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }




}