<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/maingy.css" />
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%
	String send_de=request.getParameter("send_de");
	System.out.println(send_de + "<-send_de");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String dbgcode = null;
	String dbgid = null;
	String dbgname = null;
	String dbgcate = null;
	String dbgprice = null;
	String dbgcolor = null;
	String dbgsize = null;
	String dbgdate = null;
	String dbgdesc = null;

	Class.forName("com.mysql.jdbc.Driver");
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/dev32db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev32id";
		String dbPass = "dev32pw";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

		System.out.println(conn + "<-- conn goods_update_form.jsp");
		
		pstmt= conn.prepareStatement("SELECT * FROM tb_goods WHERE g_code=?");
		pstmt.setString(1, send_de);
		System.out.println(pstmt+"<-pstmt goods_update_form.jsp");
		
		rs = pstmt.executeQuery();
		//System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
		
		if(rs.next()) {
			dbgcode = rs.getString("g_code");
			dbgid = rs.getString("m_id");
			dbgname = rs.getString("g_name");
			dbgcate = rs.getString("g_cate");
			dbgprice = rs.getString("g_price");
			dbgcolor = rs.getString("g_color");
			dbgsize = rs.getString("g_size");
			dbgdate = rs.getString("g_date");
			dbgdesc = rs.getString("g_desc");
			System.out.println(dbgcode + "<-- dbgcode");
			System.out.println(dbgid + "<-- dbgid");
			System.out.println(dbgname + "<-- dbgname");
			System.out.println(dbgcate + "<-- dbgcate");
			System.out.println(dbgprice + "<-- dbgprice");
			System.out.println(dbgcolor + "<-- dbgcolor");
			System.out.println(dbgsize + "<-- dbgsize");
			System.out.println(dbgdate + "<-- dbgdate");
			System.out.println(dbgdesc + "<-- dbgdesc");
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
<form action="<%= request.getContextPath() %>/goodsupdate/goods_update_form.jsp" method="post">
<table border="1">
<tr>
	<td>상품코드</td>
	<td><input type="text" name="g_code" size="20" value="<%= dbgcode %>" readonly></td>
<tr>
<tr>
	<td>판매자</td>
	<td><input type="text" name="m_id" size="20" value="<%= dbgid %>" readonly></td>
<tr>
<tr>
	<td>상품명</td>
	<td><input type="text" name="g_name" size="20" value="<%= dbgname %>" readonly></td>
<tr>
<tr>
	<td>카테고리</td>
	<td><input type="text" name="g_cate" size="20" value="<%= dbgcate %>" readonly></td>
<tr>
<tr>
	<td>가격</td>
	<td><input type="text" name="g_price" size="20" value="<%= dbgprice %>" readonly></td>
<tr>
<tr>
	<td>색상</td>
	<td><input type="text" name="g_color" size="20" value="<%= dbgcolor %>" readonly></td>
<tr>
<tr>
	<td>사이즈</td>
	<td><input type="text" name="g_size" size="20" value="<%= dbgsize %>" readonly></td>
<tr>
<tr>
	<td>등록날짜</td>
	<td><input type="text" name="g_date" size="20" value="<%= dbgdate %>" readonly></td>
<tr>
<tr>
	<td>상세설명</td>
	<td><input type="text" name="g_detail" size="20" value="<%= dbgdesc %>" readonly></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="수정하기"></td>
</tr>
</table>
</form>

<%@ include file="/module/hadan.jsp" %>
</body>
</html>