package com.javatpoint.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javatpoint.bean.Product;
import com.javatpoint.dao.ProductDaoForList;

public class ChkProductPnum extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		
		ProductDaoForList pd = new ProductDaoForList();
		pd.getProductById(Integer.valueOf(request.getParameter("id"))).getPnum();
		Product b = new Product();
		b.setId(id);
		
		HttpSession session = request.getSession();
		Map<Product, String> cart = (Map<Product, String>) session.getAttribute("cart");
		
		if(pd.getProductById(Integer.valueOf(request.getParameter("id"))).getPnum() == 0){
			cart.remove(b);
			response.sendRedirect(request.getContextPath()+"/cart-error.jsp?pid="+pd.getProductById(Integer.valueOf(request.getParameter("id"))).getId());
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/order.jsp");
			
		}
		//else
		//{
		//	response.sendRedirect(request.getContextPath()+"/order.jsp");
		//}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
