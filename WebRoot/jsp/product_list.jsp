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
	  	<c:forEach	items="${page.list }" var="p">
				<div class="col-md-2">
					<a href="${pageContext.request.contextPath}/product?method=getById&pid=${p.pid}">
						<img src="${pageContext.request.contextPath}/${p.pimage}" width="170" height="170" style="display: inline-block;">
					</a>
					<p><a href="${pageContext.request.contextPath}/product?method=getById&pid=${p.pid}" style='color:green'>${p.pname}</a></p>
					<p><font color="#FF0000">商城价：&yen;${p.shop_price }</font></p>
				</div>
			</c:forEach>
	 	</div>
	 	<br>
	 	<!--分页============================-->
	 	<c:if test="${page.currPage!=1}">
			<a href="${pageContext.request.contextPath }/product?method=getByPage&cid=${param.cid}&currPage=1">首页</a>
			<a href="${pageContext.request.contextPath }/product?method=getByPage&cid=${param.cid}&currPage=${page.currPage-1 }">上一页</a>
		</c:if>	
		<c:forEach begin="1" end="${page.totalPage }" var="n">
		<c:if test="${page.currPage==n }">
			${n }
		</c:if>
		<c:if test="${page.currPage!=n}">
			<a href="${pageContext.request.contextPath }/product?method=getByPage&cid=${param.cid}&currPage=${n}">${n }</a>	
		</c:if>		
		</c:forEach>
		<c:if test="${page.currPage!=page.totalPage}">
			<a href="${pageContext.request.contextPath }/product?method=getByPage&cid=${param.cid}&currPage=${page.currPage+1}">下一页</a>
			<a href="${pageContext.request.contextPath }/product?method=getByPage&cid=${param.cid}&currPage=${page.totalPage }">尾页</a>
		</c:if>
			第${page.currPage }页/共${page.totalPage}页
			
		<!-- 分页结束=======================-->
	 	</div>
	 	<jsp:include page="/jsp/tail.jsp"></jsp:include>
  </body>
</html>
