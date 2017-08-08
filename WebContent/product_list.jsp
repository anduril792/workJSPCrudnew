<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.javatpoint.dao.*,com.javatpoint.bean.*,java.util.*"%>
<jsp:include page="header.jsp" />
<div class="container">
	<div style="text-align:right; margin:5px 10px 5px 0px">
		<a href="index.jsp">首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
		<a
			href="${pageContext.request.contextPath}/pageServlet?category=Boston">Boston</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;商品列表
	</div>
	<h2>商品目錄</h2>
	<hr />
	<h2>Boston</h2>
	&nbsp;&nbsp;&nbsp;&nbsp;共xx種商品
	<hr />
	<div class="row">
		<c:forEach items="${list }" var="a" varStatus="vs">
			<div class="col-lg-3">
				<a href="${pageContext.request.contextPath }/findArticleInfoServlet?id=${a.getIdArticle()}">
					<img src="${a.getImg()}">
					<br />商品:${a.getLibelle()}<br />售價:${a.getPrix()}
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="pagination">
				<ul class="pager">
					<li class="previous "><a
						href="${pageContext.request.contextPath  }/pageServlet?currentPage=${pb.currentPage==1?1:pb.currentPage-1}&category=${pb.category}">&lt;&lt;上一頁</a>
					</li>
					<li>第${pb.currentPage }頁/共${pb.totalPage }頁</li>
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
