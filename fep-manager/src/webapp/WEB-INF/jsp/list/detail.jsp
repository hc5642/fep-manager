<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FEP �¶��λ���ȸ(${env})</title>
<link rel="stylesheet" type="text/css" href="/css/nanumsquare.css" />
<style>
.headercolumn { border: 0px; width: 99%; color: blue; font-family: d2coding;}
textarea {font-family: d2coding;}
</style>
<script>
function changeData(checkbox) {

	var flatData = "${item.flatData}";
	var utf8Data = "${item.utf8Data}";
	
	if ( checkbox.checked ) {
		document.getElementById("dataArea").value=utf8Data;
	} else {
		document.getElementById("dataArea").value=flatData;
	}
}
function toggleView() {
	var area = document.getElementById("toggle");
	if ( area.style.display == "" || area.style.display == "block" ) {
		area.style.display = "none";
	} else {
		area.style.display = "block";
	}
}
function toggleView2() {
	var area = document.getElementById("toggle2");
	if ( area.style.display == "" || area.style.display == "block" ) {
		area.style.display = "none";
	} else {
		area.style.display = "block";
	}
}
function init() {
	var input="${fn:substring(item.msgDataStr,0,500)}";
	var colsize = [8,3,1,14,8,8,2,32,1,6,3,1,12,2,2,1,1,1,16,13,13,15,1,1,1,1,1,3,32,12,1,1,32,3,3,2,10,10,23,20,1,15,5,15,14,15,5,14,1,1,2,92];
	var pointer = 0;
	var targetcol = document.getElementsByName("comHeadercols");
	for ( var i=0; i< targetcol.length; i++) {
		targetcol[i].value = "["+input.substr(pointer, colsize[i])+"]";
		pointer += colsize[i];
	}
	document.getElementById("toggle").style.display = "none";
	document.getElementById("toggle2").style.display = "none";
}
function user_parsing() {
	var input=document.getElementById("stdtx500").value;
	var colsize = [8,3,1,14,8,8,2,32,1,6,3,1,12,2,2,1,1,1,16,13,13,15,1,1,1,1,1,3,32,12,1,1,32,3,3,2,10,10,23,20,1,15,5,15,14,15,5,14,1,1,2,92];
	var pointer = 0;
	var targetcol = document.getElementsByName("comHeadercols");
	for ( var i=0; i< targetcol.length; i++) {
		targetcol[i].value = "["+input.substr(pointer, colsize[i])+"]";
		pointer += colsize[i];
	}
}
</script>
</head>
<body onload="init();">
<H2 style="font-family: se-nanumsquare;">FEP �¶��λ���ȸ(${env}) - ${item.instCode}/${item.applCode}</H2>
<table style="width: 100%;">
<tr>
	<th colspan="8">�ŷ� �⺻ ����</th>
</tr>
<tr>
	<th style="background-color: rgb(232,228,235);">����ڵ�</th>
	<td>${item.instName}</td>
	<th style="background-color: rgb(232,228,235);">�����ڵ�</th>
	<td>${item.applName}</td>
</tr>
<tr>
	<th style="background-color: rgb(232,228,235);">���������ڵ�</th>
	<td>${item.kindCode}</td>
	<th style="background-color: rgb(232,228,235);">�ŷ������ڵ�</th>
	<td>${item.txCode}</td>
</tr>
<tr>
	<th style="background-color: rgb(232,228,235);">�ŷ���</th>
	<td><b>${item.txName}</b></td>
	<th style="background-color: rgb(232,228,235);">�ŷ�������ȣ</th>
	<td>${item.trxSeqNum}</td>
</tr>
<tr>
	<th style="background-color: rgb(232,228,235);">�ŷ���¥</th>
	<td>${fn:substring(item.procDate,0,4)}-${fn:substring(item.procDate,4,6)}-${fn:substring(item.procDate,6,8)}</td>
	<th style="background-color: rgb(232,228,235);">�ŷ��ð�</th>
	<td>${fn:substring(item.procMtime,0,2)}:${fn:substring(item.procMtime,2,4)}:${fn:substring(item.procMtime,4,6)}.${fn:substring(item.procMtime,6,9)}</td>
</tr>
<tr>
	<th style="background-color: rgb(232,228,235);">�����ڵ�</th>
	<td>${item.trxRespCode }</td>
	<th style="background-color: rgb(232,228,235);">txTime</th>
	<td>${item.txTime}</td>
</tr>
<tr>
	<th style="background-color: rgb(232,228,235);">���������</th>
	<td>${item.headerSize}</td>
	<th style="background-color: rgb(232,228,235);">txUid</th>
	<td>${item.txUid}</td>
