package com.dogpro.memberDAO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dogpro.memberDTO.imgfileDTO;

public class imgfileDAO {

	private Connection con = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	private int result = 0;
	private static imgfileDAO instance = new imgfileDAO();

	public static imgfileDAO getInstance() {
		return instance;
	}

	// DB연결
	public void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("클래스파일 로딩완료");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "cgi_8_2_1216";
			String dbpw = "smhrd2";

			con = DriverManager.getConnection(url, dbid, dbpw);

			if (con != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// DB연결 종료
	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (psmt != null)
			psmt.close();
		if (con != null)
			con.close();
	}

	public ArrayList<imgfileDTO> selectAll() {
		// 코드생략
		return new ArrayList<imgfileDTO>();
	}

	// 파일업로드

	public int uploadFile( String id, String pw, String tel, String nick, String dogname, String dogkind,
			String dogage, String dogweight,String adoptdate , String file) throws SQLException, ClassNotFoundException, IOException {
		getConnection();

		String sql = "insert into t_member values(?,?,?,?,?,?,?,?,?,?)";

		psmt = con.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pw);
		psmt.setString(3, nick);
		psmt.setString(4, tel);
		psmt.setString(5, dogkind);
		psmt.setString(6, dogname);
		psmt.setString(7, dogweight);
		psmt.setString(8, dogage);
		psmt.setString(9, adoptdate);
		psmt.setString(10, file);
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(nick);
		System.out.println(tel);
		System.out.println(dogkind);
		System.out.println(dogname);
		System.out.println(dogweight);
		System.out.println(dogage);
		System.out.println(adoptdate);
		System.out.println(file);
		

		result = psmt.executeUpdate();

		close();

		return result;
	}
}
