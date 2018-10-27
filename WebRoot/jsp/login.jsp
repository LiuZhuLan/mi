<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/login.js"></script>
  </head>
  
  <body>
  
	<jsp:include page="/jsp/head.jsp"></jsp:include>
	
	<div class="container">
	
		<div class="col-md-7">
		<span id="s1"></span>
		</div>
	
		<div class="col-md-5">
			<div style="width:440px;border:1px solid #E7E7E7;padding:20px 0 20px 30px;border-radius:5px;margin-top:60px;background:#fff;">
				<font>用户登录</font>&nbsp;&nbsp;<span style="color: red">${msg }</span>
				<div>&nbsp;</div>
		<form class="form-horizontal" action="${pageContext.request.contextPath }/user?method=login" method="post" onSubmit="return checkForm()">
		  
			<div class="form-group">
		    	<label for="username" class="col-sm-2 control-label">用户名</label>
			    <div class="col-sm-7">
			      <input type="text" class="form-control" id="username" placeholder="请输入用户名" name="username" ">
			      <span class="default" id="nameErr"></span>
			    </div>
		  	</div>
		   <div class="form-group">
			    <label for="password" class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-7">
			      <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password" onBlur="checkPassword()">
			   	  <span class="default" id="passwordErr"></span>
			    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		    	<input type="submit"  width="100" value="登录" name="submit" border="0" style="height:35px;width:100px;color:blue;">
		    </div>
		  </div>
		</form>
		</div>			
		</div>
	</div>
	<jsp:include page="/jsp/tail.jsp"></jsp:include>
  </body>
</html>
