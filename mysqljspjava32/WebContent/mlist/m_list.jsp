<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- <%@ include file = "/minsert/m_insert_form.jsp" %> --%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%@ page import="kr.or.ksmart.dao.Mdao" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mb" class="kr.or.ksmart.dto.Member"/>
<jsp:setProperty name="mb" property="*"/>


<br>
ȸ�� ����Ʈ <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td><td>����</td><td>����</td>
</tr>
<%
Mdao dao = new Mdao();
ArrayList<Member> get_alm = dao.mAllSelect();
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

