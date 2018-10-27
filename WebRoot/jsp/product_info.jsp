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
 			<div style="margin:0 auto;width:950px;">
				<div class="col-md-3">
					<img style="opacity: 1;width:220px;height:220px;" title="" class="medium" src="${pageContext.request.contextPath}/${product.pimage}">
				</div>
				<div class="col-md-6">
				 	<form action="${pageContext.request.contextPath }/cart?method=add" method="post">
				 		<input type="hidden" name="uid" value="${user.uid }">
				 		<input type="hidden" name="pid" value="${product.pid }">
					 	<div><strong>${product.pname }</strong></div>
					 	商城价:${product.shop_price}
					 	参考价:<del>${product.market_price}</del><br>
					 	商品介绍:${product.pdesc }<br>
					 	购买数量:<input type="text" name="count" value="1"><br>
					 	<input type="submit" value="加入购物车">
				 	</form>
				 </div>
 			</div>
 		</div>
 	</div>
 	<jsp:include page="/jsp/tail.jsp"></jsp:include>
  </body>
</html>
