<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	
  	</head>
  <body>
  	<form action="${pageContext.request.contextPath}/adminCategory?method=update" method="post">
  		<input type="hidden" name="cid" value="${edit.cid }">
  		分类名称:
  		<input type="text" name="cname" value="${edit.cname }"><br>
  		<input type="submit" value="更改">
  		
  	</form>
  
  </body>

</html>
