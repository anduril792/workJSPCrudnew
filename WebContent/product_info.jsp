<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="zh-Hant">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Soar Like an Eagle 販售各式包包">
<meta name="keywords" content="Soar Like an Eagle 波士頓包 郵差包 腰包 肩背包 托特包">
<title>Soar Like an Eagle</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<br />
		<div style="text-align:right">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
			<a
				href="${pageContext.request.contextPath}/pageServlet?category=Boston">${b.category }</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${b.name }
		</div>
		<br />

		<div id="photoCarousel" class=" carousel slide " data-ride="carousel">
			<!-- Indicators 瀏覽控制 -->
			<ol class="carousel-indicators" style="margin-top: 50px">
				<li data-target="#photoCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#photoCarousel" data-slide-to="1"></li>
				<li data-target="#photoCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 建立相片清單 -->
			<div class="carousel-inner">
				<div class="item active">
					<img
						src="${pageContext.request.contextPath }/images/${b.id}-d1.jpg">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath }/images/${b.id}-d2.jpg">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath }/images/${b.id}-d3.jpg">
				</div>
			</div>

			<!-- 上一張/下一張控制 -->
			<a class="left carousel-control" href="#photoCarousel"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left"></span></a> <a
				class="right carousel-control" href="#photoCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
		<br /> 商品：${b.name }
		<hr />
		售價：<font color="#FF0000">${b.price }元</font>
		<hr />
		類別：${b.category }
		<hr />
		<p>
			<b>商品介紹：</b>
		</p>${b.description }
		<div style="text-align:center; margin-top:20px">
			<a
				href="${pageContext.request.contextPath }/addCartServlet?id=${b.id}">
				<input type="button" class="btn btn-success" value="購買">
			</a>
		</div>
	</div>
	<jsp:include page="foot.jsp" />
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
