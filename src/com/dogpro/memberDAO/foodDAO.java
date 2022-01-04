package com.dogpro.memberDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dogpro.memberDTO.foodDTO;

public class foodDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	foodDTO dto = null;
	foodDTO dto1 = null;
	int cnt = 0;
	int cnt1 = 0;

	public foodDTO selectFood(foodDTO dto) {
		try {
			getConn();
			String sql = "select * from t_food ";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String f_SEQ = rs.getString(1);
				String f_NAME = rs.getString(2);
				String f_TYPE = rs.getString(3);
				String f_VITAMIN = rs.getString(4);
				String f_ANTIOXIDATION = rs.getString(5);
				String f_APPETITE = rs.getString(6);
				String f_NUTRITION = rs.getString(7);
				String f_STONE = rs.getString(8);
				String f_HUMIDITY = rs.getString(9);
				String f_MOUTH = rs.getString(10);
				String f_SMELL = rs.getString(11);
				String f_DIET = rs.getString(12);
				String f_NEUTRAL = rs.getString(13);
				String f_INDOOR = rs.getString(14);
				String f_TEAR = rs.getString(15);
				String f_EYE = rs.getString(16);
				String f_ALLERGY = rs.getString(17);
				String f_SKIN = rs.getString(18);
				String f_FUR = rs.getString(19);
				String f_URINATION = rs.getString(20);
				String f_BONE = rs.getString(21);
				String f_PERFORMANCE = rs.getString(22);
				String f_DIGESTIVE = rs.getString(23);
				String f_TOOTH = rs.getString(24);
				String f_WEIGHT = rs.getString(25);
				String f_REMEDY = rs.getString(26);
				String f_KIDNEY = rs.getString(27);
				String f_SITE = rs.getString(28);
				String f_PRICE = rs.getString(29);
				String f_IMG = rs.getString(30);

				
					dto = new foodDTO(f_SEQ, f_NAME, f_TYPE, f_VITAMIN, f_ANTIOXIDATION, f_APPETITE, f_NUTRITION,
							f_STONE, f_HUMIDITY, f_MOUTH, f_SMELL, f_DIET, f_NEUTRAL, f_INDOOR, f_TEAR, f_EYE,
							f_ALLERGY, f_SKIN, f_FUR, f_URINATION, f_BONE, f_PERFORMANCE, f_DIGESTIVE, f_TOOTH,
							f_WEIGHT, f_REMEDY, f_KIDNEY, f_SITE, f_PRICE, f_IMG);
				

			}
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();

		} finally {
			close();

		}
		return dto;
	}
	
	public ArrayList<foodDTO> getMuc(String content){
		ArrayList<foodDTO> mucic = new ArrayList<foodDTO>();
		getConn();
		String menu = "";
		
		if(content.equals("종합비타민")) {
			menu = "F_VITAMIN";
		}else if(content.equals("항산화")) {
			menu = "F_ANTIOXIDATION";
		}else if(content.equals("식욕증진")) {
			menu = "F_APPETITE";
		}else if(content.equals("영양공급")) {
			menu = "F_NUTRITION";
		}else if(content.equals("결석예방")) {
			menu = "T_STONE";
		}else if(content.equals("보습")) {
			menu = "F_HUMIDITY";
		}else if(content.equals("구강관리")) {
			menu = "F_MOUTH";
		}else if(content.equals("냄새제거")) {
			menu = "F_SMELL";
		}else if(content.equals("다이어트")) {
			menu = "F_DIET";
		}else if(content.equals("중성화")) {
			menu = "F_NEUTRAL";
		}else if(content.equals("인도어")) {
			menu = "F_INDOOR";
		}else if(content.equals("눈물개선")) {
			menu = "F_TEAR";
		}else if(content.equals("눈건강")) {
			menu = "F_EYE";
		}else if(content.equals("저알러지")) {
			menu = "F_ALLERGY";
		}else if(content.equals("피부개선")) {
			menu = "F_SKIN";
		}else if(content.equals("털개선")) {
			menu = "F_FUR";
		}else if(content.equals("러너리비뇨계")) {
			menu = "F_URINATION";
		}else if(content.equals("뼈관절강화")) {
			menu = "F_BONE";
		}else if(content.equals("퍼포먼스")) {
			menu = "F_PERFORMANCE";
		}else if(content.equals("소화 장기능 개선")) {
			menu = "F_DIGESTIVE";
		}else if(content.equals("치석제거")) {
			menu = "F_TOOTH";
		}else if(content.equals("체중유지")) {
			menu = "F_WEIGHT";
		}else if(content.equals("처방식")) {
			menu = "F_REMEDY";
		}else if(content.equals("신장요로")) {
			menu = "F_KIDNEY";
		}else if(content.equals("건식")) {
			menu = "F_TYPE";
		}
		
		

		try {
			String sql = "select * from t_food where "+menu+" = 1";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()==true) {
				System.out.println("Test");
				String f_NAME = rs.getString(2);
				String f_SITE = rs.getString(28);
				String f_PRICE = rs.getString(29);
				String f_IMG= rs.getString(30);
				dto1 = new foodDTO(f_NAME, f_SITE, f_PRICE, f_IMG);
				mucic.add(dto1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		return mucic;
		
	}

	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";

			System.out.println("클래스파일 로딩완료");

			// 3.DB에서 사용하는 id/pw를 인증
			String dbid = "cgi_8_2_1216";
			String dbpw = "smhrd2";

			conn = DriverManager.getConnection(url, dbid, dbpw);

			if (conn != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		System.out.println("무조건실행");
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
