<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%@ page import="kr.or.ksmart.dao.Mdao" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mb" class="kr.or.ksmart.dto.Member"/>
<jsp:setProperty name="mb" property="*"/>

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

<%@ include file="/msearch/m_search_form.jsp" %>


<br>
ȸ�� ����Ʈ <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td><td>����</td><td>����</td>
</tr>
<%
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<-sk");
System.out.println(sv + "<-sv");

Mdao dao = new Mdao();
ArrayList<Member> get_alm = dao.mSearch(sk, sv);
System.out.println(get_alm + "<- get_alm");
System.out.println(get_alm.size() + "<- get_alm.size()");
for(int i=0; i<get_alm.size(); i++) {
	mb = get_alm.get(i);
		%>
		<tr>
		<td><%= mb.getM_id()%></td>
		<td><%= mb.getM_pw()%></td>
		<td><%= mb.getM_level()%></td>
		<td><%= mb.getM_name()%></td>
		<td><%= mb.getM_email()%></td>
		<td>
		<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= mb.getM_id() %>">����</a>
		</td>
		<td>
		<a href="<%= request.getContextPath() %>/mdelete/m_delete_pro.jsp?del_id=<%= mb.getM_id() %>">����</a>
		</td>
	</tr>
		<%
	}

%>
</table>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>
