<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	
  	</head>
  <body>
  	<h1 style="text-align:center;padding-top: 20px">小米商城后台系统</h1>
  	你好，${adminUser.username }&nbsp;&nbsp;
  	<c:if test="${not empty adminUser }">
  		<input type="button" value="退出系统" onClick="parent.location.href='${pageContext.request.contextPath}/admin/user/logout.jsp'">
  	</c:if>
  </body>

</html>
