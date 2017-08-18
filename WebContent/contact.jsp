<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div style="text-align:right; margin:5px ">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;聯絡我們</b>
		</div>
		<div class="row ">
			<div class="col-lg-6 col-lg-offset-3 well bs-component">
				<form action="addcontact.jsp" method="post"
					onsubmit="return check();" name="userform" class="form-horizontal">
					<fieldset>
						<legend style="text-align:center">聯絡我們</legend>
						<div class="form-group">
							<label for="inputAccount" class="col-lg-3 control-label" >姓名</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="Name" <%if(user.isValid()){ %>value="${user.getName()}"<%} %> required><span id="msg"  ></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmailt" class="col-lg-3 control-label">電子信箱</label>
							<div class="col-lg-9">
								<input type="email" class="form-control" id="email" name="email"
									placeholder="Email" <%if(user.isValid()){ %>value="${user.getEmail()}"<%} %>>
							</div>
						</div>
						<div class="form-group">
							<label for="inputSubject" class="col-lg-3 control-label">主旨</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" name="subject"
									id="subject" placeholder="Subject" required >
							</div>
						</div>
						<div class="form-group">
							<label for="inputmessage" class="col-lg-3 control-label">訊息</label>
							<div class="col-lg-9">
								<textarea type="text" class="form-control" name="message"
									id="message" placeholder="Message"  rows="8" cols="20" required ></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2" style="text-align:right">
								<input type="submit" value="傳送" class="btn btn-primary" />
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