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
String dbname="ȫ�浿";
String dblevel="������";		//�ְ������ �Ǵ� ������ �Ǵ� �Ǹ��� �Ǵ� ������ (���Ѻ��� �� �׽�Ʈ)
if(id.equals(dbid)){
	System.out.println("01_01 ���̵� ��ġ");
	if(pw.equals(dbpw)){
		System.out.println("02_01 �α��� ����");
		System.out.println(session);
		//session ������ ����
		session.setAttribute("S_NAME", dbname);
		session.setAttribute("S_LEVEL", dblevel);
	}else{
		System.out.println("02_02 ��� ����ġ");
	}
}else{
	System.out.println("01_02 ���̵� ����ġ");
}

response.sendRedirect(request.getContextPath()+"/index.jsp");
%>
