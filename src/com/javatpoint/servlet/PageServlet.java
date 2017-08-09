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
		
		//導航按鈕的查詢條件
		String category = request.getParameter("category");
		if(category==null){
			category="";
		}
		//初始化每頁顯示的記錄數
		int pageSize = 6;
		
		int currentPage = 1;//當前頁
		String currPage = request.getParameter("currentPage");//從上一頁或下一頁得到的數據
		if(currPage!=null&&!"".equals(currPage)){//第一次訪問資源時，currPage可能是null
			currentPage = Integer.parseInt(currPage);
		}
		
		ProductService bs = new ProductService();
		//分頁查詢，并返回PageBean對象
		PageBean pb = bs.findBooksPage(currentPage,pageSize,category);
		List<Product> list =bs.findAllBooks();
		
		/*if(list!=null){
		request.setAttribute("products", list);
		request.getRequestDispatcher("/admin/products/list.jsp").forward(request, response); 
		}*/
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/product_list.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}