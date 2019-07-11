<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%
Mdao dao = new Mdao();
ArrayList<Member> get_alm = dao.mAllSelect();
System.out.println(get_alm + "<- get_alm");
System.out.println(get_alm.size() + "<- get_alm.size()");
for(int i=0; i<get_alm.size(); i++) {
	Member mb = get_alm.get(i);
	out.println(mb.getM_id() + "<- m.getM_id() <br>");
}
%>