<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="photoCarousel" class=" carousel slide "
		data-ride="carousel">
		<ol class="carousel-indicators" style="margin-top: 50px">
			<li data-target="#photoCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#photoCarousel" data-slide-to="1"></li>
			<li data-target="#photoCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="images/index01.jpg">
			</div>
			<div class="item">
				<img src="images/index02.jpg">
			</div>
			<div class="item">
				<img src="images/index03.jpg">
			</div>
		</div>
		<a class="left carousel-control" href="#photoCarousel"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span></a>
		<a class="right carousel-control" href="#photoCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>