<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

DriverDB Ŭ���� �� driverDbcon �޼��带 ȣ���� ������!
<%
Connection conn = null;
DriverDB db = new DriverDB();
conn = db.driverDbcon();
System.out.println("###############");
System.out.println(conn + "<-- conn");
%>
