<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" import="com.javatpoint.dao.*,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String orderid = request.getParameter("oid");
	List<OrderItemForUser> list = OrderItemDaoForUser.getAllOrderItemByOrderId(orderid);
	request.setCharacterEncoding("UTF-8");
	request.setAttribute("list", list);
%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Soar Like an Eagle 販售各式包包">
<meta name="keywords" content="Soar Like an Eagle 波士頓包 郵差包 腰包 肩背包 托特包">
<title>Soar Like an Eagle</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<div class="container">
		<br />
			<div class="panel panel-default">
			<div class="panel-heading">訂單明細</div>
			<table class="table">
				<tr>
					<th>訂單編號</th>
					<th>產品編號</th>
					<th>金額</th>
					<th>產品名稱</th>
					<th>圖片</th>
					<th>訂購數量</th>
				</tr>
				<c:forEach items="${list}" var="o">
					<tr>
						<td>${o.getOrderId()}</td>
						<td>${o.getId()}</td>
						<td>$<fmt:formatNumber value="${o.getPrice()}" pattern="#" type="number" /></td>
						<td>${o.getName()}</td>
						<td><img src="${o.getImg_url()}" width="150px"></td>
						<td>${o.getBuynum()}</td>
					</tr>
				</c:forEach>
						</table>
		</div>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>