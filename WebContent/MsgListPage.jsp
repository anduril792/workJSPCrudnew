<%@page import="com.javatpoint.dao.*,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	List<Msg> list = MsgDao.getAllMsg();
	request.setCharacterEncoding("UTF-8");
	request.setAttribute("list", list);
%>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div style="text-align:right; margin:5px ">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
			後臺管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;訊息列表
		</div>
		<h3>訊息列表</h3>
		<table class="table table-striped table-hover ">
			<thead>
				<tr>
					<th>ID</th>
					<th>姓名</th>
					<th>電子郵件</th>
					<th>主旨</th>
					<th>訊息</th>
					<th>刪除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="m">
					<tr>
						<td>${m.getIdMsg()}</td>
						<td>${m.getMsgName()}</td>
						<td>${m.getMsgEmail()}</td>
						<td>${m.getMsgSub()}</td>
						<td>${m.getMessage()}</td>
						<td><a href="delMsg.jsp?idMsg=${m.getIdMsg()}"
							onclick="return confirm('確認刪除?')">刪除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>