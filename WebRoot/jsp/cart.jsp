<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.0.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/cart.js"></script>
  </head>
  
  <body>
  <jsp:include page="/jsp/head.jsp"></jsp:include>
  	<div class="container">
	  <c:if test="${ empty cart.map}">
	  	<h2>购物车空空如也~~赶紧逛逛去!</h2><br>
	  </c:if>
	  <c:if test="${ not empty cart.map}">
	  	<div class="row">
			<div style="margin:0 auto; margin-top:10px;width:950px;">
				<strong style="font-size:16px;margin:5px 0;">订单详情</strong>
				<table class="table table-bordered"> 
					<tr class="warning">
						<td>商品图片</td>
						<td>商品名称</td>
						<td>商品价格</td>
						<td>商品数量</td>
						<td>小计</td>
						<td>操作</td>
		 			 </tr>
		 	<c:forEach items="${cart.items }" var="item">
		 		<tr>
		 		<td><img height="100" width="100" src="${pageContext.request.contextPath }/${item.product.pimage}"></td>
		 		<td>${item.product.pname }</td>
		 		<td>${item.product.shop_price }</td>
		 		<td>
		 		
		 			<a style="width: 20px;height: 15px;cursor: pointer;border: 2px solid #d9d9d9;"
		 			href="${pageContext.request.contextPath }/cart?method=decrCart&pid=${item.product.pid}">-</a>
		 			<input class="text_box" type="text" value="${item.count }" readonly="readonly">
		 			<a style="width: 20px;height: 15px;cursor: pointer;border: 2px solid #d9d9d9; "
		 			href="${pageContext.request.contextPath }/cart?method=incrCart&pid=${item.product.pid}">+</a>
		 		</td>
		 		<td >${item.subtotal}</td>
		 		<td><a href="${pageContext.request.contextPath }/cart?method=remove&pid=${item.product.pid}">删除</a></td>
		 		</tr>
		 	</c:forEach>
	 			</table>
	 		</div>
	 	</div>
	 	<div style="margin-right:130px;">
			<div style="text-align:right;">
				商品金额: <div id="total"><strong style="color:#ff6600;">￥${cart.total }元</strong></div>
			</div>
			<div style="text-align:right;margin-top:10px;margin-bottom:10px;">
				<a href="${pageContext.request.contextPath }/cart?method=clear" id="clear" class="clear">清空购物车</a>
				<a href="${pageContext.request.contextPath }/order?method=add">提交订单</a>
			</div>
		</div>
	 	</c:if>
	 </div>
	 <jsp:include page="/jsp/tail.jsp"></jsp:include>
  </body>
</html>
