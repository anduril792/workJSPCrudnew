<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.javatpoint.dao.*,com.javatpoint.bean.*,java.util.*"%>

<jsp:include page="header.jsp" />
<div class="container">
	<table width="100%" border="0" cellspacing="0">
		<div style="text-align:right; margin:5px 10px 5px 0px">
			<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/pageServlet?category=Boston">Boston</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${b.name }
		</div>
		<table width="100%%" border="0" cellspacing="0">
			<td width="30%">
				<div class="divbookcover">
					<p>
						<img src="${a.getImg() }" width="213" height="269" border="0" />
					</p>
				</div>				
			</td>
			<td style="padding:20px 5px 5px 5px"><font class="bookname">商品：${a.getLibelle() }</font>
				<hr />
				售價：<font color="#FF0000">${a.getPrix() }元</font>
				<hr />
				類別：${a.getCate() }
				<hr />
				<p>
					<b>商品介紹：</b>
				</p>${a.getDesc() }
				<div style="text-align:center; margin-top:25px">
					<a href="${pageContext.request.contextPath }/addCartServlet?idArticle=${a.getIdArticle()}">
						<input type="button" class="btn btn-success" value="購買">
					</a>
				</div>
			</td>			
		</table>
	</table>
</div>
<jsp:include page="foot.jsp" />