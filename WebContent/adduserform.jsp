<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
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
<script type="text/javascript">
	var xhr = null;
	window.onload = function() {
		var nameElement = document.getElementById("name");
		nameElement.onblur = function() {
			var val = this.value;
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						var msg = document.getElementById("msg");
						if (val == "") {
							msg.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;<font color=\"red\"><span class=\"glyphicon glyphicon-hand-up\" aria-hidden=\"true\" style=\"vertical-align:bottom\"></span>&nbsp;帳號不可空白</font>";
							$("#userform").attr("onsubmit","return false;");
							$("#choose").attr("class","form-group has-error");
						}else if (!/^[a-zA-Z0-9]{4,8}$/.test(val)) {
							msg.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;<font color=\"red\"><span class=\"glyphicon glyphicon-hand-up\" aria-hidden=\"true\" style=\"vertical-align:bottom\"></span>&nbsp;帳號需為4~8位英文字母或數字</font>";
							$("#userform").attr("onsubmit","return false;");
							$("#choose").attr("class","form-group has-error");
							
						} else if (xhr.responseText == "true") {
							msg.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;<font color=\"red\"><span class=\"glyphicon glyphicon-hand-up\" aria-hidden=\"true\" style=\"vertical-align:bottom\"></span>&nbsp;帳號已存在</font>";							
							$("#userform").attr("onsubmit","return false;");
							$("#choose").attr("class","form-group has-error");
						} else {
							msg.innerHTML = "";
							$("#userform").attr("onsubmit","return check();");
							$("#choose").attr("class","form-group ");
						}
					}
				}
			}
			xhr.open("get", "${pageContext.request.contextPath }/servlet/ckNameServlet?name=" + val);
			xhr.send(null);
		}
	}

	function check() {
		var name = document.getElementById("name");
		var msex = document.getElementById("msex").checked;
		var fsex = document.getElementById("fsex").checked;
		var pwd1 = document.getElementById("pwd1");
		var pwd2 = document.getElementById("pwd2");
		var email = document.getElementById("email");


		if ("" == name.value) {
			alert("帳號不可空白");
			return false;
		} else if (!/^[a-zA-Z0-9]{4,8}$/.test(name.value)) {
			alert("帳號需為4~8位英文字母或數字");
			return false;
		} else if (xhr.responseText == "true") {
			alert("帳號已存在");
			return false;
		}

		if ("" == pwd1.value) {
			alert("密碼不可空白");
			return false;
		} else if (!/^[a-zA-Z0-9]{4,8}$/.test(pwd1.value)) {
			alert("密碼需為4~8位英文字母或數字");
			return false;
		}

		if (pwd1.value != pwd2.value) {
			alert("兩次密碼輸入不一致");
			return false;
		}

		if (msex == false && fsex == false) {
			alert("未選擇性別。");
			return false;
		}

		if (!/^[^\s]+@[^\s]+\.[^\s]{2,3}$/.test(email.value)) {
			alert("email格式不正確");
			return false;
		}

		return true;
	}
</script>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div style="text-align:right; margin:5px ">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;新會員註冊</b>
		</div>
		<div class="row ">
			<div class="col-lg-6 col-lg-offset-3 well bs-component">
				<form action="adduser.jsp" method="post" onsubmit="return check();"
					name="userform" id="userform" class="form-horizontal">
					<fieldset>
						<legend style="text-align:center">新會員註冊</legend>
						<div class="form-group" id="choose">
							<label for="inputAccount" class="col-lg-3 control-label">帳號</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="Name"><span id="msg"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-lg-3 control-label">密碼</label>
							<div class="col-lg-9">
								<input type="password" class="form-control" id="pwd1"
									name="password" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<label for="inputRepassword" class="col-lg-3 control-label">密碼確認</label>
							<div class="col-lg-9">
								<input type="password" class="form-control" id="pwd2"
									name="repassword" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-lg-3 control-label">電子信箱</label>
							<div class="col-lg-9">
								<input type="email" class="form-control" id="email" name="email"
									placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputSex" class="col-lg-3 control-label">性別</label>
							<div class="col-lg-9" style="line-height:32px">
								<input type="radio" name="sex" id="msex" value="male"
									checked="checked"  /> 男 <input type="radio" name="sex"
									id="fsex" value="female"  /> 女
							</div>
						</div>
						<div class="form-group">
							<label for="inputCountry" class="col-lg-3 control-label">居住地區</label>
							<div class="col-lg-9">
								<select name="country" style="width:155px" class="form-control">
									<option value="Taipei">台北</option>
									<option value="Taichung">台中</option>
									<option value="Tainan">台南</option>
									<option value="Kaohsiung">高雄</option>
									<option value="Other">其他</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2" style="text-align:right">
								<input type="submit" value="註冊" class="btn btn-primary" />
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