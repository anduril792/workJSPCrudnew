<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" import="com.javatpoint.dao.*,com.javatpoint.bean.*,java.util.*"%>
<jsp:useBean id="user" class="com.javatpoint.bean.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="user" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant">
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
<%
	String name = user.getName();
	User u = UserDao.getRecordByName(name);
	List<OrderForList> list = OrderDaoForList.getAllOrderByUserId(user.getId());
	request.setCharacterEncoding("UTF-8");
	request.setAttribute("list", list);
	
%>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<br />
		<div class="panel panel-default">
			<div class="panel-heading">會員資料</div>
			<table class="table">
				<tr>
					<th>姓名</th>
					<th>密碼</th>
					<th>電子郵件</th>
					<th>性別</th>
					<th>居住地區</th>
				<tr>
					<td><%=u.getName()%></td>
					<td><%=u.getPassword()%></td>
					<td><%=u.getEmail()%></td>
					<td><%=u.getSex()%></td>
					<td><%=u.getCountry()%></td>
			</table>
		</div>
		<a href="UserEditForm.jsp">修改資料</a>
		<hr />
		<div class="panel panel-default">
			<div class="panel-heading">購買紀錄</div>
			<table class="table">
				<tr>
					<th>訂單編號</th>
					<th>出貨狀態</th>
					<th>訂購日期</th>
				</tr>
				<c:forEach items="${list}" var="o">
					<tr>
						<td><a href="OrderItemList.jsp?oid=${o.getId()}">${o.getId()}</a></td>
						<td>${0==o.getPaystate()?"<span style='color:red'>尚未出貨</span>":"<span style='color:blue'>已經出貨</span>"}</td>
						<td>${o.getOrdertime()}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>