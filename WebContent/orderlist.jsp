<%@page import="com.javatpoint.dao.*,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
		int pagenum = 0;
		int pagesize = 0;
		String strPage = "1";
		if(request.getParameter("page") != null)
		{
			strPage = request.getParameter("page");
		}
		if(strPage.length() > 0 && strPage != null)
		{
			if(Integer.valueOf(strPage) == 1)
			{
				pagesize = Integer.valueOf(strPage) * 10;
			}
			else
			{
				pagenum = Integer.valueOf(strPage)*10-10;
				pagesize = Integer.valueOf(strPage)*10-1;
			}
		}
		List<OrderForList> list= OrderDaoForList.getAllOrderByPage(pagenum, pagesize);
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("list",list);
		
		int TotalNum = OrderDaoForList.OrderSize();
		int TotalPage = (int)Math.ceil(TotalNum / (double)10);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Users</title>
</head>
<body>
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">會員列表</div>

  <!-- Table -->
  <table class="table">
    <tr><th>Id</th><th>金額</th><th>收貨人地址</th><th>收貨人姓名</th><th>收貨人電話</th><th>出貨狀態</th><th>訂購日期</th><th>客戶編號</th></tr>
	<c:forEach items="${list}" var="o">
	<tr><td>${o.getId()}</td><td>${o.getMoney()}</td><td>${o.getReceiverAddress()}</td><td>${o.getReceiverName()}</td><td>${o.getReceiverPhone()}</td><td>${o.getPaystate()}</td><td>${o.getOrdertime()}</td><td>${o.getUserId()}</td><td><a href="deleteorder.jsp?id=${o.getId()}">Delete</a></td></tr>
	</c:forEach>
  </table>
</div>
	<div align="center">
	<form action="OrderListPage.jsp" id="pageform" method="get">
		<select name="page" id="page" onchange="pageform.submit()">
			<%
				for(int i=1;i<=TotalPage;i++)
				{
					%>
					<option value="<%=i%>" <%if(Integer.valueOf(strPage) == i) out.println("selected"); //當onchange="pageform.submit()"存在才有作用%>>第<%=i%>頁</option>
					<% 
				}
			%>
		</select>
	</form>
	</div>
	<div align="center">
		<table>
		<tr>
		<%
			for(int j=1;j<=TotalPage;j++)
			{
				%>
					<td <%if(j == Integer.valueOf(strPage)){%>bgcolor="#FF3300"<%} %>><a href="OrderListPage.jsp?page=<%=j %>">&nbsp<%=j %>&nbsp</a></td>
				<% 
			}
		%>
		</tr>
		</table>
	
	</div>

</body>
</html>