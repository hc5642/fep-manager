<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FEP SMS LIST(${env})</title>
<link rel="stylesheet" type="text/css" href="/css/nanumsquare.css" />
<style>
tr:hover {
	background: #f6ffdd !important;
}
pre { font-family: Courier New; font-size: 10pt; }
textarea { font-family: Courier New; font-size: 10pt; }
</style>
</head>
<body>
<div style="float: right; padding-right: 15px; padding-top:12px;">
	<span style="color: #FFF;">
		<a href="/log/list">�¶��� �α���ȸ</a> | 
		<a href="/log/listbat">��ġ �α���ȸ</a> | 
	</span>
	<img src="/images/kbank_logo.gif" height="30px" style="vertical-align: middle;" />
</div>
<h1>FEP SMS LIST(${env})</h1>
<dl>
	<dd>FEP�� ��ϵ� SMS ������ ����Ʈ</dd>
</dl>
<h3>ONLINE</h3>
<blockquote>
<ul>
	<li>${sms1 }</li>
</ul>
<table style="width: 100%;">
<tr>
	<th>����/���</th>
	<th>�����</th>
	<th>������</th>
	<th>�߼۽���</th>
	<th>�߼�����</th>
	<th>���Ϲ߼�</th>
	<th>����ڸ���Ʈ</th>
</tr>
<c:forEach var="row" items="${online}">
<tr>
	<td align="center">${row.id }</td>
	<td align="center">${row.instName }</td>
	<td align="center">${row.applName }</td>
	<td align="center">${row.startTime }</td>
	<td align="center">${row.endTime }</td>
	<td align="center">${row.holydayYn }</td>
	<td>${row.target }</td>
</tr>
</c:forEach>
</table>
</blockquote>

<h3>BATCH</h3>
<blockquote>
<ul>
	<li>${sms2 }</li>
</ul>
<table style="width: 100%;">
<tr>
	<th>����/���</th>
	<th>�����</th>
	<th>������</th>
	<th>�߼۽���</th>
	<th>�߼�����</th>
	<th>���Ϲ߼�</th>
	<th>����ڸ���Ʈ</th>
</tr>
<c:forEach var="row" items="${batch}">
<tr>
	<td align="center">${row.id }</td>
	<td align="center">${row.instName }</td>
	<td align="center">${row.applName }</td>
	<td align="center">${row.startTime }</td>
	<td align="center">${row.endTime }</td>
	<td align="center">${row.holydayYn }</td>
	<td>${row.target }</td>
</tr>
</c:forEach>
</table>
</blockquote>
<span style="font-weight: bold; color: #C8F03C; background-color: #0F005F; font-family: se-nanumsquare; font-size: 8pt;">Kbank</span>
</body>
</html>