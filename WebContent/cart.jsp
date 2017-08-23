<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	function changeNum(id, num, totalCount) {
		num = parseInt(num);
		totalCount = parseInt(totalCount);

		if (num < 1) {
			if (confirm("確認要刪除此商品？")) {
				num = 0;
			} else {
				num = 1;
			}
		}

		if (num > totalCount) {
			alert("購買數量不能大於庫存數量！");
			num = totalCount;
		}
		location.href = "${pageContext.request.contextPath}/changeNumServlet?id=" + id + "&num=" + num;
	}
	
	function chkpnum()
	{
		if(cart.)
	}
	
</script>

</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div style="text-align:right; margin:5px ">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;購物車
		</div>
		<c:if test="${not user.isValid() }">
			<div class="col-lg-4 col-lg-offset-4">
				<p>請先登入會員。</p>
				<a href="login.jsp" class="btn btn-primary">會員登入</a>&nbsp;&nbsp;&nbsp;
				<a href="adduserform.jsp" class="btn btn-primary">註冊會員</a>
			</div>
		</c:if>
		<c:if test="${ user.isValid() }">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>序號</th>
						<th>商品名稱</th>
						<th>價格</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th>數量</th>
						<th></th>
						<th>庫存</th>
						<th>小計</th>
						<th>取消</th>
					</tr>
				</thead>
				<c:set var="sum" value="0"></c:set>
				<c:forEach items="${cart }" var="entry" varStatus="vs">
					<tbody>
						<tr>
							<td>${vs.count }</td>
							<td>${entry.key.name }</td>
							<td>${entry.key.price }</td>
							<td><input type="button" value='-'
								class="btn btn-xs btn-success"
								onclick="changeNum('${entry.key.id}','${entry.value-1 }','${entry.key.pnum }')"></td>
							<td><input name="text" class="form-control input-sm"
								readonly="readonly" type="text" value="${entry.value }"
								style="width:36px;text-align:center" /></td>
							<td><input type="button" class="btn btn-xs btn-success"
								value='+'
								onclick="changeNum('${entry.key.id}','${entry.value+1 }','${entry.key.pnum }')"></td>
							</td>
							<td>${entry.key.pnum }</td>
							<td>${entry.value*entry.key.price }</td>
							<td><a
								href="${pageContext.request.contextPath}/changeNumServlet?id=${entry.key.id}&num=0"
								style="color:red; font-weight:bold"
								onclick="return confirm('確認刪除?')">X</a></td>
						</tr>
					</tbody>
					<c:set var="sum" value="${sum+entry.value*entry.key.price }"></c:set>
				</c:forEach>
			</table>
			<div style="text-align:right; padding-right:40px;">
				<font style="color:#FF6600; font-weight:bold">合計：&nbsp;&nbsp;${sum}元</font>
			</div>
			<div style="text-align:right; margin-top:10px">
				<a
					href="${pageContext.request.contextPath}/pageServlet?category=BOSTON"><input
					type="button" class="btn btn-success" value="繼續購物"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="${pageContext.request.contextPath}/order.jsp"><input
					type="button" class="btn btn-success" value="結帳" onclick="changeNum('${entry.key.id}','${entry.value-1 }','${entry.key.pnum }')"></a>
			</div>
		</c:if>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
