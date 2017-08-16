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
	<div class="container">
		<div style="text-align:right; margin:5px ">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;後臺管理
		</div>
		<c:if test="${user.isValid() }">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-4">
					<div class="list-group table-of-contents">
						<a class="list-group-item" href="viewusers.jsp">會員</a> <a
							class="list-group-item" href="ArticleListPage.jsp">商品</a> <a
							class="list-group-item" href="OrderListPage.jsp">訂單</a> <a
							class="list-group-item" href="MsgListPage.jsp">訊息</a>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${not user.isValid() }">
			<div class="row">
				<div class="col-lg-4 col-lg-offset-4">
					<p>請登入會員。</p>
					<a href="login.jsp">會員登入</a>&nbsp;&nbsp;&nbsp; <a
						href="adduserform.jsp">註冊會員</a>
				</div>
			</div>
		</c:if>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>