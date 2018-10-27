<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="pers.lan.mi.bean.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	
  	</head>
  <body>
  	<table cellspacing="0" cellpadding="1" rules="all"
		bordercolor="gray" border="1" 
		style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: 
		gray 1px solid; BORDER-LEFT: gray 1px solid; 
		WIDTH: 100%; WORD-BREAK: break-all; 
		BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
		<tr
			style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

			<td align="center" width="5%">
				序号
			</td>
			<td align="center" width="15%">
				订单编号
			</td>
			<td align="center" width="10%">
				订单金额
			</td>
			<td align="center" width="10%">
				收货人
			</td>
			<td align="center" width="10%">
				电话
			</td>
			<td align="center" width="10%">
				订单状态
			</td>
		</tr>
  		<c:forEach items="${olist}" var="o" varStatus="vs">
  			<tr>
  				<td>${vs.count }</td>
  				<td>${o.oid }</td>
  				<td>${o.total }</td>
  				<td>${o.name }</td>
  				<td>${o.telephone}</td>
  				<td>
  				<c:if test="${o.state==0 }">未付款</c:if>
  				<c:if test="${o.state==1 }"><a href="${pageContext.request.contextPath}/adminOrder?method=updateState&oid=${o.oid}&state=2">发货</a></c:if>
  				<c:if test="${o.state==2 }">等待客户确认收货</c:if>
  				<c:if test="${o.state==3 }">订单完成</c:if>
  				</td>
  			</tr>
  		</c:forEach>
  	</table>
  </body>

</html>
