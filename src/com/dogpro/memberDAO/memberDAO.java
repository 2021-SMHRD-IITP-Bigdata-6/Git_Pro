package com.dogpro.memberDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dogpro.memberDTO.memberDTO;

public class memberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	int cnt = 0;
	int cnt1 = 0;
	memberDTO dto = null;
	private boolean check;
	private String id;

	
	public memberDTO Login(memberDTO dto1) {
		try {
			getConn();
			System.out.println("Login 메소드입니다.");
			System.out.println("무슨 id?"+dto1.getId()); //DB 에서 가져온 id값 
			System.out.println("무슨 pw?"+dto1.getPw()); //DB 에서 가져온 pw값
			String sql = "select * from t_member where m_id= ? and m_pw= ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto1.getId()); 
			psmt.setString(2, dto1.getPw());

			rs = psmt.executeQuery();

			if (rs.next()) {
				String getid = rs.getString(1); // db안의 아이디
				String getpw = rs.getString(2); // pw
				String m_nick = rs.getString(3); // nickName
				String m_phone = rs.getString(4);// 휴대폰 번호
				String m_dogKind = rs.getString(5); // 로그인한 개종류 가져오는것
				String dog_name = rs.getString(6);
				String m_dogWeight = rs.getString(7);
				String m_dogAge = rs.getString(8);
				String date = rs.getString(9);

				System.out.println(getid);
				System.out.println(getpw);

				if (dto1.getPw().equals(getpw)) {
					dto = new memberDTO(getid, getpw, m_nick, m_phone, m_dogKind, dog_name, m_dogWeight, m_dogAge,date);
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

	public int Update(String nick, String tel, String dogname, String dogkind, String dogage,String dogweight, String id) {

		try {
			getConn();

			// --------------------DB연결
			int numAge = Integer.parseInt(dogage);
			int numWeight = Integer.parseInt(dogweight);
			String sql = "update t_member set m_nick=?,m_phone=?,m_dogname=?,m_dog=?,m_dogweight=?, m_dogage=? where m_id=?";
			// 5. SQL명령문을 준비
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, nick);
			psmt.setString(2, tel);
			psmt.setString(3, dogname);
			psmt.setString(4, dogkind);
			psmt.setInt(5, numAge);
			psmt.setInt(6, numWeight);
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




	public int Join(memberDTO dto) {

		try {
			getConn();
			System.out.println("===Join===");
			String sql = "insert into t_member values (?, ?, ?,?,?,?,?,?,?,null)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getNickname());
			psmt.setString(4, dto.getTel());
			psmt.setString(6, dto.getDogkind());
			psmt.setString(5, dto.getDogname());
			psmt.setString(8, dto.getDogweight());
			psmt.setString(7, dto.getDogage());
			psmt.setString(9, dto.getDate());

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

	public boolean emailChechk(String id) { // id중복체크
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
		// TODO Auto-generated method stub
		return null;
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