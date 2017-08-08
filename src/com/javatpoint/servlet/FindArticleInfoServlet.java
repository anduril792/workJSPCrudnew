package com.javatpoint.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatpoint.bean.Article;
import com.javatpoint.dao.ArticleDao;

public class FindArticleInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int idArticle = Integer.valueOf(request.getParameter("id"));
		
		ArticleDao ad = new ArticleDao();
		Article article = ad.getArticleById(idArticle);
		
		request.setAttribute("a", article);
		request.getRequestDispatcher("/product_info.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
