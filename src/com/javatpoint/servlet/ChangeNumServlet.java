package com.javatpoint.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javatpoint.bean.Article;

public class ChangeNumServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idArticle = Integer.valueOf(request.getParameter("idArticle"));
		String num = request.getParameter("num");

		Article a = new Article();
		a.setIdArticle(idArticle);
		
		HttpSession session = request.getSession();
		Map<Article, String> cart = (Map<Article, String>) session.getAttribute("cart");
		if("0".equals(num)){
			cart.remove(a);
		}
		if(cart.containsKey(a)){
			cart.put(a, num);
		}
		
		response.sendRedirect(request.getContextPath()+"/cart.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
