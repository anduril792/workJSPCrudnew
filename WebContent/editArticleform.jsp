<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.javatpoint.dao.*,com.javatpoint.bean.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Article Form</title>
</head>
<body>

<%
	String id=request.getParameter("id");
	ProductForList p =ProductDaoForList.getProductById(Integer.parseInt(id));
%>

<h1>Edit Article Form</h1>
<form action="editArticle.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" id="id" value="<%=p.getId() %>"/>
<table>
<p>產品名稱 :<input type="text" name="name" value="<%= p.getName()%>" ></p>
<p>價格 : <input type="text" name="price" id="price" value="<%= p.getPrice() %>" ></p>
<p>種類 : <select name="category" id="category" style="width:155px" value="<%= p.getCategory()%>">
			<option>BOSTON</option>
			<option>TOTE</option>
			<option>MESSENGER</option>
			<option>SHOULDER</option>
			<option>WAIST</option>
			<option>OTHER</option>
</select>
</p>
<p>庫存 : <input type="text" name="pnum" id="pnum" value="<%= p.getPnum()%>"></p>
<p>圖片 : <input type="file" name="file" id="file" value="<%= p.getImg_url()%>"></p>
<p>描述 : <input type="description" name="description" value="<%= p.getDescription()%>"></p>
<tr><td colspan="2"><input type="submit" value="修改"/></td></tr>
</table>
</form>

</body>
</html>