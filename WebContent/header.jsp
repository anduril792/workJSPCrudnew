<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.javatpoint.dao.*,com.javatpoint.bean.*"%>
<jsp:useBean id="user" class="com.javatpoint.bean.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="user" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = user.getName();
	User u = UserDao.getRecordByName(name);
	if (user.isValid()) {
		request.getSession().setAttribute("user", u);
	}
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
			<span class="navbar-brand" style="color:white">Soar Like an
				Eagle</span>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="index.jsp"><a href="index.jsp"><span
						class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;首頁</a></li>
				<li class="dropdown"><a href="" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><span
						class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>&nbsp;商品種類
						<span class="caret"></span></a>
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
				<li><a href="contact.jsp"><span
						class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;聯絡我們</a></li>
				<c:if test="${user.isAdmin() }">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span class="glyphicon glyphicon-wrench"
							aria-hidden="true"></span>&nbsp;後臺管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="viewusers.jsp">會員管理</a></li>
							<li><a href="ArticleListPage.jsp">商品管理</a></li>
							<li><a href="OrderListPage.jsp">訂單管理</a></li>
							<li><a href="MsgListPage.jsp">訊息管理</a></li>
						</ul></li>
				</c:if>
			</ul>
			<c:if test="${!user.isValid() }">
				<div style="float:right">
					<ul class="nav navbar-nav">
						<li style="float:right;line-height:60px"><a href="login.jsp"><span
								class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;會員登入</a></li>
					</ul>
				</div>
			</c:if>
			<c:if test="${user.isValid() }">
				<div style="float:right">
					<ul class="nav navbar-nav">
						<li><a href="account.jsp"><span
								class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;我的帳號</a></li>&nbsp;&nbsp;
						<li><a href="cart.jsp"><span
								class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp;購物車</a></li>&nbsp;&nbsp;
						<li><a href="logout.jsp" onclick="return confirm('確認登出?')"><span
								class="glyphicon glyphicon-new-window" aria-hidden="true"></span>&nbsp;登出</a></li>
					</ul>
				</div>
			</c:if>
		</div>
	</div>
</nav>