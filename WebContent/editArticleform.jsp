<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.javatpoint.dao.*,com.javatpoint.bean.*"%>
<%
	String id = request.getParameter("id");
	ProductForList p = ProductDaoForList.getProductById(Integer.valueOf(id));

	String category = p.getCategory();
	request.setAttribute("c", category);
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
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<br />
		<div class="row ">
			<div class="col-lg-6 col-lg-offset-3 well bs-component">
				<form action="editArticle.jsp" method="post"
					enctype="multipart/form-data" onsubmit="return check();"
					name="userform" class="form-horizontal">
					<input type="hidden" name="id" value="<%=p.getId()%>" />
					<fieldset>
						<legend style="text-align:center">修改商品資料</legend>
						<div class="form-group">
							<label for="inputId" class="col-lg-3 control-label">產品名稱：
								:</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="Name" value="<%=p.getName()%>">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPrice" class="col-lg-3 control-label">價格：
								:</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" name="price" id="price"
									placeholder="Name" value="<%=p.getPrice()%>">
							</div>
						</div>

						<div class="form-group">
							<label for="inputCategory" class="col-lg-3 control-label">種類：
								: </label>
							<div class="col-lg-9">
								<select name="category" id="category" style="width:155px"
									class="form-control" value="<%=p.getCategory()%>">
									<option ${c=="BOSTON"? "selected":"" }>BOSTON</option>
									<option ${c=="TOTE"? "selected":"" }>TOTE</option>
									<option ${c=="MESSENGER"? "selected":"" }>MESSENGER</option>
									<option ${c=="SHOULDER"? "selected":"" }>SHOULDER</option>
									<option ${c=="WAIST"? "selected":"" }>WAIST</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPnum" class="col-lg-3 control-label">庫存：
							</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" name="pnum" id="pnum"
									placeholder="Name" value="<%=p.getPnum()%>">
							</div>
						</div>
						<div class="form-group">
							<label for="inputFile" class="col-lg-3 control-label">圖片</label>
							<div class="col-lg-9 ">
								<input type="file" name="file" id="file" class="form-control" value="C:/Users/Rafa/Workspaces/MyEclipse 2016/JSPCrud/WebContent/<%=p.getImg_url()%>">
							
							</div>
						</div>
						<div class="form-group">
							<label for="inputDescription" class="col-lg-3 control-label">描述</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" name="description"
									id="description" value="<%=p.getDescription()%>">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2" style="text-align:right">
								<div style="float:left">
									<a href="ArticleListPage.jsp" style="float:left;position:absolute;bottom:12px;left:0">商品列表</a>
								</div>
								<input type="submit" value="上傳" class="btn btn-primary" />
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<jsp:include page="foot.jsp" />
</body>
</html>