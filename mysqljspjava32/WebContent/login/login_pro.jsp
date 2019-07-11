<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.ArrayList" %>
<%@ page import="kr.or.ksmart.dao.Mdao" %>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mb" class="kr.or.ksmart.dto.Member"/>
<jsp:setProperty name="mb" property="*"/>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println(id + "<- id");
	System.out.println(pw + "<- pw");
	String alert = null;
	Mdao mlo = new Mdao();
	String result = mlo.mLoginCheck(id, pw);
	System.out.println(result + "<-result");
	if(result.equals("로그인성공")) {
		mb = mlo.mGetForSession(id);
		session.setAttribute("S_ID", mb.getM_id());
		session.setAttribute("S_NAME", mb.getM_name());
		session.setAttribute("S_LEVEL", mb.getM_level());
		alert = "로그인성공";
	}else if(result.equals("비번불일치")) {
		
	}else if(result.equals("아이디불일치")) {
		
	}
	//response.sendRedirect(request.getContextPath()+"/index.jsp");
%>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>


