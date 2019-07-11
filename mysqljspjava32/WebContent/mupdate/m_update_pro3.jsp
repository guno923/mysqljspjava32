<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import="kr.or.ksmart.dto.Member" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mb" class="kr.or.ksmart.dto.Member"/>
<jsp:setProperty name="mb" property="*"/>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println("###############");
	System.out.println(conn + "<-- conn_m_update_pro.jsp");
		
	pstmt = conn.prepareStatement("UPDATE tb_member SET m_pw=?,m_level=?,m_name=?,m_email=? WHERE m_id=?");
	pstmt.setString(1, mb.getM_pw());
	pstmt.setString(2, mb.getM_level());
	pstmt.setString(3, mb.getM_name());
	pstmt.setString(4, mb.getM_email());
	pstmt.setString(5, mb.getM_id());
	System.out.println(pstmt+"<-pstmt_m_update_pro.jsp");
		
	int result = pstmt.executeUpdate();
	System.out.println(result +"<-result_m_update_pro.jsp");
		
	response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
	//response.sendRedirect(request.getContextPath()+"/mlist/m_list.jsp");
		
	pstmt.close();
	conn.close();
%>
	