<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
  </head>
  
  <body>
  <!-- 菜单栏 -->
  <div class="container-fluid" style="padding-top:20px">
				<div class="col-md-4" >
					<img src="${pageContext.request.contextPath}/img/logo1.png" />
					<img src="${pageContext.request.contextPath}/img/logo2.jpg" width="150" height="60"/>
				</div>
				<div class="col-md-5">
					<img src="${pageContext.request.contextPath}/img/header.png" />
				</div>
				<div class="col-md-3" style="padding-top:20px">
					<ol class="list-inline">
						<c:if test="${empty user }">
							<a href="${pageContext.request.contextPath }/user?method=registerUI">注册</a>
						 	<a href="${pageContext.request.contextPath }/user?method=loginUI">登录</a>
						 	<a href="${pageContext.request.contextPath }/jsp/cart.jsp">购物车</a>
						</c:if>
						<c:if test="${not empty user }">
							<c:if test="${not empty uprivate}">${uprivate.username }</c:if>
							<c:if test="${empty uprivate}">${user.username }</c:if>  :您好
							<a href="${pageContext.request.contextPath }/user?method=logout">退出</a>
						 	<a href="${pageContext.request.contextPath }/jsp/cart.jsp">购物车</a>
						 	<a href="${pageContext.request.contextPath }/order?method=findAllByPage&currPage=1">我的订单</a>
						 	<a href="${pageContext.request.contextPath }/user?method=showPrivate&uid=${user.uid}">个人中心</a>
						</c:if>
					</ol>
				</div>
			</div>
	<!-- 导航 -->
	<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath }/index">首页</a>
			</div>

			
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul id="menuId" class="nav navbar-nav">
					
				</ul>
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>

			</div>
			
		</div>
		
	</nav>
</div>
  </body>
  <script>
	$(function(){

		$.get("${pageContext.request.contextPath}/category?method=findAll",function(data){
			
			var $ul=$("#menuId");
			$(data).each(function(){
				$ul.append($("<li><a href='${pageContext.request.contextPath}/product?method=getByPage&cid="+this.cid+"&currPage=1'>"+this.cname+"</a></li>"));
			});
		},"json");
	});
</script>
</html>
