<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
  <jsp:include page="/jsp/head.jsp"></jsp:include>
  	<div class="container">
		<div class="row">
			<div style="margin:0 auto;margin-top:10px;width:950px;">
				<strong>个人中心</strong>
				<a href="${pageContext.request.contextPath}/jsp/changePrivate.jsp">修改个人信息</a>
				<a href="${pageContext.request.contextPath}/jsp/changePassword.jsp">修改密码</a>
				<table class="table table-bordered">
					<tr>
						<td width="100">用户名</td>
						<td>${uprivate.username }</td>
					</tr>
					<tr>
						<td width="100">邮箱</td>
						<td>${uprivate.email }</td>
					</tr>
					<tr>
						<td width="100">姓名</td>
						<td>${uprivate.name }</td>
					</tr>
					<tr>
						<td width="100">性别</td>
						<td>${uprivate.sex }</td>
					</tr>
					<tr>
						<td width="100">电话</td>
						<td>${uprivate.telephone }</td>
					</tr>
			 	</table>
			 </div>
		</div>
	</div>
<jsp:include page="/jsp/tail.jsp"></jsp:include>
  </body>
</html>
