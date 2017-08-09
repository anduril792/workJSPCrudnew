package com.javatpoint.service;

import java.sql.SQLException;
import java.util.List;

import com.javatpoint.dao.OrderDao;
import com.javatpoint.dao.OrderItemDao;
import com.javatpoint.dao.ProductDao;
import com.javatpoint.bean.Order;
import com.javatpoint.util.ManagerThreadLocal;

public class OrderService {
	
	OrderDao orderDao = new OrderDao();
	OrderItemDao orderItemDao = new OrderItemDao();
	ProductDao productDao = new ProductDao();
	
	public void addOrder(Order order){
		try {
			ManagerThreadLocal.startTransacation();
			orderDao.addOrder(order);
			orderItemDao.addOrderItem(order);
			productDao.updateProductNum(order);
			
			ManagerThreadLocal.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			ManagerThreadLocal.rollback();
		}
	}

	public List<Order> findOrdersByUserId(int id) {
		try {
			return orderDao.findOrders(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Order findOrdersByOrderId(String orderid) {
		try {
			return orderDao.findOrdersByOrderId(orderid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Order> findAllOrders() {
		try {
			return orderDao.findAllOrders();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
