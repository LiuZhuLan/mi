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
				<div style="margin:0 auto; margin-top:10px;width:950px;">
					<strong>我的订单</strong>
					<table class="table table-bordered">	
						<c:forEach items="${order_list.list }" var="o">
							<tbody>
								<tr class="success">
									<th colspan="5">订单编号:${o.oid } 订单金额:${o.total }
										<c:if test="${o.state==0 }">
											<a href="${pageContext.request.contextPath }/order?method=getById&oid=${o.oid}">付款</a>
											<a href="${pageContext.request.contextPath }/order?method=delete&oid=${o.oid}">删除</a>
										</c:if>
										<c:if test="${o.state==1 }">
											已付款
										</c:if>
										<c:if test="${o.state==2 }">
											<a href="${pageContext.request.contextPath }/order?method=updateState&oid=${o.oid}">确认收货</a>
										</c:if>
										<c:if test="${o.state==3 }">
											已完成
											<a href="${pageContext.request.contextPath }/order?method=delete&oid=${o.oid}">删除</a>
										</c:if>
									</th>
								</tr>
								<tr class="warning">
									<th>图片</th>
									<th>商品</th>
									<th>价格</th>
									<th>数量</th>
									<th>小计</th>
								</tr>
								<c:forEach items="${o.items }" var="oi">
									<tr class="active">
										<td width="60" width="40%">
											<input type="hidden" name="id" value="22">
											<img src="${pageContext.request.contextPath}/${oi.product.pimage}" width="70" height="60">
										</td>
										<td width="30%">
											<a target="_blank">${oi.product.pname }</a>
										</td>
										<td width="20%">
											￥${oi.product.shop_price }
										</td>
										<td width="10%">
											${oi.count }
										</td>
										<td width="15%">
											<span class="subtotal">￥${oi.subtotal }</span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:forEach>	
					</table>
				</div>
			</div>
	</div>
	 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 	<!--分页============================-->
	 	<c:if test="${order_list.currPage!=1}">
			<a href="${pageContext.request.contextPath }/order?method=findAllByPage&currPage=1">首页</a>
			<a href="${pageContext.request.contextPath }/order?method=findAllByPage&currPage=${order_list.currPage-1 }">上一页</a>
		</c:if>	
		<c:forEach begin="1" end="${order_list.totalPage }" var="n">
		<c:if test="${order_list.currPage==n }">
			${n }
		</c:if>
		<c:if test="${order_list.currPage!=n}">
			<a href="${pageContext.request.contextPath }/order?method=findAllByPage&currPage=${n}">${n }</a>	
		</c:if>		
		</c:forEach>
		<c:if test="${order_list.currPage!=order_list.totalPage}">
			<a href="${pageContext.request.contextPath }/order?method=findAllByPage&currPage=${order_list.currPage+1}">下一页</a>
			<a href="${pageContext.request.contextPath }/order?method=findAllByPage&currPage=${order_list.totalPage }">尾页</a>
		</c:if>
			第${order_list.currPage }页/共${order_list.totalPage}页
			
		<!-- 分页结束=======================-->
		<jsp:include page="/jsp/tail.jsp"></jsp:include>
  </body>
</html>
