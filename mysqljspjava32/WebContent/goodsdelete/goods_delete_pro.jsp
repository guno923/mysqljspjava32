<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;

	String del_id = request.getParameter("del_id");
	System.out.println(del_id+"<-del_id");
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev32db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev32id";
	String dbPass = "dev32pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn +"<-conn_goods_delete_pro.jsp");
		
	pstmt = conn.prepareStatement("DELETE FROM tb_goods WHERE g_code=?");
	pstmt.setString(1, del_id);
		
	int result = pstmt.executeUpdate();
	System.out.println(result+ "<-result_goods_delete_pro.jsp");
	response.sendRedirect(request.getContextPath()+"/goodssearch/goods_search_list.jsp");
		
	pstmt.close();
	conn.close();
%>