<%@ page language="java"
	import="java.util.*,com.javatpoint.bean.*,com.javatpoint.dao.*"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="user" class="com.javatpoint.bean.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="user" />
<%
	String name = user.getName();
	User u = UserDao.getRecordByName(name);
%>
<html lang="zh-Hant">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Soar Like an Eagle 販售各式包包">
<meta name="keywords" content="Soar Like an Eagle 波士頓包 郵差包 腰包 肩背包 托特包">
<title>Soar Like an Eagle</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body class="main">
	<jsp:include page="header.jsp" />
	<div class="container">
		<div style="text-align:right; margin:5px 10px 5px 0px">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;購物車
		</div>
		<form action="${pageContext.request.contextPath }/createOrderServlet"
			method="post">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>序號</th>
						<th>商品名稱</th>
						<th>價格</th>
						<th>類別</th>
						<th>數量</th>
						<th>小計</th>
					</tr>
				</thead>
				<c:set var="count" value="0"></c:set>
				<c:forEach items="${cart }" var="p" varStatus="vs">
					<tbody>
						<tr>
							<td>${vs.count }</td>
							<td>${p.key.name }</td>
							<td>${p.key.price }</td>
							<td>${p.key.category }</td>
							<td><input name="text" type="text" value="${p.value }"
								style="width:36px;text-align:center"  readonly="readonly" class="form-control input-sm" /></td>
							<td>${p.key.price*p.value }</td>
						</tr>
					</tbody>
					<c:set var="count" value="${count+p.key.price*p.value }"></c:set>
				</c:forEach>
			</table>

			<div style="text-align:right; padding-right:40px;">
				<font style="color:#FF6600;font-weight:bold">合計：&nbsp;&nbsp;${count }元</font> <input
					type="hidden" name="money" value="${count }" />
			</div>

			<div class="col-lg-8 col-lg-offset-2">
				<label for="inputSmall" class="control-label">收貨地址：</label><input
					name="receiverAddress" type="text" class=" form-control input-sm "
					type="text" /><br /> <label class="control-label"
					for="inputSmall">收貨人：</label> <input name="receiverName"
					type="text" class="form-control input-sm" type="text" /><br /> <label
					class="control-label" for="inputSmall">聯絡方式：</label> <input
					type="text" name="receiverPhone" class="form-control input-sm"
					type="text" /> <br /> <input type="hidden" value="<%=u.getId()%>"
					id="id" name="id" />
				<p style="text-align:center">
					<input type="submit" class="btn btn-success " value="提交訂單" />
				</p>
			</div>
		</form>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>