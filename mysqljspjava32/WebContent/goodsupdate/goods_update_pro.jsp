<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String dbgid = request.getParameter("m_id");
	String dbgname = request.getParameter("g_name");;
	String dbgcate = request.getParameter("g_cate");;
	String dbgprice = request.getParameter("g_price");;
	String dbgcolor = request.getParameter("g_color");;
	String dbgsize = request.getParameter("g_size");;
	String dbgdate = request.getParameter("g_date");;
	String dbgdesc = request.getParameter("g_desc");;
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev32db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev32id";
	String dbPass = "dev32pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-conn goods_update_pro.jsp");
	pstmt = conn.prepareStatement("UPDATE tb_goods SET g_name=?,g_cate=?,g_price=?,g_color=?,g_size=?,g_date=?,g_desc=? WHERE m_id=?");
	pstmt.setString(1, dbgname);
	pstmt.setString(2, dbgcate);
	pstmt.setString(3, dbgprice);
	pstmt.setString(4, dbgcolor);
	pstmt.setString(5, dbgsize);
	pstmt.setString(6, dbgdate);
	pstmt.setString(7, dbgdesc);
	pstmt.setString(8, dbgid);
	
	int result = pstmt.executeUpdate();
	System.out.println(result +"<-result good_update_pro.jsp");
	response.sendRedirect(request.getContextPath()+"/goodssearch/goods_search_list.jsp");
	pstmt.close();
	conn.close();
%>	
	
	
	
	