package com.javatpoint.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.javatpoint.bean.Order;
import com.javatpoint.bean.OrderItem;
import com.javatpoint.bean.Product;
import com.javatpoint.bean.User;
import com.javatpoint.service.OrderService;

public class CreateOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Order order = new Order();
		try {
			BeanUtils.populate(order, request.getParameterMap());
			order.setId(UUID.randomUUID().toString());
			order.setUserId(Integer.valueOf(request.getParameter("id")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//2、獲取session對象中的購物車數據
		Map<Product, String> cart = (Map<Product, String>) request.getSession().getAttribute("cart");
		
		//3、遍曆購物車中的數據，添加到orderItem對象中，同時把多個orderItem添加到list集合中
		List<OrderItem> list = new ArrayList<OrderItem>();
		for (Product p : cart.keySet()) {
			OrderItem oi = new OrderItem();
			oi.setOrder(order);//把Order對象添加到OrderItem中
			oi.setP(p);   //把購物車中的商品對象添加到OrderItem中
			oi.setBuynum(Integer.parseInt(cart.get(p)));//購物車中的商品數量
			
			list.add(oi);//把每個定單項添加到集合中
		}
		
		order.setOrderItems(list);
		
		OrderService os = new OrderService();
		os.addOrder(order);
		
		//
		request.getSession().invalidate();
		request.getRequestDispatcher("/paysuccess.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}