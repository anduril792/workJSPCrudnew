package com.javatpoint.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatpoint.bean.PageBean;
import com.javatpoint.bean.Product;
import com.javatpoint.service.ProductService;

public class PageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String category = request.getParameter("category");
		if(category==null){
			category="";
		}
		int pageSize = 6;
		
		int currentPage = 1;
		String currPage = request.getParameter("currentPage");
		if(currPage!=null&&!"".equals(currPage)){
			currentPage = Integer.parseInt(currPage);
		}
		
		ProductService bs = new ProductService();
		
		PageBean pb = bs.findBooksPage(currentPage,pageSize,category);
		List<Product> list =bs.findAllBooks();
		
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/product_list.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}