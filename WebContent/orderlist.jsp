<%@page import="com.javatpoint.dao.*,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int pagenum = 0;
	int pagesize = 0;
	String strPage = "1";
	if (request.getParameter("page") != null) {
		strPage = request.getParameter("page");
	}
	if (strPage.length() > 0 && strPage != null) {
		if (Integer.valueOf(strPage) == 1) {
			pagesize = Integer.valueOf(strPage) * 10;
		} else {
			pagenum = Integer.valueOf(strPage) * 10 - 10;
			pagesize = 10;
		}
	}
	List<OrderForList> list =  OrderDaoForList.getAllOrderByPage(pagenum, pagesize);
	request.setCharacterEncoding("UTF-8");
	request.setAttribute("list", list);

	int TotalNum = OrderDaoForList.OrderSize();
	int TotalPage = (int) Math.ceil(TotalNum / (double) 10);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Users</title>
</head>
<body>

	<div class="container">
		<div style="text-align:right; margin:5px ">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
			後臺管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;訂單列表
		</div>
		<h3>訂單列表</h3>
		<div align="right">
			<form action="OrderListPage.jsp" id="pageform" method="get">
				<select name="page" id="page" onchange="pageform.submit()">
					<%
						for (int i = 1; i <= TotalPage; i++) {
					%>
					<option value="<%=i%>"
						<%if (Integer.valueOf(strPage) == i)
					out.println("selected"); //當onchange="pageform.submit()"存在才有作用%>>第<%=i%>頁
					</option>
					<%
						}
					%>
				</select>
			</form>
		</div>
		<table class="table table-striped table-hover ">
			<thead>
				<tr>
					<th>訂單編號</th>
					<th>金額</th>
					<th>收貨人地址</th>
					<th>收貨人姓名</th>
					<th>收貨人電話</th>
					<th>出貨狀態</th>
					<th>訂購日期</th>
					<th>客戶編號</th>
					<th>刪除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="o">
					<tr>
						<td>${o.getId()}</td>
						<td>$<fmt:formatNumber value="${o.getMoney()}" pattern="#" type="number"/></td>
						<td>${o.getReceiverAddress()}</td>
						<td>${o.getReceiverName()}</td>
						<td>${o.getReceiverPhone()}</td>
						<td>${o.getPaystate()}</td>
						<td>${o.getOrdertime()}</td>
						<td>${o.getUserId()}</td>
						<td><a href="deleteorder.jsp?id=${o.getId()}"
							onclick="return confirm('確認刪除?')"><span
								class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div align="center">
		<ul class="pagination pagination-sm">
			<%
				for (int j = 1; j <= TotalPage; j++) {
			%>
			<li <%if (j == Integer.valueOf(strPage)) {%> <%}%>><a
				href="OrderListPage.jsp?page=<%=j%>">&nbsp<%=j%>&nbsp
			</a></li>
			<%
				}
			%>
		</ul>
	</div>
</body>
</html>