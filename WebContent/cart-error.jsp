<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.javatpoint.bean.*,com.javatpoint.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String pid = request.getParameter("pid");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="header.jsp"%>
	<div class="container" style="margin-top:50px">
		<div class="row">
			<div class="col-lg-4 col-lg-offset-4">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">購買失敗。</h3>
					</div>
					<div class="panel-body">
						<p>產品編號 : <%out.print(pid); %> 已無庫存。</p>
						<p><a href="cart.jsp">回到購物車</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>