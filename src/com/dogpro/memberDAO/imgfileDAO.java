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
	public void getConnection() throws ClassNotFoundException, IOException, SQLException {
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		Properties p = new Properties();
		p.load(in);

		String url = p.getProperty("dburl");
		String id = p.getProperty("dbid");
		String pw = p.getProperty("dbpw");

		Class.forName(p.getProperty("dbclass"));
		con = DriverManager.getConnection(url, id, pw);
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

	// 파일업로드
	public int uploadFile(String author, String title, String file)
			throws SQLException, ClassNotFoundException, IOException {
		getConnection();

		psmt = con.prepareStatement(
				"insert into fileboard values(file_num.nextval,?,?,?,to_char(sysdate, 'YYYY-MM-DD'))");
		psmt.setString(1, author);
		psmt.setString(2, title);
		psmt.setString(3, file);

		result = psmt.executeUpdate();

		close();

		return result;
	}

	public ArrayList<imgfileDTO> selectAll() {
	    //코드생략
	    return new ArrayList<imgfileDTO>();
	}
}
