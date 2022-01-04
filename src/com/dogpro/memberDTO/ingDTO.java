package com.dogpro.memberDTO;

public class ingDTO {
	private String F_SEQ;
	private String PH;
	private String DHA;
	private String EPA;
	private String HYD;
	private String O3;
	public String getF_SEQ() {
		return F_SEQ;
	}
	public void setF_SEQ(String f_SEQ) {
		F_SEQ = f_SEQ;
	}
	public String getPH() {
		return PH;
	}
	public void setPH(String pH) {
		PH = pH;
	}
	public String getDHA() {
		return DHA;
	}
	public void setDHA(String dHA) {
		DHA = dHA;
	}
	public String getEPA() {
		return EPA;
	}
	public void setEPA(String ePA) {
		EPA = ePA;
	}
	public String getHYD() {
		return HYD;
	}
	public void setHYD(String hYD) {
		HYD = hYD;
	}
	public String getO3() {
		return O3;
	}
	public void setO3(String o3) {
		O3 = o3;
	}
	public String getO6() {
		return O6;
	}
	public void setO6(String o6) {
		O6 = o6;
	}
	public String getPROT() {
		return PROT;
	}
	public void setPROT(String pROT) {
		PROT = pROT;
	}
	public String getFIB() {
		return FIB;
	}
	public void setFIB(String fIB) {
		FIB = fIB;
	}
	public String getFAT() {
		return FAT;
	}
	public void setFAT(String fAT) {
		FAT = fAT;
	}
	public String getASH() {
		return ASH;
	}
	public void setASH(String aSH) {
		ASH = aSH;
	}
	public String getCAL() {
		return CAL;
	}
	public void setCAL(String cAL) {
		CAL = cAL;
	}
	public String getCAR() {
		return CAR;
	}
	public void setCAR(String cAR) {
		CAR = cAR;
	}
	private String O6;
	private String PROT;
	private String FIB;
	private String FAT;
	private String ASH;
	private String CAL;
	private String CAR;
	public ingDTO(String f_SEQ, String pH, String dHA, String ePA, String hYD, String o3, String o6, String pROT,
			String fIB, String fAT, String aSH, String cAL, String cAR) {
		super();
		F_SEQ = f_SEQ;
		PH = pH;
		DHA = dHA;
		EPA = ePA;
		HYD = hYD;
		O3 = o3;
		O6 = o6;
		PROT = pROT;
		FIB = fIB;
		FAT = fAT;
		ASH = aSH;
		CAL = cAL;
		CAR = cAR;
	}
	
}
