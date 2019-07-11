<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="kr.or.ksmart.dto.Member" %>

<%
Member mb = new Member();
mb.setM_id("id009");
mb.setM_pw("pw009");
mb.setM_level("구매자");
mb.setM_name("구구국");
mb.setM_email("email09");

mb.getM_id();
mb.getM_pw();
mb.getM_level();
mb.getM_name();
mb.getM_email();
System.out.println("getM_id()_Member_call.jsp->"+mb.getM_id());
System.out.println("getM_pw()_Member_call.jsp->"+mb.getM_pw());
System.out.println("getM_level()_Member_call.jsp->"+mb.getM_level());
System.out.println("getM_name()_Member_call.jsp->"+mb.getM_name());
System.out.println("getM_email()_Member_call.jsp->"+mb.getM_email());
out.println("getM_id()_Member_call.jsp->"+mb.getM_id());
out.println("<br/>getM_pw()_Member_call.jsp->"+mb.getM_pw());
out.println("<br/>getM_level()_Member_call.jsp->"+mb.getM_level());
out.println("<br/>getM_name()_Member_call.jsp->"+mb.getM_name());
out.println("<br/>getM_email()_Member_call.jsp->"+mb.getM_email());
%>
<table border="1">
<tr>
	<td>아이디</td>
	<td><%= mb.getM_id() %></td>
<tr>
<tr>
	<td>암호</td>
	<td><%= mb.getM_pw() %></td>
<tr>
<tr>
	<td>권한</td>
	<td><%= mb.getM_level() %></td>
<tr>
<tr>
	<td>이름</td>
	<td><%= mb.getM_name() %></td>
<tr>
<tr>
	<td>이메일</td>
	<td><%= mb.getM_email() %></td>
</tr>
</table>