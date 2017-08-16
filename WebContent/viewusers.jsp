<%@page	import="com.javatpoint.dao.UserDao,com.javatpoint.bean.*,java.util.*"%>
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
			pagesize = Integer.valueOf(strPage) * 10 - 1;
		}
	}
	List<User> list = UserDao.getAllUsersByPage(pagenum, pagesize);
	request.setCharacterEncoding("UTF-8");
	request.setAttribute("list", list);

	int TotalNum = UserDao.UserSize();
	int TotalPage = (int) Math.ceil(TotalNum / (double) 10);
%>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div style="text-align:right; margin:5px ">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
			後臺管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;會員列表
		</div>
		<h3>會員列表</h3>
		<div align="right">
			<form action="viewusers.jsp" id="pageform" method="get">
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
					<th>ID</th>
					<th>姓名</th>
					<th>密碼</th>
					<th>電子郵件</th>
					<th>性別</th>
					<th>居住地區</th>
					<th>修改</th>
					<th>刪除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="u">
					<tr>
						<td>${u.getId()}</td>
						<td>${u.getName()}</td>
						<td>${u.getPassword()}</td>
						<td>${u.getEmail()}</td>
						<td>${u.getSex()}</td>
						<td>${u.getCountry()}</td>
						<td><a href="EditUserPage.jsp?id=${u.getId()}">Edit</a></td>
						<td><a href="deleteuser.jsp?id=${u.getId()}"
							onclick="return confirm('確認刪除?')">Delete</a></td>
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
				href="viewusers.jsp?page=<%=j%>">&nbsp<%=j%>&nbsp
			</a></li>
			<%
				}
			%>
		</ul>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>