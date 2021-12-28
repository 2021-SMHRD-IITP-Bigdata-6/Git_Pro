package com.dogpro.memberDTO;

public class memberDTO {

   private String nickname;
   private String id;
   private String pw;
   private String tel;
   private String email;
    public memberDTO(String nickname , String pw,String tel, String email) {
    	this.nickname = nickname;
    	this.pw = pw;
    	this.tel= tel;
    	this.email=email;
    }
 
   public memberDTO(String nickname, String id, String pw, String tel, String email) {
      super();
      this.nickname = nickname;
      this.id = id;
      this.pw = pw;
      this.tel = tel;
      this.email = email;
   }

public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public memberDTO(String id, String pw) {
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