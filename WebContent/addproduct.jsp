<%@page import="com.javatpoint.bean.*,com.javatpoint.dao.*,com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="a" class="com.javatpoint.bean.Article" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="a" />
<%
	MultipartRequest multi = new MultipartRequest(request, "C:/Users/T450/eclipse-workspace/JSPCrud/WebContent/images");
    String fname ="images/"+ multi.getFilesystemName("file");
	String id = multi.getParameter("id");
	String name = new String(multi.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
	String description = new String(multi.getParameter("description").getBytes("ISO-8859-1"), "UTF-8");
	Double price = Double.parseDouble(multi.getParameter("price"));
	String category = new String(multi.getParameter("category").getBytes("ISO-8859-1"), "UTF-8");
	int pnum=Integer.parseInt(multi.getParameter("pnum"));
	
	ProductForList act = new ProductForList(id, name, price, category, pnum, fname, description);
	ProductDaoForList dao = new ProductDaoForList();

	if (dao.add(act))
	{ 
		response.sendRedirect("addfile-success.jsp");
	}
	else
	{
		response.sendRedirect("addfile-error.jsp");
	}
%>

