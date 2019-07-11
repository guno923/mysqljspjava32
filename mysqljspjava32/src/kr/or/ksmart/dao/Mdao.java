package kr.or.ksmart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Member;

public class Mdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String alert =null;
	ArrayList<Member> alm = null;
	//08 세션에 셋팅하기 위한 메서드 선언(아이디, 이름 , 권한)
	public Member mGetForSession(String in_id) throws ClassNotFoundException, SQLException {
		System.out.println("08 세션에 셋팅하기 위한 메서드 선언 mGetForSession_Mdao.java");
		Member mb = new Member();
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println("###############");
		System.out.println(conn + "<-- conn_mGetForSession_Mdao.java");
		pstmt= conn.prepareStatement("SELECT m_id,m_name,m_level FROM tb_member where m_id=?");
		pstmt.setString(1, in_id);
		System.out.println(pstmt+"<-pstmt_mGetForSession_Mdao.java");

		rs = pstmt.executeQuery();

		if(rs.next()) {
			mb.setM_id(rs.getString("m_id"));
			mb.setM_level(rs.getString("m_level"));
			mb.setM_name(rs.getString("m_name"));	
		}
		rs.close();
		pstmt.close();
		conn.close();
		return mb;
	}
	//07 로그인 체크 메서드 선언
	public String mLoginCheck(String in_id,String in_pw) throws ClassNotFoundException, SQLException {
		System.out.println("07로그인 체크 메서드 선언 mLoginCheck_Mdao.java");
		System.out.println(in_id +"in_id");
		System.out.println(in_pw +"in_pw");
		String re = null;
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println("###############");
		System.out.println(conn + "<-- conn_mLoginCheck_Mdao.java");
	
		pstmt = conn.prepareStatement("SELECT m_pw FROM tb_member WHERE m_id=?");
		pstmt.setString(1, in_id);
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-rs_mLoginCheck_Mdao.java");
		if(rs.next()) {
			if(in_pw.equals(rs.getString("m_pw"))) {
				System.out.println("로그인성공");
				re="로그인성공";
			} else {
				System.out.println("비번불일치");
				re="비번불일치";
			}
		} else {
			System.out.println("아이디불일치");
			re="아이디불일치";
		}
		rs.close();
		pstmt.close();
		conn.close();
		return re;
	}
	//06 검색 메서드 선언
	public ArrayList<Member> mSearch(String sk,String sv) throws ClassNotFoundException, SQLException {
		System.out.println("06 검색 메서드 선언mSearch_Mdao.java");
		System.out.println(alm + "<- alm 01 mSearch Mdao.java");
		alm = new ArrayList<Member>();
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println("###############");
		System.out.println(conn + "<-- conn_mSearch Mdao.java");
		if(sk == null & sv == null) {
			pstmt = conn.prepareStatement("SELECT * FROM tb_member");
			System.out.println(rs+"<-rs m_search_list.jsp");
			System.out.println("01 sk sv 둘다 null조건");
		} else if(sk != null & sv.equals("")) {
			pstmt = conn.prepareStatement("SELECT * FROM tb_member");
			System.out.println(rs+"<-rs m_search_list.jsp");
			System.out.println("02 sk null 아니고 sv 공백조건");
		} else if(sk != null & sv != null) {
			pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE "+sk+"=?");
			pstmt.setString(1, sv);
			System.out.println("03 sk sv 둘다 null이 아닌 조건");
		}
		rs = pstmt.executeQuery();
		while(rs.next()){
			Member mb = new Member();
			mb.setM_id(rs.getString("m_id"));
			mb.setM_pw(rs.getString("m_pw"));
			mb.setM_level(rs.getString("m_level"));
			mb.setM_name(rs.getString("m_name"));
			mb.setM_email(rs.getString("m_email"));
			alm.add(mb);
			System.out.println(mb + "<- alm 02 mSearch Mdao.java");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return alm;
	}
	//05 전체외원 조회 메서드 선언
	public ArrayList<Member> mAllSelect() throws ClassNotFoundException, SQLException {
		System.out.println("05 전체회원 조회 메서드 선언mAllSelect_Mdao.java");
		System.out.println(alm + "<- alm 01 mAllSelect Mdao.java");
		alm = new ArrayList<Member>();
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println("###############");
		System.out.println(conn + "<-- conn_mAllSelect Mdao.java");
		pstmt= conn.prepareStatement("SELECT * FROM tb_member");
		rs = pstmt.executeQuery();
		while(rs.next()){
			Member mb = new Member();
			mb.setM_id(rs.getString("m_id"));
			mb.setM_pw(rs.getString("m_pw"));
			mb.setM_level(rs.getString("m_level"));
			mb.setM_name(rs.getString("m_name"));
			mb.setM_email(rs.getString("m_email"));
			alm.add(mb);
			System.out.println(mb + "<- alm 02 mAllSelect Mdao.java");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return alm;
	}
	//04 한명회원 조회 메서드선언(수정화면)
	public Member mSelectforUpdate(String send_id) throws ClassNotFoundException, SQLException {
		System.out.println("04 한명회원 조회 메서드선언(수정화면) mSelectforUpdate Mdao.java");
		Member mudb = new Member();
		try {
			//1~2단계 : 드라이버로딩 및 DB연결
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println("###############");
			System.out.println(conn + "<-- conn_mSelectforUpdate_Mdao.java");
			//3단계 : select쿼리준비
			pstmt= conn.prepareStatement("SELECT * FROM tb_member where m_id=?");
			pstmt.setString(1, send_id);
			System.out.println(pstmt+"<-pstmt_mSelectforUpdate_Mdao.java");
			//4단계 : select 쿼리 실행 후 ResultSet객체에 담는다
			rs = pstmt.executeQuery();
			//System.out.println(rs.next() + "<-- rs.next()_mSelectforUpdate_Mdao.java");
			//5단계 : 쿼리 실행결과 활용(Member 객체내에 셋팅)
			if(rs.next()) {
				mudb.setM_id(rs.getString("m_id"));
				mudb.setM_pw(rs.getString("m_pw"));
				mudb.setM_level(rs.getString("m_level"));
				mudb.setM_name(rs.getString("m_name"));
				mudb.setM_email(rs.getString("m_email"));
			}
			//6,7단계 : close(객체종료)
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		//8단계 : return
		return mudb;
	}
	public void mDelete(String del_id) throws ClassNotFoundException, SQLException {
		System.out.println("01_02 삭제처리 메서드 선언 mDelete_Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println("###############");
		System.out.println(conn + "<-- conn_mDelete_Mdao.java");
		
		pstmt = conn.prepareStatement("DELETE FROM tb_member WHERE m_id=?");
		pstmt.setString(1, del_id);
		System.out.println(pstmt+ "<-pstmt_mDelete_Mdao.java");	
		int result = pstmt.executeUpdate();
		System.out.println(result+ "<-result_mDelete_Mdao.java");
		pstmt.close();
		conn.close();
	}
	public void mUpdate(Member mb) throws ClassNotFoundException, SQLException {
		System.out.println("01_02 수정처리 메서드 선언 mUpdate_Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println("###############");
		System.out.println(conn + "<-- conn_mUpdate_Mdao.jsp");
			
		pstmt = conn.prepareStatement("UPDATE tb_member SET m_pw=?,m_level=?,m_name=?,m_email=? WHERE m_id=?");
		pstmt.setString(1, mb.getM_pw());
		pstmt.setString(2, mb.getM_level());
		pstmt.setString(3, mb.getM_name());
		pstmt.setString(4, mb.getM_email());
		pstmt.setString(5, mb.getM_id());
		System.out.println(pstmt+"<-pstmt_mUpdate_Mdao.jsp");
			
		int result = pstmt.executeUpdate();
		System.out.println(result +"<-result_mUpdate_Mdao.jsp");
		pstmt.close();
		conn.close();
	}

	//01_01 입력처리 메서드 선언(매개변수 갯수 2개)
	public void mInsert(Member mb,Connection conn) throws SQLException{
	//3단계 쿼리실행준비 부터 시작
		System.out.println("01_01 입력처리 메서드 선언 mInsert_Mdao.java");
		try {
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		System.out.println(pstmt + "<-- pstmt 1");
		System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
		pstmt.setString(1, mb.getM_id());
		pstmt.setString(2, mb.getM_pw());
		pstmt.setString(3, mb.getM_level());
		pstmt.setString(4, mb.getM_name());
		pstmt.setString(5, mb.getM_email());
		
		System.out.println(pstmt + "<-- pstmt 2");
		
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result_mInsert_Mdao.java");
	}finally{
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
		
	}
	
	//01_02 입력처리 메서드 선언(매개변수 갯수 1개)
	public void mInsert(Member mb) throws ClassNotFoundException, SQLException {
	//1,2단계 드라이버로딩과 DB연결 부터 시작
		System.out.println("01_02 입력처리 메서드 선언 mInsert_Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println("#################");
		System.out.println(conn + "<-- conn Mdao.jsp");
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
			System.out.println(pstmt + "<-- pstmt 1");
			System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
			pstmt.setString(1, mb.getM_id());
			pstmt.setString(2, mb.getM_pw());
			pstmt.setString(3, mb.getM_level());
			pstmt.setString(4, mb.getM_name());
			pstmt.setString(5, mb.getM_email());
			
			System.out.println(pstmt + "<-- pstmt 2");
			
			int result = pstmt.executeUpdate();
			System.out.println(result + "<-- result_mInsert_Mdao.java");
		}finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}

}
