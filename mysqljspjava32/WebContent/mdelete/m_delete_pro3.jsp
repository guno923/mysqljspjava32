<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;

	String del_id = request.getParameter("del_id");
	System.out.println(del_id+"<-del_id");
	Class.forName("com.mysql.jdbc.Driver");
	
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println("###############");
	System.out.println(conn + "<-- conn");
		
	pstmt = conn.prepareStatement("DELETE FROM tb_member WHERE m_id=?");
	pstmt.setString(1, del_id);
		
	int result = pstmt.executeUpdate();
	System.out.println(result+ "<-result");
	response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
	//response.sendRedirect(request.getContextPath()+"/mlist/m_list.jsp");
		
	pstmt.close();
	conn.close();
%>	
	