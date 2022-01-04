package com.dogpro.memberDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dogpro.memberDTO.foodDTO;
import com.dogpro.memberDTO.memberDTO;

public class dogDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	int cnt = 0;
	int cnt1 = 0;
	memberDTO dto = null;
	private boolean check;
	private String id;

	public String[] getDogInfo(String dogKind) {

		getConn();
		String[] dogData = new String[2];

		try {
			String sql = "select d_w_avg, d_w_max from dog_list where d_kind = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dogKind);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dogData[0] = rs.getString(1);
				dogData[1] = rs.getString(2);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dogData;

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

	public ArrayList<foodDTO> puppyRec() { // ArrayList 로 만들어야 할 텐데

		getConn();

		try {

			String sql = "select * from t_food where f_mouth='1' or f_smell='1' or f_bone='1'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			ArrayList<foodDTO> rec_p = new ArrayList<foodDTO>();
			while (rs.next()) {
				foodDTO temp = new foodDTO();
				temp.setF_NAME(rs.getString("F_NAME"));
				temp.setF_SITE(rs.getString("F_SITE"));
				temp.setF_PRICE(rs.getString("F_PRICE"));
				temp.setF_IMG(rs.getString("F_IMG"));

				rec_p.add(temp);
			}
			return rec_p;

		} catch (Exception e) {
			// ClassNotFoundException, SQLException
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
			return null;
		} finally {
			close();

		}
	}

	public ArrayList<foodDTO> adultRec() {
		ArrayList<foodDTO> rec_a = new ArrayList<foodDTO>();
		getConn();

		try {

			String sql = "select * from t_food where F_ALLERGY='1' or F_SKIN='1' or F_TOOTH='1'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			
			
			while (rs.next()) {
				String f_NAME = rs.getString(2);
				String f_SITE = rs.getString(28);
				String f_PRICE = rs.getString(29);
				String f_IMG = rs.getString(30);
				foodDTO f_dto = new foodDTO(f_NAME, f_SITE, f_PRICE, f_IMG);

				rec_a.add(f_dto);
			}
			

		} catch (Exception e) {
			// ClassNotFoundException, SQLException
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
			
		} finally {
			close();

		}
		
		return rec_a;
	}
	
	public ArrayList<foodDTO> seniorRec() {

		getConn();

		try {

			String sql = "select * from t_food where F_VITAMIN='1' or  F_ANTIOXIDATION='1' or F_HUMIDITY='1' or F_FUR='1' or F_URINATION='1' or F_REMEDY='1'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			ArrayList<foodDTO> rec_s = new ArrayList<foodDTO>();
			while (rs.next()) {
				String f_NAME = rs.getString(2);
				String f_SITE = rs.getString(28);
				String f_PRICE = rs.getString(29);
				String f_IMG = rs.getString(30);
				foodDTO f_dto = new foodDTO(f_NAME, f_SITE, f_PRICE, f_IMG);

				rec_s.add(f_dto);
			}
			return rec_s;

		} catch (Exception e) {
			// ClassNotFoundException, SQLException
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
			return null;
		} finally {
			close();

		}
	}

	public ArrayList<foodDTO> thinRec() {

		getConn();

		try {

			String sql = "select * from t_food where F_APPETITE='1' or  F_NUTRITION='1'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			ArrayList<foodDTO> rec_t = new ArrayList<foodDTO>();
			while (rs.next()) {
				String f_NAME = rs.getString(2);
				String f_SITE = rs.getString(28);
				String f_PRICE = rs.getString(29);
				String f_IMG = rs.getString(30);
				foodDTO f_dto = new foodDTO(f_NAME, f_SITE, f_PRICE, f_IMG);

				rec_t.add(f_dto);
			}
			return rec_t;

		} catch (Exception e) {
			// ClassNotFoundException, SQLException
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
			return null;
		} finally {
			close();

		}
	}
	
	public ArrayList<foodDTO> bigRec() {

		getConn();

		try {

			String sql = "select * from t_food where F_DIET='1' or  F_INDOOR='1' or F_WEIGHT='1'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			ArrayList<foodDTO> rec_b = new ArrayList<foodDTO>();
			while (rs.next()) {
				String f_NAME = rs.getString(2);
				String f_SITE = rs.getString(28);
				String f_PRICE = rs.getString(29);
				String f_IMG = rs.getString(30);
				foodDTO f_dto = new foodDTO(f_NAME, f_SITE, f_PRICE, f_IMG);

				rec_b.add(f_dto);
			}
			return rec_b;

		} catch (Exception e) {
			// ClassNotFoundException, SQLException
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
			return null;
		} finally {
			close();

		}
	}
	
	public int Update(String nick, String tel, String dogname, String dogkind, String dogage, String dogweight) {

		try {
			getConn();

			// --------------------DB연결

			String sql = "update t_member set m_nick=?,m_phone=?,m_dogname=?,m_dog=?,m_dogweight=?. m_dogage=? where m_id=?";
			// 5. SQL명령문을 준비
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, nick);
			psmt.setString(2, tel);
			psmt.setString(3, dogname);
			psmt.setString(4, dogkind);
			psmt.setString(5, dogage);
			psmt.setString(6, dogweight);
			psmt.setString(7, id);

			// 6. SQL명령문 실행
			cnt = psmt.executeUpdate();

			// 7. 명령 후 처리

		} catch (Exception e) {
			// ClassNotFoundException, SQLException
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();

		} finally {
			close();

		}
		return cnt;
	}

	public memberDTO Login(memberDTO dto1) {
		try {
			getConn();
			System.out.println("Login 메소드입니다.");
			System.out.println(dto1.getId());
			System.out.println(dto1.getPw());
			String sql = "select * from t_member where m_id= ? and m_pw= ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto1.getId());
			psmt.setString(2, dto1.getPw());

			rs = psmt.executeQuery();

			if (rs.next()) {
				String getid = rs.getString(1); // db안의 아이디
				String getpw = rs.getString(2); // pw

				System.out.println(getid);
				System.out.println(getpw);

				if (dto1.getPw().equals(getpw)) {
					dto = new memberDTO(getid, getpw);
				}

			}
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();

		} finally {
			close();

		}
		return dto;
	}

	public int Delete(String id) {

		try {
			getConn();

			String sql = "delete from t_member where id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();

		}

		return cnt;
	}

	public int Join(memberDTO dto) {

		try {
			getConn();
			System.out.println("===Join===");
			String sql = "insert into t_member values (?, ?, ?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(4, dto.getPw());
			psmt.setString(3, dto.getNickname());
			psmt.setString(2, dto.getTel());
			psmt.setString(6, dto.getDogname());
			psmt.setString(5, dto.getDogkind());
			psmt.setString(8, dto.getDogage());
			psmt.setString(7, dto.getDogweight());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();

		} finally {
			close();

		}
		return cnt;

	}

	// dog_list dao

	// public ArrayList<memberDTO> selectMember() {

	// ArrayList<memberDTO> arr = new ArrayList<memberDTO>();

	// try {
	// getConn();

	// String sql = "select * from t_member";
	// psmt = conn.prepareStatement(sql);
	// rs = psmt.executeQuery();

	// while (rs.next() == true) {
	// String id = rs.getString(1);
	// String tel = rs.getString(3);
	// String nickname = rs.getString(4);

	// dto = new memberDTO(nickname,id ,pw,tel ,nickname);
	// arr.add(dto);
	// }

	// } catch (Exception e) {
	// System.out.println("클래스파일 로딩실패");
	// e.printStackTrace();

	// } finally {
	// close();

	// }
	// return arr;
	// }

	public boolean emailChechk(String id) {
		try {
			getConn();

			String sql = "select * from member_message where id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);

			rs = psmt.executeQuery();

			check = rs.next();
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();

		} finally {
			close();

		}

		return check;
	}

	public ArrayList<memberDTO> searchMember(String id) {
		return null;
	}

}