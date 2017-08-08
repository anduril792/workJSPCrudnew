package com.javatpoint.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.javatpoint.bean.Article;
import com.javatpoint.dao.ArticleDao;

public class PageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//導航按鈕的查詢條件
		String category = request.getParameter("category");
		if(category==null){
			category="";
		}
		//初始化每頁顯示的記錄數
		int pagesize = 4;
		
		int page = 1;//當前頁
		String currPage = request.getParameter("page");//從上一頁或下一頁得到的數據
		if(currPage!=null&&!"".equals(currPage)){//第一次訪問資源時，currPage可能是null
			page = Integer.parseInt(currPage);
		}
		
		ArticleDao ad = new ArticleDao();
		List<Article> list = ad.getAllArticleByPage(page, pagesize);
		
		/*if(list!=null){
		request.setAttribute("products", list);
		request.getRequestDispatcher("/admin/products/list.jsp").forward(request, response); 
		}*/
		request.setAttribute("list", list);
		request.getRequestDispatcher("/product_list.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}