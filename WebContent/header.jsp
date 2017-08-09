<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.javatpoint.dao.*,com.javatpoint.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="user" class="com.javatpoint.bean.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String name=user.getName();
	User u=UserDao.getRecordByName(name);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Soar Like an Eagl</title>
<!-- <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">-->
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Soar Like an Eagle</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="index.jsp"><a href="index.jsp">首頁</a></li>
					<li><a href="login.jsp">會員登入</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">商品種類 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/pageServlet?category=BOSTON">BOSTON</a></li>
							<li><a href="${pageContext.request.contextPath}/pageServlet?category=TOTE">TOTE</a></li>
							<li class="divider"></li>
							<li><a href="#">MESSENGER</a></li>
							<li><a href="#">SHOULDER</a></li>
							<li><a href="#">WAIST</a></li>
							<li class="divider"></li>
							<li><a href="#">OTHER</a></li>
						</ul></li>
					<li><a href="promotion.jsp">好物推薦</a></li>
					<li><a href="contact.jsp">聯絡我們</a></li>
					<li><a href="shoppingcart.jsp">購物車</a></li>
					<li><a href="manager.jsp">後臺管理</a></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
                      <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                      </div>
                      <button type="submit" class="btn btn-default">搜尋</button>
                      <c:if test="${user.isValid() }" >
                      <div>
                      	<span>帳號: <%=user.getName() %></span>
                      	<span>密碼: <%=user.getPassword() %></span>
                      	<span>ID : <%=u.getId()%></span>
                      	<span><a href="account.jsp">會員帳號</a></span>
                      	<span><a href="logout.jsp">登出</a></span>
                      </div>
                      </c:if>
                    </form>
			</div>
		</div>
	</nav>
		<!--  <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><script>-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>