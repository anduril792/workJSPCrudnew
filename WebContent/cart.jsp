<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.javatpoint.dao.*,com.javatpoint.bean.*,java.util.*"%>

<script type="text/javascript">
	function changeNum(idArticle, num, totalCount) {
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
			alert("庫存不足！");
			num = totalCount;
		}
		location.href = "${pageContext.request.contextPath}/changeNumServlet?idArticle=" + idArticle + "&num=" + num;
	}
</script>

	<jsp:include page="header.jsp" />
	<div class="container">
		<div style="text-align:right; margin:5px 10px 5px 0px">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;購物車
		</div>

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
						<td>${entry.key.libelle }</td>
						<td>${entry.key.prix }</td>
						<td><input type="button" value='-'
							class="btn btn-xs btn-success"
							onclick="changeNum('${entry.key.idArticle}','${entry.value-1 }','${entry.key.qte }')"></td>
						<td><input name="text" class="form-control input-sm"
							type="text" value="${entry.value }"
							style="width:36px;text-align:center" /></td>
						<td><input type="button" class="btn btn-xs btn-success"
							value='+'
							onclick="changeNum('${entry.key.idArticle}','${entry.value+1 }','${entry.key.qte }')"></td>
						</td>
						<td>${entry.key.qte }</td>
						<td>${entry.value*entry.key.prix }</td>
						<td><a
							href="${pageContext.request.contextPath}/changeNumServlet?idArticle=${entry.key.idArticle}&num=0"
							style="color:#FF0000; font-weight:bold ;text-decoration:none">X</a></td>
					</tr>
				</tbody>



				<c:set var="sum" value="${sum+entry.value*entry.key.prix }">
				</c:set>
			</c:forEach>
		</table>
		<div style="text-align:right; padding-right:40px;">
			<font style="color:#FF6600; font-weight:bold">合計：&nbsp;&nbsp;${sum}元</font>
			</iv>
			<div style="text-align:right; margin-top:10px">
				<a href="${pageContext.request.contextPath}/pageServlet"><input
					type="button" class="btn btn-success" value="繼續購物"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="${pageContext.request.contextPath}/order.jsp"><input
					type="button" class="btn btn-success" value="結帳"></a>
			</div>
			</td>
			</tr>
			</table>
			</td>
			</tr>
			</table>
			</td>
			</tr>
			</table>
		</div>

		<jsp:include page="foot.jsp" />