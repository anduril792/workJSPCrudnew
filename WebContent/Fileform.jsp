<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javatpoint.dao.UserDao,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload page</title>
</head>
<body>

<c:if test="${user.isValid() }">
<form action="addproduct.jsp" method="post" enctype="multipart/form-data" >
<p>ID : <input type="text" name="id" id="id" ></p>
<p>產品名稱 : <input type="text" name="name" id="name" ></p>
<p>價格 : <input type="text" name="price" id="price" ></p>
<p>種類 : <select name="category" id="category" style="width:155px">
			<option>BOSTON</option>
			<option>TOTE</option>
			<option>MESSENGER</option>
			<option>SHOULDER</option>
			<option>WAIST</option>
			<option>OTHER</option>
</select>
</p>
<p>庫存 : <input type="text" name="qte" id="qte" ></p>
<p>圖片 : <input type="file" name="file" id="file" ></p>
<p>描述 : <input type="text" name="description" id="description" ></p>
<p><input type="submit" value="上傳"></p>
</form>
<p><a href="ArticleListPage.jsp" >商品列表</a></p>
</c:if>

<c:if test="${not user.isValid() }">
<p>請登入會員。</p>
<a href="login.jsp" >會員登入</a>
<a href="adduserform.jsp" >註冊會員</a>
</c:if>
</body>
</html>