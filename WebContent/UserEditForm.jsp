<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.javatpoint.dao.*,com.javatpoint.bean.*"%>
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
<script type="text/javascript">

	function check() {
		var name = document.getElementById("name");
		var msex = document.getElementById("msex").checked;
		var fsex = document.getElementById("fsex").checked;
		var pwd1 = document.getElementById("pwd1");
		var pwd2 = document.getElementById("pwd2");

		if (pwd1.value != pwd2.value) {
			alert("密碼錯誤。");
			return false;
		}

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
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
		String name = user.getName();
		User u = UserDao.getRecordByName(name);
		
		String sex = u.getSex();
		request.setAttribute("s", sex);
		
		String country = u.getCountry();
		request.setAttribute("c", country);	
	%>
	<div class="container">
		<div class="row ">
			<div class="col-lg-6 col-lg-offset-3 well bs-component">
				<form action="UserEditUser.jsp" method="post"
					onsubmit="return check();" name="userform" class="form-horizontal">
					<fieldset>
						<legend style="text-align:center">會員資料修改</legend>
						<input type="hidden" name="id" value="<%=user.getId()%>" />
						<div class="form-group">
							<label for="inputAccount" class="col-lg-3 control-label">帳號</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="Name" value="<%=u.getName()%>"><span
									id="msg"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-lg-3 control-label">密碼</label>
							<div class="col-lg-9">
								<input type="password" class="form-control" id="pwd1"
									name="password" placeholder="Password"
									value="<%=u.getPassword()%>">
							</div>
						</div>
						<div class="form-group">
							<label for="inputRepassword" class="col-lg-3 control-label">密碼確認</label>
							<div class="col-lg-9">
								<input type="password" class="form-control" id="pwd2"
									name="repassword" placeholder="Password" value="<%=u.getPassword()%>">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-lg-3 control-label">電子信箱</label>
							<div class="col-lg-9">
								<input type="email" class="form-control" id="email" name="email"
									placeholder="Email" value="<%=u.getEmail()%>">
							</div>
						</div>
						<div class="form-group">
							<label for="inputSex" class="col-lg-3 control-label">性別</label>
							<div class="col-lg-9">
								<input type="radio" name="sex" id="msex" value="male"
									${s=="male"? "checked='checked'":"" }  /> 男 <input type="radio" name="sex"
									id="fsex" value="female" ${s=="female"? "checked='checked'":"" } /> 女
							</div>
						</div>
						<div class="form-group">
							<label for="inputCountry" class="col-lg-3 control-label">居住地區</label>
							<div class="col-lg-9">
								<select name="country" style="width:155px" class="form-control">
									<option value="Taipei" ${c=="Taipei"? "selected":"" }>台北</option>
									<option value="Taichung" ${c=="Taichung"? "selected":"" }>台中</option>
									<option value="Tainan" ${c=="Tainan"? "selected":"" }>台南</option>
									<option value="Kaohsiung" ${c=="Kaohsiung"? "selected":"" }>高雄</option>
									<option value="Other" ${c=="Other"? "selected":"" }>其他</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2" style="text-align:right">
								<input type="submit" value="修改" class="btn btn-primary" />
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