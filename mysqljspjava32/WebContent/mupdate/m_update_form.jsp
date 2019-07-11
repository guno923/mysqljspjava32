<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
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
	Mdao ufdb = new Mdao();
	Member ufdbb = ufdb.mSelectforUpdate(send_id);
%>
<form action="<%= request.getContextPath() %>/mupdate/m_update_pro.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="m_id" size="20" value="<%= ufdbb.getM_id() %>" readonly></td>
<tr>
<tr>
	<td>암호</td>
	<td><input type="text" name="m_pw" size="20" value="<%= ufdbb.getM_pw() %>"></td>
<tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="m_level" size="20" value="<%= ufdbb.getM_level() %>"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="m_name" size="20" value="<%= ufdbb.getM_name() %>"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="m_email" size="20" value="<%= ufdbb.getM_email() %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="수정"></td>
</tr>
</table>
</form>

<%@ include file="/module/hadan.jsp" %>
</body>
</html>
