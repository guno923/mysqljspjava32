<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String alert = null;
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println(id + "<- id");
	System.out.println(pw + "<- pw");
	Class.forName("com.mysql.jdbc.Driver");

	try{
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println("###############");
		System.out.println(conn + "<-- conn");
	
		pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-rs longin_pro.jsp");
		if(rs.next()) {
			String rspw = rs.getString("m_pw");
			String rsname = rs.getString("m_name");
			String rslevel = rs.getString("m_level");
			
			if(pw.equals(rspw)) {
				System.out.println("로그인성공");
				alert="로그인성공";
				session.setAttribute("S_NAME", rsname);
				session.setAttribute("S_LEVEL", rslevel);
			} else {
				System.out.println("비번불일치");
				alert="비번불일치";
			}
		} else {
			System.out.println("아이디불일치");
			alert="아이디불일치";
		}
		
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
//response.sendRedirect(request.getContextPath()+"/index.jsp");
%>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>


