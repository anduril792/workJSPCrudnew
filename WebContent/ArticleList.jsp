<%@page import="com.javatpoint.dao.*,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
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

		List<ProductForList> list = ProductDaoForList.getAllProductByPage(pagenum, pagesize);
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("list", list);

		int TotalNum = ProductDaoForList.ProductSize();
		int TotalPage = (int) Math.ceil(TotalNum / (double) 10);
	%>
	<div class="container">
		<div style="text-align:right; margin:5px ">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
			後臺管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;商品列表
		</div>
		<h3>商品列表</h3>
		<a href="addfileform.jsp" class="btn btn-primary btn-sm">上架</a>
		<div align="right">
			<form action="ArticleListPage.jsp" id="pageform" method="get">
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
					<th>商品編號</th>
					<th>商品名稱</th>
					<th>價格</th>
					<th>種類</th>
					<th>庫存</th>
					<th>圖片</th>
					<th>描述</th>
					<th>修改</th>
					<th>刪除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="p">
					<tr>
						<td>${p.getId()}</td>
						<td>${p.getName()}</td>
						<td>$<fmt:formatNumber value="${p.getPrice()}" pattern="#" type="number"/></td>
						<td>${p.getCategory()}</td>
						<td>${p.getPnum()}</td>
						<td><img src="${p.getImg_url()}" width="150px"></td>
						<td>${p.getDescription()}</td>
						<td><a href="editArticleform.jsp?id=${p.getId()}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></a></td>
						<td><a href="delArticle.jsp?id=${p.getId()}" onclick="return confirm('確認刪除?')"><span class="glyphicon glyphicon-trash" aria-hidden="true"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="center">
			<ul class="pagination pagination-sm">
				<%
					for (int j = 1; j <= TotalPage; j++) {
				%>
				<li <%if (j == Integer.valueOf(strPage)) {%> <%}%>><a
					href="ArticleListPage.jsp?page=<%=j%>">&nbsp<%=j%>&nbsp
				</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>