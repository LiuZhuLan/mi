<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	
  	</head>
  <body>
  	<form  action="${pageContext.request.contextPath}/addProduct" method="post" enctype="multipart/form-data">
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td>
						<strong><STRONG>添加商品</STRONG>
						</strong>
					</td>
				</tr>
				<tr>
					<td >
						商品名称：
					</td>
					<td>
						<input type="text" name="pname" />
					</td>
					<td>
						是否热门：
					</td>
					<td>
						<select name="is_hot">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						市场价格：
					</td>
					<td>
						<input type="text" name="market_price" />
					</td>
					<td>
						商城价格：
					</td>
					<td>
						<input type="text" name="shop_price" >
					</td>
				</tr>
				<tr>
					<td>
						商品图片：
					</td>
					<td>
						<input type="file" name="pimage" />
					</td>
				</tr>
				<tr>
					<td>
						所属分类：
					</td>
					<td>
						<select name="cid">
							<c:forEach items="${clist }" var="c">
								<option value="${c.cid }">${c.cname }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td >
						商品描述：
					</td>
					<td >
						<textarea name="pdesc" rows="15" cols="50"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="确定">
						<input type="reset" value="重置">
						<INPUT type="button" onclick="history.go(-1)" value="返回"/>
					</td>
				</tr>
			</table>
  </form>
  </body>

</html>
