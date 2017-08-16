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

	function check() {
		var name = document.getElementById("name");
		var msex = document.getElementById("msex").checked;
		var fsex = document.getElementById("fsex").checked;
		var pwd1 = document.getElementById("pwd1");
		var pwd2 = document.getElementById("pwd2");

		var obj = document.getElementById("name").value;
		if (/.*[\u4e00-\u9fa5]+.*$/.test(obj)) {
			alert("帳號不可為中文。");
			return false;
		}

		if (name.value == "" || (msex == false && fsex == false)) {
			if (name.value == "") {
				alert("請填寫帳號。");
				return false;
			} else if (msex == false && fsex == false) {
				alert("未選擇性別。");
				return false;
			}
		}

		return true;
	}

	window.onload = function() {
		var nameElement = document.getElementById("name");
		nameElement.onblur = function() {
			var val = this.value;
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						var msg = document.getElementById("msg");
						if (val == "") {
							msg.innerHTML = "<font color='red'>帳號不可空白</font>";
						} else if (xhr.responseText == "true") {
							msg.innerHTML = "<font color='red'>帳號已存在</font>";
						} else {
							msg.innerHTML = "可以使用";
						}
					}
				}
			}
			xhr.open("get", "${pageContext.request.contextPath }/servlet/ckNameServlet?name=" + val);
			xhr.send(null);
		}
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
					name="userform" class="form-horizontal">
					<fieldset>
						<legend style="text-align:center">新會員註冊</legend>
						<div class="form-group">
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
								<input type="text" class="form-control" id="email" name="email"
									placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputSex" class="col-lg-3 control-label">性別</label>
							<div class="col-lg-9">
								<input type="radio" name="sex" id="msex" value="male"
									checked="checked" /> 男 <input type="radio" name="sex"
									id="fsex" value="female" /> 女
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