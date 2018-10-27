<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link href="${pageContext.request.contextPath}/css/adminTable.css" rel="stylesheet" type="text/css" />
  	</head>
  <body>
  	<c:if test="${adminUser.type==0}">
  		<a href="${pageContext.request.contextPath}/admin/user/add.jsp">添加管理员</a>
	</c:if>
  		<table cellspacing="0" cellpadding="1" rules="all"
		bordercolor="gray" border="1" 
		style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid
		BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all;
		BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse;
		BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
  		<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
  		
  		<td align="center" width="3%">序号</td>
  		<td align="center" width="5%">用户类型</td>
  		<td align="center" width="5%">用户名称</td>
  		<td align="center" width="5%">真实姓名</td>
  		<td align="center" width="3%">性别</td>
  		<td align="center" width="5%">邮箱</td>
  		<td align="center" width="5%">电话</td>
  		<td align="center" width="5%">账户可用性</td>
  		<c:if test="${adminUser.type==0}">
  		<td  align="center" width="5%">删除</td>
		</c:if>
  		</tr>
  		<c:forEach items="${userList}" var="c" varStatus="vs">
  			<tr>
  			<td align="center">${vs.count}</td>
  			<td align="center">
  			<c:if test="${c.type==1 }">管理员</c:if>
  			<c:if test="${c.type==2 }">普通用户</c:if>
  			</td>
  			<td align="center">${c.username }</td>
  			<td align="center">${c.name }</td>
  			<td align="center">${c.sex }</td>
  			<td align="center">${c.email }</td>
  			<td align="center">${c.telephone }</td>
  			<td align="center">
  			<a href="${pageContext.request.contextPath}/adminUser?method=updateState&uid=${c.uid}">
  				<c:if test="${c.state==0 }">
  					启动
  				</c:if>
  				<c:if test="${c.state==1 }">
  					停用
  				</c:if>
  			</a>
  			</td>
  			<c:if test="${adminUser.type==0}">
  				<td align="center">
  					<a href="${pageContext.request.contextPath}/adminUser?method=delete&uid=${c.uid}"> 
  						<img src="${pageContext.request.contextPath}/img/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
  					</a>
  				</td>
			</c:if>
  			</tr>
  		</c:forEach>
  	</table>
  
  </body>

</html>
