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
		
		//從session中的購物車取出 來
		HttpSession session = request.getSession();
		Map<Product, String> cart = (Map<Product, String>) session.getAttribute("cart");
		int num = 1;
		//如何是第一次訪問，沒有購物車對象，我們就創建 一個購物車對象
		if(cart==null){
			cart = new HashMap<Product, String>();
			
		}
		//查看當前集合中是否存在b這本書,如果有就把數據取出來加1;
		if(cart.containsKey(b)){
			num=Integer.parseInt(cart.get(b))+1;
		}
		//把圖書放入購物車
		cart.put(b, num+"");
		
		//把cart對象放回到session作用域中
		session.setAttribute("cart", cart);
		
		out.print("<a href='"+request.getContextPath()+"/pageServlet'>繼續購物</a>，<a href='"+request.getContextPath()+"/cart.jsp'>查看購物車</a>");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}