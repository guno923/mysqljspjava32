<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.sql.Connection" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import="kr.or.ksmart.dao.Mdao" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mb" class="kr.or.ksmart.dto.Member"/>
<jsp:setProperty name="mb" property="*"/>
<%
DriverDB db = new DriverDB();
Connection conn = db.driverDbcon();
System.out.println("#################");
System.out.println(conn + "<-- conn");
Mdao mdb = new Mdao();
mdb.mInsert(mb, conn);

response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
%>