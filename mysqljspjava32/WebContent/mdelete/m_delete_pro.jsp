<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="kr.or.ksmart.dao.Mdao" %>

<%	
	String del_id = request.getParameter("del_id");
	System.out.println(del_id+"<-del_id");
	Mdao ddb = new Mdao();
	ddb.mDelete(del_id);
	
	response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
%>	
	