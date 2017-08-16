<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.javatpoint.dao.UserDao,com.javatpoint.bean.*,java.util.*"%>
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
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<div class="container">
		<div style="text-align:right; margin:5px ">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
			後臺管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;商品上架
		</div>
		<c:if test="${user.isValid() }">
			<div class="col-lg-6 col-lg-offset-3 well bs-component">
				<form action="addproduct.jsp" method="post"
					enctype="multipart/form-data" onsubmit="return check();"
					name="userform" class="form-horizontal">
					<fieldset>
						<legend style="text-align:center">商品上架</legend>
						<div class="form-group">
							<label for="inputAccount" class="col-lg-3 control-label">ID</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" id="id" name="id"><span
									id="msg"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputAccount" class="col-lg-3 control-label">產品名稱</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" id="name" name="name"><span
									id="msg"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputAccount" class="col-lg-3 control-label">價格</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" id="price" name="price"><span
									id="msg"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputCountry" class="col-lg-3 control-label">種類</label>
							<div class="col-lg-9">
								<select name="category" id="category" style="width:155px"
									class="form-control">
									<option value="BOSTON">BOSTON</option>
									<option value="TOTE">TOTE</option>
									<option value="MESSENGER">MESSENGER</option>
									<option value="SHOULDER">SHOULDER</option>
									<option value="WAIST">WAIST</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputAccount" class="col-lg-3 control-label">庫存</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" id="pnum" name="pnum"><span
									id="msg"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputAccount" class="col-lg-3 control-label">圖片</label>
							<div class="col-lg-9 ">
								<input type="file" name="file" id="file" class="form-control"><span
									id="msg"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputAccount" class="col-lg-3 control-label">描述</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" name="description"
									id="description"><span id="msg"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2" style="text-align:right">
								<div style="float:left">
									<a href="ArticleListPage.jsp">商品列表</a>
								</div>
								<input type="submit" value="上傳" class="btn btn-primary" />
							</div>
						</div>
					</fieldset>
				</form>
			</div>
	</div>


	</c:if>
	<c:if test="${not user.isValid() }">
		<div class="container">
			<p>請登入會員。</p>
			<a href="login.jsp">會員登入</a> <a href="adduserform.jsp">註冊會員</a>
		</div>
	</c:if>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>