<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.javatpoint.dao.UserDao,com.javatpoint.bean.User"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	User u = UserDao.getRecordById(Integer.parseInt(id));

	String sex = u.getSex();
	request.setAttribute("s", sex);

	String country = u.getCountry();
	request.setAttribute("c", country);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Form</title>
<script type="text/javascript">
	function check() {
		var name = document.getElementById("name");
		var msex = document.getElementById("msex").checked;
		var fsex = document.getElementById("fsex").checked;
		var pwd1 = document.getElementById("pwd1");
		var pwd2 = document.getElementById("pwd2");
		var email = document.getElementById("email");
		
		
		if(""==name.value){
			alert("帳號不可空白");
			return false;
		}else if(!/^[a-zA-Z]{4,8}$/.test(name.value)){
			alert("帳號需為4~8位英文字母");
			return false;
		}
		
		if(""==pwd1.value){
			alert("密碼不可空白");
			return false;
		}else if(!/^[a-zA-Z0-9]{4,8}$/.test(pwd1.value)){
			alert("密碼需為4~8位英文字母或數字");
			return false;
		}
		
		if(pwd1.value!=pwd2.value){
			alert("兩次密碼輸入不一致");
			return false;
		}	
			
		if (msex == false && fsex == false) {
				alert("未選擇性別。");
				return false;			
		}
		
		if(!/^[^\s]+@[^\s]+\.[^\s]{2,3}$/.test(email.value)){
			alert("email格式不正確");
			return false;		
		}

		return true;
	}
</script>
</head>
<body>
	<div class="container">
	<br/>
		<div class="row ">
			<div class="col-lg-6 col-lg-offset-3 well bs-component">
				<form action="edituser.jsp" method="post" onsubmit="return check();"
					name="userform" class="form-horizontal">
					<input type="hidden" name="id" value="<%=u.getId()%>" />
					<fieldset>
						<legend style="text-align:center">修改會員資料</legend>
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
									name="repassword" placeholder="Password"
									value="<%=u.getPassword()%>">
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
									${s=="male"? "checked='checked'":"" } /> 男 <input type="radio"
									name="sex" id="fsex" value="female"
									${s=="female"? "checked='checked'":"" } /> 女
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