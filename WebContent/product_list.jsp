<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh-Hant">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Soar Like an Eagle 販售各式包包">
<meta name="keywords" content="Soar Like an Eagle 波士頓包 郵差包 腰包 肩背包 托特包">
<title>Soar Like an Eagle</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="main">

	<%@include file="header.jsp"%>
<div class="container">
	<div style="text-align:right; margin:5px 10px 5px 0px">
		<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
		<a
			href="${pageContext.request.contextPath}/pageServlet?category=Boston">${pb.category }</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;商品列表
	</div>
	<h2>商品目錄</h2>
	<hr />
	<h2>${pb.category }</h2>
	&nbsp;&nbsp;&nbsp;&nbsp;共xx種商品
	<hr />
	<div class="row" style="text-align:center">
		<c:forEach items="${pb.products }" var="b" varStatus="vs">
			<div class="col-lg-4" style="margin-bottom:50px">
				<a	href="${pageContext.request.contextPath }/findBookInfoServlet?id=${b.id}" >
					<img src="${pageContext.request.contextPath }/images/${b.img_url }" width="380px" />
					<br />商品:${b.name	}<br />售價:${b.price }
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="pagination" >
				<ul class="pager" >
					<li class="previous " ><a
						href="${pageContext.request.contextPath  }/pageServlet?currentPage=${pb.currentPage==1?1:pb.currentPage-1}&category=${pb.category}">&lt;&lt;上一頁</a>
					</li>
					<li style="line-height:36px">第${pb.currentPage }頁/共${pb.totalPage }頁</li>
					<li class="next"><a
						href="${pageContext.request.contextPath  }/pageServlet?currentPage=${pb.currentPage==pb.totalPage?pb.totalPage:pb.currentPage+1}&category=${pb.category}">下一頁&gt;&gt;</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>
	<jsp:include page="foot.jsp" />
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
