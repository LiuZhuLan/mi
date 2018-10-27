<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script type="text/javascript">
	   	window.onload= function(){
		document.getElementById('myForm').submit();
	}
	</script>
  </head>
  
  <body>
 	<form id="myForm" action="${pageContext.request.contextPath}/adminUser?method=logout" method="post">
 	
 	</form>
  </body>
</html>
