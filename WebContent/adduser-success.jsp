<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.javatpoint.bean.User,com.javatpoint.dao.UserDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add User Success</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="alert alert-success" role="alert">
  註冊成功。 <a href="#" class="alert-link">an example link</a>. Give it a click if you like.
</div>
<jsp:include page="userform.jsp"></jsp:include>

</body>
</html>