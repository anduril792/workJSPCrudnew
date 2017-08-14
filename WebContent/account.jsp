<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.javatpoint.dao.*,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="user" class="com.javatpoint.bean.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String name=user.getName();
	User u=UserDao.getRecordByName(name);
	List<OrderForList> list = OrderDaoForList.getAllOrderByUserId(u.getId());
	request.setCharacterEncoding("UTF-8");
	request.setAttribute("list",list);
%>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="panel panel-default">
  <!-- Default panel contents -->
  <h1>帳號資料</h1>

  <!-- Table -->
  <table class="table">
  	<div class="panel-heading">會員資料</div>
    <tr><th>姓名</th><th>密碼</th><th>電子郵件</th><th>性別</th><th>城市</th>
	<tr><td><%=u.getName()%></td><td><%=u.getPassword()%></td><td><%=u.getEmail()%></td><td><%=u.getSex()%></td><td><%=u.getCountry()%></td><td><a href="UserEditForm.jsp?id=<%=u.getId() %>" >修改資料</a></td>
  </table>
  <table class="table">
  	<div class="panel-heading">訂單</div>
    <tr><th>Id</th><th>金額</th><th>收貨人地址</th><th>收貨人姓名</th><th>收貨人電話</th><th>出貨狀態</th><th>訂購日期</th></tr>
	<c:forEach items="${list}" var="o">
	<tr><td>${o.getId()}</td><td>${o.getMoney()}</td><td>${o.getReceiverAddress()}</td><td>${o.getReceiverName()}</td><td>${o.getReceiverPhone()}</td><td>${o.getPaystate()}</td><td>${o.getOrdertime()}</td></tr>
	</c:forEach>
  </table>
  
</div>

</body>
</html>

