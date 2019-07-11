<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%@ include file = "/msearch/m_search_form.jsp" %>
<br>
회원 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td><td>수정</td><td>삭제</td>
</tr>

<%
	request.setCharacterEncoding("euc-kr");
	String sk = request.getParameter("sk");
	String sv = request.getParameter("sv");
	System.out.println(sk + "<-sk");
	System.out.println(sv + "<-sv");
	
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

		System.out.println(conn + "<-- conn m_search_list2.jsp");
		if(sk == null & sv == null) {
			System.out.println("01 sk sv 둘다 null조건");
			pstmt = conn.prepareStatement("SELECT * FROM tb_member");
		} else if(sk != null & sv.equals("")) {
			System.out.println("02 sk null 아니고 sv 공백조건");
			pstmt = conn.prepareStatement("SELECT * FROM tb_member");
		} else if(sk != null & sv != null) {
			System.out.println("03 sk sv 둘다 null이 아닌 조건");
			if(sk.equals("m_id")){
				
				pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
			}else if(sk.equals("m_level")){
				pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_level=?");
				
			}else if(sk.equals("m_name")){
				pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_name=?");
				
			}else if(sk.equals("m_email")){
				pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_email=?");
				
			}
			
			pstmt.setString(1, sv);
		}
		out.println(pstmt + "<-pstmt m_search_list2.jsp");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- m_search_list2.jsp");

 
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