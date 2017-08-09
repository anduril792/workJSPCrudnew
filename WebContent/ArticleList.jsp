<%@page import="com.javatpoint.dao.*,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Users</title>
</head>
<body>

<h1>商品列表</h1>

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

	List<ProductForList> list = ProductDaoForList.getAllProductByPage(pagenum, pagesize);
	request.setCharacterEncoding("UTF-8");
	request.setAttribute("list",list);
	
	int TotalNum = ProductDaoForList.ProductSize();
	int TotalPage = (int)Math.ceil(TotalNum / (double)10);
%>

<table border="1" width="90%">
<tr><th>Id</th><th>商品名稱</th><th>價格</th><th>種類</th><th>庫存</th><th>圖片</th><th>描述</th><th>修改</th><th>刪除</th></tr>
<c:forEach items="${list}" var="p">
	<tr><td>${p.getId()}</td><td>${p.getName()}</td><td>${p.getPrice()}</td><td>${p.getCategory()}</td><td>${p.getPnum()}</td><td><img src="${p.getImg_url()}"></td><td>${p.getDescription()}</td><td><a href="editArticleform.jsp?id=${p.getId()}">Edit</a></td><td><a href="delArticle.jsp?id=${p.getId()}">Delete</a></td></tr>
</c:forEach>
</table>

<div align="center">
	<form action="ArticleListPage.jsp" id="pageform" method="get">
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
					<td <%if(j == Integer.valueOf(strPage)){%>bgcolor="#FF3300"<%} %>><a href="ArticleListPage.jsp?page=<%=j %>">&nbsp<%=j %>&nbsp</a></td>
				<% 
			}
		%>
		</tr>
		</table>
	
	</div>

<br/><a href="addfileform.jsp">上架</a>

</body>
</html>