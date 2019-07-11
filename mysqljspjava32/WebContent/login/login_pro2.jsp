<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<- id");
System.out.println(pw + "<- pw");

String dbid="id001";
String dbpw="pw001";
String dbname="홍길동";
String dblevel="관리자";		//최고관리자 또는 관리자 또는 판매자 또는 구매자 (권한변경 후 테스트)
if(id.equals(dbid)){
	System.out.println("01_01 아이디 일치");
	if(pw.equals(dbpw)){
		System.out.println("02_01 로그인 성공");
		System.out.println(session);
		//session 영역에 셋팅
		session.setAttribute("S_NAME", dbname);
		session.setAttribute("S_LEVEL", dblevel);
	}else{
		System.out.println("02_02 비번 불일치");
	}
}else{
	System.out.println("01_02 아이디 불일치");
}

response.sendRedirect(request.getContextPath()+"/index.jsp");
%>
