<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/register.js"></script>
  </head>
  
  <body>
  <jsp:include page="/jsp/head.jsp"></jsp:include>
  	<div class="container">	

	<div class="col-md-2"></div>
	

	<div class="col-md-8" style="background:#fff;padding:10px 80px;margin:5px;border:7px solid #ccc;">
		<font>修改个人信息</font>
		<form class="form-horizontal" style="margin-top:5px;" action="${pageContext.request.contextPath }/user?method=changePrivate&uid=${uprivate.uid}" method="post" onSubmit="return checkForm()">
		 
			<div class="form-group">
		    	<label for="username" class="col-sm-2 control-label">用户名</label>
		   		<div class="col-sm-6">
		      		<input type="text" class="form-control" value="${uprivate.username}" id="username" placeholder="3到16位（字母，数字，下划线，减号）" name="username" onBlur="checkUserName()">
		      		<span class="default" id="nameErr"></span>
		   		</div>
		 	</div>
		 <!--  for 属性规定 label 与哪个表单元素绑定-->
	
		  <div class="form-group">
		  	<label for="inputEmail" class="col-sm-2 control-label">Email</label>
		    <div class="col-sm-6">
		    	<input type="email" class="form-control" value="${uprivate.email}" id="inputEmail" placeholder="Email" name="email" onBlur="checkEmail()">
		    	<span class="default" id="ErrEmail"></span> 
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="usercaption" class="col-sm-2 control-label">姓名</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" value="${uprivate.name}" id="usercaption" placeholder="请输入姓名" name="name" onBlur="checkName()">
		      <span class="default" id="RnameErr"></span>
		    </div>
		  </div>
		  <div class="form-group opt">  
		  	<label for="inlineRadio1" class="col-sm-2 control-label">性别</label>  
		 	<div class="col-sm-6">
		  		<label class="radio-inline">
		  			<input type="radio" id="inlineRadio1" name="sex" value="男" checked="checked"> 男
				</label>
				<label class="radio-inline">
		  			<input type="radio" id="inlineRadio2" name="sex" value="女"> 女
				</label>
		  </div>
		  </div>		
		  <div class="form-group">
		    <label for="inputTelephone" class="col-sm-2 control-label">电话号码</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" value="${uprivate.telephone}" id="inputTelephone" placeholder="请输入电话号码" name="telephone" onBlur="checkPhone()">		      
		      <span class="default" id="phoneErr"></span> 
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <input type="submit"  value="修改" name="submit">
		    </div>
		  </div>
		</form>
	</div>
	
	<div class="col-md-2"></div>
  
	</div>
	<jsp:include page="/jsp/tail.jsp"></jsp:include>
  </body>
</html>
