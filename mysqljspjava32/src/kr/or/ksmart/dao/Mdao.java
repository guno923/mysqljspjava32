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
	//08 ���ǿ� �����ϱ� ���� �޼��� ����(���̵�, �̸� , ����)
	public Member mGetForSession(String in_id) throws ClassNotFoundException, SQLException {
		System.out.println("08 ���ǿ� �����ϱ� ���� �޼��� ���� mGetForSession_Mdao.java");
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
	//07 �α��� üũ �޼��� ����
	public String mLoginCheck(String in_id,String in_pw) throws ClassNotFoundException, SQLException {
		System.out.println("07�α��� üũ �޼��� ���� mLoginCheck_Mdao.java");
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
				System.out.println("�α��μ���");
				re="�α��μ���";
			} else {
				System.out.println("�������ġ");
				re="�������ġ";
			}
		} else {
			System.out.println("���̵����ġ");
			re="���̵����ġ";
		}
		rs.close();
		pstmt.close();
		conn.close();
		return re;
	}
	//06 �˻� �޼��� ����
	public ArrayList<Member> mSearch(String sk,String sv) throws ClassNotFoundException, SQLException {
		System.out.println("06 �˻� �޼��� ����mSearch_Mdao.java");
		System.out.println(alm + "<- alm 01 mSearch Mdao.java");
		alm = new ArrayList<Member>();
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println("###############");
		System.out.println(conn + "<-- conn_mSearch Mdao.java");
		if(sk == null & sv == null) {
			pstmt = conn.prepareStatement("SELECT * FROM tb_member");
			System.out.println(rs+"<-rs m_search_list.jsp");
			System.out.println("01 sk sv �Ѵ� null����");
		} else if(sk != null & sv.equals("")) {
			pstmt = conn.prepareStatement("SELECT * FROM tb_member");
			System.out.println(rs+"<-rs m_search_list.jsp");
			System.out.println("02 sk null �ƴϰ� sv ��������");
		} else if(sk != null & sv != null) {
			pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE "+sk+"=?");
			pstmt.setString(1, sv);
			System.out.println("03 sk sv �Ѵ� null�� �ƴ� ����");
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
	//05 ��ü�ܿ� ��ȸ �޼��� ����
	public ArrayList<Member> mAllSelect() throws ClassNotFoundException, SQLException {
		System.out.println("05 ��üȸ�� ��ȸ �޼��� ����mAllSelect_Mdao.java");
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
	//04 �Ѹ�ȸ�� ��ȸ �޼��弱��(����ȭ��)
	public Member mSelectforUpdate(String send_id) throws ClassNotFoundException, SQLException {
		System.out.println("04 �Ѹ�ȸ�� ��ȸ �޼��弱��(����ȭ��) mSelectforUpdate Mdao.java");
		Member mudb = new Member();
		try {
			//1~2�ܰ� : ����̹��ε� �� DB����
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println("###############");
			System.out.println(conn + "<-- conn_mSelectforUpdate_Mdao.java");
			//3�ܰ� : select�����غ�
			pstmt= conn.prepareStatement("SELECT * FROM tb_member where m_id=?");
			pstmt.setString(1, send_id);
			System.out.println(pstmt+"<-pstmt_mSelectforUpdate_Mdao.java");
			//4�ܰ� : select ���� ���� �� ResultSet��ü�� ��´�
			rs = pstmt.executeQuery();
			//System.out.println(rs.next() + "<-- rs.next()_mSelectforUpdate_Mdao.java");
			//5�ܰ� : ���� ������ Ȱ��(Member ��ü���� ����)
			if(rs.next()) {
				mudb.setM_id(rs.getString("m_id"));
				mudb.setM_pw(rs.getString("m_pw"));
				mudb.setM_level(rs.getString("m_level"));
				mudb.setM_name(rs.getString("m_name"));
				mudb.setM_email(rs.getString("m_email"));
			}
			//6,7�ܰ� : close(��ü����)
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		//8�ܰ� : return
		return mudb;
	}
	public void mDelete(String del_id) throws ClassNotFoundException, SQLException {
		System.out.println("01_02 ����ó�� �޼��� ���� mDelete_Mdao.java");
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
		System.out.println("01_02 ����ó�� �޼��� ���� mUpdate_Mdao.java");
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

	//01_01 �Է�ó�� �޼��� ����(�Ű����� ���� 2��)
	public void mInsert(Member mb,Connection conn) throws SQLException{
	//3�ܰ� ���������غ� ���� ����
		System.out.println("01_01 �Է�ó�� �޼��� ���� mInsert_Mdao.java");
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
	
	//01_02 �Է�ó�� �޼��� ����(�Ű����� ���� 1��)
	public void mInsert(Member mb) throws ClassNotFoundException, SQLException {
	//1,2�ܰ� ����̹��ε��� DB���� ���� ����
		System.out.println("01_02 �Է�ó�� �޼��� ���� mInsert_Mdao.java");
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
