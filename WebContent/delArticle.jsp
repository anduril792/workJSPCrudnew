<%@page import="com.javatpoint.dao.*"%>
<jsp:useBean id="a" class="com.javatpoint.bean.ProductForList"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>

<%
	ProductDaoForList.delete(a);
	response.sendRedirect("delArticle-success.jsp");
%>