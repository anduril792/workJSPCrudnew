package com.javatpoint.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javatpoint.bean.Product;
import com.javatpoint.service.ProductService;

public class AddCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		
		ProductService bs = new ProductService();
		
		Product b = bs.findBookById(id);
		
		HttpSession session = request.getSession();
		Map<Product, String> cart = (Map<Product, String>) session.getAttribute("cart");
		int num = 1;
		if(cart==null){
			cart = new HashMap<Product, String>();
			
		}
		if(cart.containsKey(b)){
			num=Integer.parseInt(cart.get(b))+1;
		}
		cart.put(b, num+"");
		
		session.setAttribute("cart", cart);
		
		request.getRequestDispatcher("/cart.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}