<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
  	</head>
  <body>
	<div class=“dtree”>
	<p><a href="javascript: d.openAll();">展示所有</a> | <a href="javascript: d.closeAll();">关闭所有</a></p>
	<script type="text/javascript">
		d = new dTree('d');
		d.add('01',-1,'小米商城');
		d.add('0101','01','分类管理','','','mainFrame');
		d.add('010201','0101','全部分类','${pageContext.request.contextPath}/adminCategory?method=findAll','','mainFrame');
		d.add('010202','0101','添加分类','${pageContext.request.contextPath}/admin/category/add.jsp','','mainFrame');
		d.add('0102','01','商品管理');
		d.add('010201','0102','全部商品','${pageContext.request.contextPath}/adminProduct?method=findAll','','mainFrame');
		d.add('010202','0102','添加商品','${pageContext.request.contextPath}/adminProduct?method=add','','mainFrame');
		d.add('0103','01','订单管理');
		d.add('010301','0103','所有订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState','','mainFrame');
		d.add('010302','0103','未支付订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=0','','mainFrame');
		d.add('010303','0103','已支付订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=1','','mainFrame');
		d.add('010304','0103','已发货订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=2','','mainFrame');
		d.add('010305','0103','已完成订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=3','','mainFrame');
		d.add('0104','01','用户管理');
		d.add('010401','0104','全部用户','${pageContext.request.contextPath}/adminUser?method=findAll','','mainFrame');
		document.write(d);
	</script>
	</div>
  </body>

</html>
