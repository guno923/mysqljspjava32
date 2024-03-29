<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import="kr.or.ksmart.dto.Member" %>
<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
//화면에서 입력자료 받아서 콘솔창에 출력 시작
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	String m_level = request.getParameter("m_level");
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	System.out.println(m_id + "<-- m_id /minsert/m_insert_pro.jsp");
	System.out.println(m_pw + "<-- m_pw /minsert/m_insert_pro.jsp");
	System.out.println(m_level + "<-- m_level /minsert/m_insert_pro.jsp");
	System.out.println(m_name + "<-- m_name /minsert/m_insert_pro.jsp");
	System.out.println(m_email + "<-- m_email /minsert/m_insert_pro.jsp");
	Member mb = new Member();
	mb.setM_id(m_id);
	mb.setM_pw(m_pw);
	mb.setM_level(m_level);
	mb.setM_name(m_name);
	mb.setM_email(m_email);
//화면에서 입력자료 받아서 콘솔창에 출력 끝	
	//JDBC 프로그램 순서
	//01단계 :드라이버 로딩 시작
	Class.forName("com.mysql.jdbc.Driver");
	//01단계 :드라이버 로딩 끝
	
	try{
//02단계 :DB연결(Connection)시작
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println("#################");
		System.out.println(conn + "<-- conn");
		
		
//02단계 :DB연결(Connection)끝
//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 시작
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		System.out.println(pstmt + "<-- pstmt 1");
		System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
//insert into tb_member values('id001','pw001','관리자','홍01','email01');
		pstmt.setString(1, mb.getM_id());
		pstmt.setString(2, mb.getM_pw());
		pstmt.setString(3, mb.getM_level());
		pstmt.setString(4, mb.getM_name());
		pstmt.setString(5, mb.getM_email());
		
		System.out.println(pstmt + "<-- pstmt 2");
		
//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 끝
//04단계 :Query실행 시작
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
		//response.sendRedirect(request.getContextPath()+"/mlist/m_list.jsp");
//04단계 :Query실행 끝
//05단계 :Query실행결과 사용 (insert의 경우 생략 가능단계)

	}finally{
		//06단계 :statement 또는 prepareStatement객체 종료(close())
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		//07단계 :Connection 객체 종료(close())
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

%>