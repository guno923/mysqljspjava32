<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/maingy.css" />
														<!--       /Layout32/css/main.css -->
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%
	String send_id=request.getParameter("send_id");
	System.out.println(send_id + "<-send_id");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String dbid = null;
	String dbpw = null;
	String dblevel = null;
	String dbname = null;
	String dbemail = null;

	Class.forName("com.mysql.jdbc.Driver");
	try {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println("###############");
		System.out.println(conn + "<-- conn");
		
		pstmt= conn.prepareStatement("SELECT*FROM tb_member where m_id=?");
		pstmt.setString(1, send_id);
		System.out.println(pstmt+"<-pstmt");
		
		rs = pstmt.executeQuery();
		//System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
		
		if(rs.next()) {
			dbid = rs.getString("m_id");
			dbpw = rs.getString("m_pw");
			dblevel = rs.getString("m_level");
			dbname = rs.getString("m_name");
			dbemail = rs.getString("m_email");
			System.out.println(dbid + "<-- dbid");
			System.out.println(dbpw + "<-- dbpw");
			System.out.println(dblevel + "<-- dblevel");
			System.out.println(dbname + "<-- dbname");
			System.out.println(dbemail + "<-- dbemail"); 

		}
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
	
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}

		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

%>
<form action="<%= request.getContextPath() %>/mupdate/m_update_pro.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="m_id" size="20" value="<%= dbid %>" readonly></td>
<tr>
<tr>
	<td>암호</td>
	<td><input type="text" name="m_pw" size="20" value="<%= dbpw %>"></td>
<tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="m_level" size="20" value="<%= dblevel %>"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="m_name" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="m_email" size="20" value="<%= dbemail %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="수정"></td>
</tr>
</table>
</form>

<%@ include file="/module/hadan.jsp" %>
</body>
</html>
