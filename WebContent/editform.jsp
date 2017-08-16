<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.javatpoint.dao.UserDao,com.javatpoint.bean.User"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Form</title>
</head>
<body>

	<%
		String id = request.getParameter("id");
		User u = UserDao.getRecordById(Integer.parseInt(id));

		String sex = u.getSex();
		request.setAttribute("s", sex);

		String country = u.getCountry();
		request.setAttribute("c", country);
	%>

	<div class="container">
		<div class="row ">
			<div class="col-lg-6 col-lg-offset-3 well bs-component">
				<form action="edituser.jsp" method="post" onsubmit="return check();"
					name="userform" class="form-horizontal">
					<input type="hidden" name="id" value="<%=u.getId()%>" />
					<fieldset>
						<legend style="text-align:center">會員資料修改</legend>
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
									${s=="male"? "checked='checked'":"" } /> 男 <input
									type="radio" name="sex" id="fsex" value="female"
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