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
				<strong>订单详情</strong>
				<table class="table table-bordered">
					<tr class="warning">
						<th colspan="5">订单编号:${order.oid } </th>
					</tr>
					<tr class="warning">
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
					<c:forEach items="${order.items }" var="oi">
			 			<tr>
				 			<td><img height="100" width="100" src="${pageContext.request.contextPath }/${oi.product.pimage}"></td>
					 		<td>${oi.product.pname }</td>
					 		<td>${oi.product.shop_price }</td>
					 		<td><input type="text" value="${oi.count }" readonly="readonly"></td>
					 		<td>${oi.subtotal}</td>
			 			</tr>
			 		</c:forEach>
			 	</table>
			 </div>
			 <div style="text-align:right;margin-right:120px;">
					商品金额: <strong style="color:#ff6600;">￥${order.total }元</strong>
			 </div>
	 		 <hr/>
			 <form  class="form-horizontal" action="${pageContext.request.contextPath }/order?method=pay&oid=${order.oid}" method="post">
				<div class="form-group">
					<label for="inputAddress" class="col-sm-1 control-label">地址</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputAddress" name="address" placeholder="请输入收货地址">
					</div>
				</div>
				<div class="form-group">
					<label for="inputName" class="col-sm-1 control-label">收货人</label>
					<div class="col-sm-5">
						<input type="text" name="name" class="form-control" id="inputName" placeholder="请输收货人">
					</div>
				</div>
				<div class="form-group">
					<label for="telephone" class="col-sm-1 control-label">电话</label>
					<div class="col-sm-5">
						<input type="text" name="telephone" class="form-control" id="telephone" placeholder="请输入联系方式">
					</div>
				</div>
				  <div class="form-group">
		    		<div class="col-sm-5">
		      			<input type="submit"  value="支付" name="submit">
		    		</div>
		  	    </div>
			 </form>
			 <hr/>
		</div>
	</div>
<jsp:include page="/jsp/tail.jsp"></jsp:include>
  </body>
</html>
