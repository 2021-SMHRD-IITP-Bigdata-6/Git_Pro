package com.dogpro.memberDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dogpro.memberDTO.foodDTO;
import com.dogpro.memberDTO.ingDTO;

public class ingDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	foodDTO dto = null;
	int cnt = 0;
	int cnt1 = 0;

	
	public ingDTO selectIng(int seq) {
		ingDTO dto=null;
		try {
			getConn();
			String sql = "select * from t_ingre2 where f_seq=?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();

			if (rs.next()) {
				String F_SEQ =rs.getString(1);
				String PH =rs.getString(2);
				String DHA=rs.getString(3);
				String EPA =rs.getString(4);
				String HYD =rs.getString(5);
				String O3 =rs.getString(6);
				String O6 =rs.getString(7);
				String PROT =rs.getString(8);
				String FIB =rs.getString(9);
				String FAT =rs.getString(10);
				String ASH =rs.getString(11);
				String CAL =rs.getString(12);
				String CAR =rs.getString(13);
				
				dto = new ingDTO(F_SEQ,PH,DHA,
							EPA,
							HYD,
							O3,
							O6,
							PROT,
							FIB,
							FAT,
							ASH,
							CAL,
							CAR);
				

			}
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();

		} finally {
			close();

		}
		return dto;
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

	
	
	
