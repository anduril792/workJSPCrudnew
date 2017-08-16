<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.javatpoint.dao.UserDao,com.javatpoint.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="user" class="com.javatpoint.bean.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="user" />

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
	request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript">

	function check() {
		var name = document.getElementById("name");
		var pwd = document.getElementById("password");

		if (name.value == "") {
			alert("請填寫帳號。");
			return false;
		} else if (pwd.value == "") {
			alert("請填寫密碼。");
			return false;
		}
		else
			return true;
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div style="text-align:right; margin:5px ">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;會員登入</b>
		</div>
		<div class="row ">
			<div class="col-lg-4 col-lg-offset-4 well bs-component">
				<form action="check.jsp" method="post" class="form-horizontal"
					onsubmit="return check();">
					<fieldset>
						<legend style="text-align:center">會員登入</legend>
						<div class="form-group">
							<label for="inputAccount" class="col-lg-3 control-label">帳號</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="Name">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-lg-3 control-label">密碼</label>
							<div class="col-lg-9">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="Password">
								<div class="checkbox">
									<label><input type="checkbox">記住我</label> <a
										href="adduserform.jsp" style="float:right">註冊會員</a>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2" style="text-align:right">
								<input type="submit" value="登入" class="btn btn-primary" />
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>