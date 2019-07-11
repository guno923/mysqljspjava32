<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String dbid = request.getParameter("m_id");
	String dbpw = request.getParameter("m_pw");
	String dblevel = request.getParameter("m_level");
	String dbname = request.getParameter("m_name");
	String dbemail = request.getParameter("m_email");
	System.out.println(dbid+ "<-dbid");
	System.out.println(dbpw+ "<-dbpw");
	
	Class.forName("com.mysql.jdbc.Driver");

	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println("###############");
	System.out.println(conn + "<-- conn");
		
	pstmt = conn.prepareStatement("UPDATE tb_member SET m_pw=?,m_level=?,m_name=?,m_email=? WHERE m_id=?");
	pstmt.setString(1, dbpw);
	pstmt.setString(2, dblevel);
	pstmt.setString(3, dbname);
	pstmt.setString(4, dbemail);
	pstmt.setString(5, dbid);
	System.out.println(pstmt+"<-pstmt");
		
	int result = pstmt.executeUpdate();
	System.out.println(result +"<-result");
		
	response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
	//response.sendRedirect(request.getContextPath()+"/mlist/m_list.jsp");
		
	pstmt.close();
	conn.close();
%>
	