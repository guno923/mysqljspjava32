<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%@ include file = "/goods/goods_insert_form.jsp" %>

<br>
상품 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>판매자</td><td>상품명</td><td>카테고리</td><td>가격</td><td>색상</td><td>사이즈</td>
</tr>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	Class.forName("com.mysql.jdbc.Driver");

	try{

		String jdbcDriver = "jdbc:mysql://localhost:3306/dev32db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev32id";
		String dbPass = "dev32pw";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

		System.out.println(conn + "<-- conn goods_list.jsp");
		
		pstmt = conn.prepareStatement("SELECT * FROM tb_goods");

		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs goods_list.jsp");

 
		while(rs.next()){
%>
		
		<tr>
		<td><%= rs.getString("m_id") %></td>
		<td><%= rs.getString("g_name")%></td>
		<td><%= rs.getString("g_cate")%></td>
		<td><%= rs.getString("g_price")%></td>
		<td><%= rs.getString("g_color")%></td>
		<td><%= rs.getString("g_size")%></td>
		</tr>
		
<%		

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

</table>

