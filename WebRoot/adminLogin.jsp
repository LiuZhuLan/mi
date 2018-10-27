<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/login.js"></script>
  </head>
  
  <body>
  	<br><br>
  	<div style="margin:20 500 10 500"><span style="text-align: center;"><h3>小米商城后台登录</h3></div>
	 	<form action="${pageContext.request.contextPath }/adminUser?method=login" method="post">
	 	<table style="margin: 0 auto">
	 		<tr>
	 		<td>用户名</td>
	 		<td><input type="text" name="username"></td>
	 		</tr>
	 		<tr>
	 		<td>密码</td>
	 		<td><input type="password" name="password"></td>
	 		<td ><span style="color: red">${msg }</span></td>
	 		</tr>
	 		<tr>
	 		<td><input type="submit" value="登录"></td>
	 		</tr>
	 		</table>
	 	</form>
  </body>
</html>
