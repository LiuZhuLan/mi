<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
  	<jsp:include page="/jsp/head.jsp"></jsp:include>
  	<!-- 轮播图 -->
  	<div class="container-fluid pu">
  		<div class="col-md-6" style="padding-top: 15px">
  			<img alt="" src="${pageContext.request.contextPath}/img/0.png"">
  		</div>
		<div id="carousel-example-generic" class="carousel slide col-md-6" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="${pageContext.request.contextPath}/img/1.jpg">
					<div class="carousel-caption">

				</div>
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/img/2.jpg">
					<div class="carousel-caption">

				</div>
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/img/3.jpg">
					<div class="carousel-caption">

				</div>
				</div>
			</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	</div>
	
 	<div class="container-fluid">
		<div class="col-md-12">
			<h2>热门商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg"/></h2>
		</div>
		<div class="col-md-3 style="border:1px solid #E7E7E7;border-right:0;padding:0;">
			<img src="${pageContext.request.contextPath}/img/hot.jpg" width="230" height="550" style="display: inline-block;"/>
		</div>
		<div class="col-md-8">
		<c:forEach items="${hotList }" var="h">
			<div class="col-md-3" style="text-align:center;height:250px;padding-right: 10px">
				<a href="${pageContext.request.contextPath }/product?method=getById&pid=${h.pid}">
					<img  src="${pageContext.request.contextPath }/${h.pimage}" width="234" height="200">
				</a>

				<p>	<a href="${pageContext.request.contextPath }/product?method=getById&pid=${h.pid}" style='color:#666'>${h.pname}</a></p>
				<p><font color="#E4393C" style="font-size:16px">&yen;${h.shop_price }</font></p>
			</div>
		</c:forEach>	
		</div>
	</div>


  <div class="container-fluid">
		<div class="col-md-12">
			<h2>最新商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg"/></h2>
		</div>
		<div class="col-md-3 style="border:1px solid #E7E7E7;border-right:0;padding:0;">
			<img src="${pageContext.request.contextPath}/img/hot.jpg" width="230" height="550" style="display: inline-block;"/>
		</div>
		<div class="col-md-8">
		<c:forEach items="${newList }" var="n">
			<div class="col-md-3" style="text-align:center;height:250px;padding-right: 10px">
				<a href="${pageContext.request.contextPath }/product?method=getById&pid=${n.pid}">
					<img  src="${pageContext.request.contextPath }/${n.pimage}" width="234" height="200">
				</a>

				<p>	<a href="${pageContext.request.contextPath }/product?method=getById&pid=${n.pid}" style='color:#666'>${n.pname}</a></p>
				<p><font color="#E4393C" style="font-size:16px">&yen;${n.shop_price }</font></p>
			</div>
		</c:forEach>	
		</div>
	</div>
	
	<jsp:include page="/jsp/tail.jsp"></jsp:include>
  </body>
<script >
			$(function(){    
				$('.carousel').carousel({
				  interval: 2000
				})
			});
		</script>
</html>
