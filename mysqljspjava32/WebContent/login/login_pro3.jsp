<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<- id");
System.out.println(pw + "<- pw");
String alert =null;
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver");
String dbid=null;
String dbpw=null;
String dbname=null;
String dblevel=null;
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev32db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev32id";
	String dbPass = "dev32pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn longin_pro3.jsp");
	pstmt = conn.prepareStatement("SELECT m_id,m_pw,m_level,m_name FROM tb_member WHERE m_id=?");
	pstmt.setString(1, id);
	System.out.println(pstmt +"<-pstmt longin_pro3.jsp");
	rs = pstmt.executeQuery();
	//System.out.println(rs.next() + "<-rs.next() longin_pro3.jsp");
	if(rs.next()) {
		System.out.println("아이디일치");
		dbid = rs.getString("m_id");
		dbpw = rs.getString("m_pw");
		dblevel = rs.getString("m_level");
		dbname = rs.getString("m_name");
		//각각컬럼에 담겨있는 값을 콘솔창에 확인
		if(pw.equals(dbpw)) {
			System.out.println("로그인성공");
			alert="로그인성공";
			session.setAttribute("S_ID", dbid);
			session.setAttribute("S_NAME", dbname);
			session.setAttribute("S_LEVEL", dblevel);
		} else {
			System.out.println("비밀번호불일치");
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
%>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>

