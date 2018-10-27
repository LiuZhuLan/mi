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
		<font>修改密码</font>
		<form class="form-horizontal" style="margin-top:5px;" action="${pageContext.request.contextPath}/user?method=changePassword&uid=${uprivate.uid}" method="post" onSubmit="return checkForm()">
		 
		 <div class="form-group">
		   		<label for="oldPassword" class="col-sm-2 control-label">原密码</label>
		    	<div class="col-sm-6">
		     		<input type="password" class="form-control" id="oldPassword" placeholder="请输入原密码" name="oldPassword">
		    	</div>
		  </div>
		   <div class="form-group">
		   		<label for="password" class="col-sm-2 control-label">新密码</label>
		    	<div class="col-sm-6">
		     		<input type="password" class="form-control" id="password" placeholder="请输入6-12位密码" name="password" onBlur="checkPassword()">
		    		 <span class="default" id="passwordErr"></span>
		    	</div>
		  </div>
		   	<div class="form-group">
		    	<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
		    	<div class="col-sm-6">
		      		<input type="password" class="form-control" id="confirmpwd" placeholder="请输入确认密码" oninput="ConfirmPassword()" onBlur="ConfirmPassword()">
		      		 <span class="default" id="conPasswordErr"></span> 
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
