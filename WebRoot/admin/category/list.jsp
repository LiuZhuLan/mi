<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	
  	</head>
  <body>
  		<table cellspacing="0" cellpadding="1" rules="all"
			bordercolor="gray" border="1" id="DataGrid1"
			style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: 
			gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 
			100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; 
			BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
			
			<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
				<td align="center" width="18%">
					序号
				</td>
				<td align="center" width="17%">
					分类名称
				</td>
				<td width="7%" align="center">
					编辑
				</td>
				<td width="7%" align="center">
					删除
				</td>
			</tr>
  		<c:forEach items="${list}" var="c" varStatus="vs">
  			<tr>
  			<td align="center">${vs.count}</td>
  			<td align="center">${c.cname }</td>
  			<td align="center">
  				<a href="${pageContext.request.contextPath}/adminCategory?method=getById&cid=${c.cid}">
  				<img src="${pageContext.request.contextPath}/img/i_edit.gif" border="0" style="CURSOR: hand">
  				</a>
  			</td>
  			<td align="center">
  				<a href="${pageContext.request.contextPath}/adminCategory?method=delete&cid=${c.cid}">
  				<img src="${pageContext.request.contextPath}/img/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
  				</a>
  			</td>
  			</tr>
  		</c:forEach>
  	</table>
  
  </body>

</html>
