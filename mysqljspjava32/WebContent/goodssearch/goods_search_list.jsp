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
														<!--       /Layout32/css/main.css -->
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>	 

<%@ include file="/goodssearch/goods_search_form.jsp" %>
<table width="100%" border="1">
<tr>
	<td>판매자</td><td>상품명</td><td>카테고리</td><td>가격</td><td>색상</td><td>사이즈</td><td>등록일</td><td>상세정보</td><td>삭제</td>
</tr>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
request.setCharacterEncoding("euc-kr");
String date1 = request.getParameter("datef"); // date1 = null;
String date2 = request.getParameter("datet");
String gprice1 = request.getParameter("gprice1");
String gprice2 = request.getParameter("gprice2");
String gname = request.getParameter("gname");
String gpricet = request.getParameter("pricet");
System.out.println(date1 + "<-date1");
System.out.println(date2 + "<-date2");
System.out.println(gprice1 + "<-gprice1");
System.out.println(gprice2 + "<-gprice2");
System.out.println(gname + "<-gname");
System.out.println(gpricet + "<-gpricet");
Class.forName("com.mysql.jdbc.Driver");

try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev32db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev32id";
	String dbPass = "dev32pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-conn m_search_list.jsp");
	if(date1 == null & date2 == null) {
		pstmt = conn.prepareStatement("SELECT * FROM tb_goods");
		System.out.println(rs + "<-rs goods_search_list.jsp");
	} else if(date1 != null & date2 != null) {
		if(gprice1.equals("")& gprice2.equals("") & gname.equals("") & gpricet != null) {
			pstmt = conn.prepareStatement("select * from tb_goods where g_date between ? and ? order by g_price*1 " + gpricet);
			pstmt.setString(1, date1);
			pstmt.setString(2, date2);
		} else if(gprice1 != null & gprice2 != null & gname.equals("") & gpricet != null){
			pstmt = conn.prepareStatement("select * from tb_goods where g_date between ? and ? and g_price*1 between ? and ? order by g_price*1 " + gpricet);
			int gprice11 = Integer.parseInt(gprice1);
			int gprice22 = Integer.parseInt(gprice2);
			pstmt.setString(1, date1);
			pstmt.setString(2, date2);
			pstmt.setInt(3, gprice11);
			pstmt.setInt(4, gprice22);
		} else if(gprice1.equals("") & gprice2.equals("") & gname != null & gpricet != null) {
			pstmt = conn.prepareStatement("select * from tb_goods where g_name= ? and g_date between ? and ? order by g_price*1 " + gpricet);
			pstmt.setString(1, gname);
			pstmt.setString(2, date1);
			pstmt.setString(3, date2);
		} else if(gprice1 != null & gprice2 != null & gname != null & gpricet != null) {
			pstmt = conn.prepareStatement("select * from tb_goods where g_name= ? and g_date between ? and ? and g_price*1 between ? and ? order by g_price*1 " + gpricet);
			int gprice11 = Integer.parseInt(gprice1);
			int gprice22 = Integer.parseInt(gprice2);
			pstmt.setString(1, gname);
			pstmt.setString(2, date1);
			pstmt.setString(3, date2);
			pstmt.setInt(4, gprice11);
			pstmt.setInt(5, gprice22);
		} else if(gprice1.equals("")& gprice2.equals("") & gname.equals("")) {
			pstmt = conn.prepareStatement("select * from tb_goods where g_date between ? and ?");
			pstmt.setString(1, date1);
			pstmt.setString(2, date2);
		} else if(gprice1.equals("") & gprice2.equals("") & gname != null) {
			pstmt = conn.prepareStatement("select * from tb_goods where g_name= ? and g_date between ? and ?");
			pstmt.setString(1, gname);
			pstmt.setString(2, date1);
			pstmt.setString(3, date2);
		} else if(gprice1 != null & gprice2 != null & gname.equals("")){
			pstmt = conn.prepareStatement("select * from tb_goods where g_date between ? and ? and g_price*1 between ? and ?");
			int gprice11 = Integer.parseInt(gprice1);
			int gprice22 = Integer.parseInt(gprice2);
			pstmt.setString(1, date1);
			pstmt.setString(2, date2);
			pstmt.setInt(3, gprice11);
			pstmt.setInt(4, gprice22);	
		} else if(gprice1 != null & gprice2 != null & gname != null) {
			pstmt = conn.prepareStatement("select * from tb_goods where g_name= ? and g_date between ? and ? and g_price*1 between ? and ?");
			int gprice11 = Integer.parseInt(gprice1);
			int gprice22 = Integer.parseInt(gprice2);
			pstmt.setString(1, gname);
			pstmt.setString(2, date1);
			pstmt.setString(3, date2);
			pstmt.setInt(4, gprice11);
			pstmt.setInt(5, gprice22);
		}
	}
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-rs 555");
	
	while(rs.next()){
		%>
		<tr>
		<td><%= rs.getString("m_id") %></td>
		<td><%= rs.getString("g_name")%></td>
		<td><%= rs.getString("g_cate")%></td>
		<td><%= rs.getString("g_price")%></td>
		<td><%= rs.getString("g_color")%></td>
		<td><%= rs.getString("g_size")%></td>
		<td><%= rs.getString("g_date")%></td>
		<td>
		<a href="<%= request.getContextPath() %>/goodsdetail/goodsdetail.jsp?send_de=<%= rs.getString("g_code")%>">상세정보</a>
		</td>
		<td>
		<a href="<%= request.getContextPath() %>/goodsdelete/goods_delete_pro.jsp?del_id=<%= rs.getString("g_code") %>">삭제</a>
		</td>
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
<%@ include file="/module/hadan.jsp" %>
</body>
</html>