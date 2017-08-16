<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.javatpoint.dao.*,com.javatpoint.bean.*"%>
<jsp:useBean id="user" class="com.javatpoint.bean.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="user" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = user.getName();
	User u = UserDao.getRecordByName(name);
	request.getSession().setAttribute("user", u);

	
%>
<nav class="navbar navbar-inverse ">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">Soar Like an Eagle</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">商品種類 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/pageServlet?category=BOSTON">BOSTON</a></li>
						<li><a
							href="${pageContext.request.contextPath}/pageServlet?category=TOTE">TOTE</a></li>
						<li><a
							href="${pageContext.request.contextPath}/pageServlet?category=MESSENGER">MESSENGER</a></li>
						<li><a
							href="${pageContext.request.contextPath}/pageServlet?category=SHOULDER">SHOULDER</a></li>
						<li><a
							href="${pageContext.request.contextPath}/pageServlet?category=WAIST">WAIST</a></li>
					</ul></li>
				<li><a href="contact.jsp">聯絡我們</a></li>
			<c:if test="${user.isValid() }">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">後臺管理<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="viewusers.jsp">會員管理</a></li>
						<li><a
							href="ArticleListPage.jsp">商品管理</a></li>
						<li><a
							href="OrderListPage.jsp">訂單管理</a></li>
						<li><a
							href="MsgListPage.jsp">訊息管理</a></li>
					</ul></li>
			</c:if>
			</ul>
			<c:if test="${!user.isValid() }">
				<span style="float:right;line-height:60px"><a
					href="login.jsp" style="color:white">會員登入</a></span>
			</c:if>
			<c:if test="${user.isValid() }">
				<div style="float:right;line-height:60px">
					<span><a href="account.jsp" style="color:white">我的帳號</a></span>&nbsp;&nbsp;
					<span><a href="cart.jsp" style="color:white">購物車</a></span>&nbsp;&nbsp;
					<span><a href="logout.jsp" style="color:white"
						onclick="return confirm('確認登出?')">登出</a></span>
				</div>
			</c:if>
		</div>
	</div>
</nav>