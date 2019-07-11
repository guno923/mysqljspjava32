<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%@ include file = "/minsert/m_insert_form.jsp" %>


<br>
회원 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td><td>수정</td><td>삭제</td>
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

		System.out.println(conn + "<-- conn m_list.jsp");
		if(conn != null){
			out.println("01 DB연결 성공");
		}else{
			out.println("02 DB연결 실패");
		}

		pstmt = conn.prepareStatement("SELECT * FROM tb_member");

		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs m_list.jsp");

 
		while(rs.next()){
%>
		
		<tr>
			<td><%= rs.getString("m_id")%></td>
			<td><%= rs.getString("m_pw")%></td>
			<td><%= rs.getString("m_level")%></td>
			<td><%= rs.getString("m_name")%></td>
			<td><%= rs.getString("m_email")%></td>
			<td>
			<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= rs.getString("m_id")%>">수정</a>
			</td>
			<td>
			<a href="<%= request.getContextPath() %>/mdelete/m_delete_pro.jsp?del_id=<%= rs.getString("m_id") %>">삭제</a>
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