</tr>
<tr>
	<th style="background-color: rgb(232,228,235);">��Ÿ����</th>
	<td colspan="3">${item.resFlag}/${item.procHour}/${item.xid}/${item.txState}/${item.sessionIndex}/${item.headMappingType}/${item.bodyMappingType}
	<c:if test="${item.txCode eq '300000'}">
		���������ڵ�:${fn:substring(item.flatData,73,76)}
	</c:if>
	</td>
</tr>
<tr>
	<th style="background-color: rgb(232,228,235);">������ġ</th>
	<td colspan="3">[${item.errCode}] ${errMsg}</td>
</tr>
<tr>
	<th colspan="8">��� ���� 500bytes <input type="button" onclick="toggleView();" value="�Ľ̺���" /></th>
</tr>
<tr>
	<td colspan="8">
		<textarea rows="5" style="width: 100%;" id="stdtx500">${fn:substring(item.msgDataStr,0,500)}</textarea>
		<blockquote id="toggle">
		<h4>�� ǥ��������� �Ľ̰�� - <input type="button" value="�ٽ��Ľ��ϱ�" onclick="user_parsing();" /></h4>
		<table style="width: 100%; font-size: 9pt; line-height: 130%">
			<tr><th>tlgrLen</th>		<td>��������(8)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>strd_tlgr_vrsn</th>	<td>��������(3)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>ecryApplctnYn</th>	<td>��ȣȭ����(1)<br/><font color=#CCCCCC style="font-size: 8pt;">('0'=��ȣȭ ������, '1'=��ȣȭ ����)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>tlgrWrtnDt</th>		<td>�����ۼ� �Ͻ�(14)<br/><font color=#CCCCCC style="font-size: 8pt;">(YYYYMMDDhhmmss)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>tlgrCrtnSysNm</th>	<td>�������� �ý���(8)<br/><font color=#CCCCCC style="font-size: 8pt;">(��Ÿ ��ϵ� �ý��۸�)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>tlgrSrlNo</th>		<td>���� �Ϸù�ȣ(8)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>tlgrPrgrsNo</th>	<td>�ŷ����ӹ�ȣ(2)<br/><font color=#CCCCCC style="font-size: 8pt;">(����='01', �ִ�='99')</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>orgnlTx</th>		<td>���ŷ� Global ID(32)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>ttlUseYn</th>		<td>TTL ��� ����(1)<br/><font color=#CCCCCC style="font-size: 8pt;">('0'=TTL �̻��, '1'=TTL ���)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>frstStartTm</th>	<td>���� ���۽ð�(6)<br/><font color=#CCCCCC style="font-size: 8pt;">(HHMMSS)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>mntcTm</th>			<td>���� �ð�(3)<br/><font color=#CCCCCC style="font-size: 8pt;">(001~999)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>msgTpDscd</th>		<td>�޽��� ���� �����ڵ�(1)<br/><font color=#CCCCCC style="font-size: 8pt;">('0'=�Ϲݰŷ�, '1'=��ε�ĳ����)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>scrnId</th>			<td>scrnId(12) </td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>natCd</th>			<td>natCd(2) </td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>lngDscd</th>		<td>lngDscd(2) </td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>crctnCnclDscd</th>	<td>������� �����ڵ�(1)<br/><font color=#CCCCCC style="font-size: 8pt;">('1'=����, '2'=���, '3'=����)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>bizOpngYn</th>		<td>�������� ����(1)<br/><font color=#CCCCCC style="font-size: 8pt;">(0=���� �̰���, 1=���� ����)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>clsgPstBizYn</th>	<td>�����İŷ� ����(1)<br/><font color=#CCCCCC style="font-size: 8pt;">(0=���� �ŷ�, 1=������ �ŷ�)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>mciIntfId</th>		<td>MCI �������̽� ID(16)<br/><font color=#CCCCCC style="font-size: 8pt;">(�����ڵ�(13)+'V'+�Ϸù�ȣ(2))</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>rcvSrvcCd</th>		<td>���� ���� �ڵ�(13)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>rsltRcvSrvcCd</th>	<td>��� ���� ���� �ڵ�(13)<br/><font color=#CCCCCC style="font-size: 8pt;">(sync�̸� space(13), <br/>async�̸� ������Žý����� ���ż���)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>eaiIntfId</th>		<td>EAI �������̽� ID(15)<br/><font color=#CCCCCC style="font-size: 8pt;">(�ҽ��ý���(3), Ÿ�ٽý���(3), �Ϸù�ȣ(5))</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>syncDscd</th>		<td>���� �����ڵ�(1)<br/><font color=#CCCCCC style="font-size: 8pt;">('S'=sync, 'A'=async)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>asyncAtrbtDscd</th>	<td>Async �Ӽ� �����ڵ�(1)<br/><font color=#CCCCCC style="font-size: 8pt;">('0'=�ܹ���, '1'=�����)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>reqRspnsDscd</th>	<td>��û ���� �����ڵ�(1)<br/><font color=#CCCCCC style="font-size: 8pt;">('S'=��û, 'R'=����)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>xaTxDscd</th>		<td>XA�ŷ� �����ڵ�(1)<br/><font color=#CCCCCC style="font-size: 8pt;">('0'=non XA, 'T'=XA)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>exctnModeDscd</th>	<td>������ �����ڵ�(1)<br/><font color=#CCCCCC style="font-size: 8pt;">('P'=�, 'T'=������¡, 'D'=����, 'R'=DR)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>chnlDscd</th>		<td>��������ä�α����ڵ�(3)<br/><font color=#CCCCCC style="font-size: 8pt;">('COR'=����, 'CAS'=�ݼ���, 'INB'=�ι�,<br/>'SMB'=����, 'TEB'=�ڷ���ŷ, 'UMS')</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>ipAddr</th>			<td>IP �ּ�(32)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>macAddr</th>		<td>MAC �ּ�(12)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>mciNodNo</th>		<td>MCI ����ȣ(1)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>mciInstcNo</th>		<td>MCI �ν��Ͻ���ȣ(1)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>mciSssidNo</th>		<td>MCI ����ID ��ȣ(32)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>extrInstCd</th>		<td>��ܱ�� �ڵ�(3)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>extrBizDscd</th>	<td>��ܾ��� �����ڵ�(3)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>extrBizDtlsDscd</th>	<td>��ܾ��� ���α����ڵ�(2)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>jntntClsCd</th>		<td>������ �����ڵ�(10)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>jntntTxDscd</th>	<td>������ �ŷ������ڵ�(10)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>sysIntfId</th>		<td>�ý����������̽� �ĺ���(23)<br/><font color=#CCCCCC style="font-size: 8pt;">('Ext'+���(3)+��������(3)+��ް���(1)+<br/>�������(1)+�ŷ�(2)+�Ϸ�(4)+'Intrfc'(6))</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>linkTlgrTraceNo</th>	<td>�������� ������ȣ(20)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>linkSnrcDscd</th>	<td>���� �۽ż��� �����ڵ�(1)<br/><font color=#CCCCCC style="font-size: 8pt;">('1'=��޿�û, '2'=�������,<br/>'3'=������û, '4'=��������)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>custId</th>			<td>�� �ĺ���(15)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>filler</th>			<td>Filler(5)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>custRprsnId</th>	<td>�������� �ĺ���(15)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>deptId</th>			<td>�μ� �ĺ���(14)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>staffId</th>		<td>������ �ĺ���(15)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>filler</th>			<td>Filler(5)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>tlgrRspnsDttm</th>	<td>�������� �Ͻ�(14)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>prcsRsltDscd</th>	<td>ó����� �����ڵ�(1)</td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>outpTlgrTpCd</th>	<td>������� �����ڵ�(1)<br/><font color=#CCCCCC style="font-size: 8pt;">('0'=����, '1'=����)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>tlgrCtntNo</th>		<td>���� ���ӹ�ȣ(2)<br/><font color=#CCCCCC style="font-size: 8pt;">('1'=������, '2'=����������, '3'=�������߰�,<br/>'4'=����������, '9'=Dummy Return)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
			<tr><th>filler</th>			<td>��ü Filler(92)<br/><font color=#CCCCCC style="font-size: 8pt;">(FEP ���ο��� ���-[408,4]ȸ������,<br/>[412,8]�����������Ű,[420,3]�����ڵ�,<br/>[423,50]�����޽���)</font></td>	<td><input type="text" name="comHeadercols" class="headercolumn" /></td></tr>
		</table>
		</blockquote>
	</td>
</tr>
<tr>
	<th colspan="8">������ ���� ${item.flatDataLength }bytes <input type="checkbox" onclick="changeData(this);" /> UTF-8 <input type="button" onclick="toggleView2();" value="�Ľ̺���" /></th>
</tr>
<tr>
	<td colspan="8">
		<textarea rows="10" style="width: 100%;" id="dataArea">${item.flatData}</textarea>
		<blockquote id="toggle2">
			<h4>�� �������� �Ľ̰��</h4>
			${parseData}
		</blockquote>
	</td>
</tr>
<tr>
	<th colspan="8">HEXA DATA</th>
</tr>
<tr>
	<td colspan="8">
		<textarea rows="10" style="width: 97%;" >${item.hexaData}</textarea>
	</td>
</tr>
<tr>
</tr>
</table>
<p align="center">
	<input type="button" value="CLOSE" onclick="window.open('','_self').close();" />
</p>
<span style="font-weight: bold; color: #C8F03C; background-color: #0F005F; font-family: se-nanumsquare; font-size: 8pt;">Kbank</span>
</body>
</html>