<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/jquery-ui-i18n.min.js"></script>

<form action="<%=request.getContextPath()%>/goods/goods_search_list.jsp" method="post">
<script>
$(function() {
	$.datepicker.setDefaults($.datepicker.regional['ko']); //datepicker �ѱ���� ����ϱ� ���� ����
	$('#date1').datepicker();
	$('#date2').datepicker();
});

</script>
<table border="1">
<tr>
<td>��¥</td> 
<td><input type="text" name="datef" id="date1" size="10">~
	<input type="text" name="datet" id="date2" size="10"></td>
<tr>
<tr>
<td>����</td>
<td><input type="text" name="gprice1" id="gprice1" size="10">~
	<input type="text" name="gprice2" id="gprice2" size="10"></td> 
<tr>
<tr>
<td>��ǰ��</td> 
<td><input type="text" name="gname" id="gname" size="10"></td>
<tr>
<tr>
<td><input type="radio" id="hprice" value="hPrice">���� ���ݼ� <input type="radio" id="lprice" value="lPrice">���� ���ݼ�</td>
<tr>
<tr>
<td colspan="4"><input type="submit" value="�˻�"></td>
</tr>
</table>

</form>




