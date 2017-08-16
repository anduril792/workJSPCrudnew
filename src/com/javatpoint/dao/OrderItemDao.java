package com.javatpoint.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import com.javatpoint.bean.Order;
import com.javatpoint.bean.OrderItem;
import com.javatpoint.util.C3P0Util;
import com.javatpoint.util.ManagerThreadLocal;

public class OrderItemDao {
	
	public void addOrderItem(Order order) throws SQLException{
		List<OrderItem> orderItems = order.getOrderItems();
		QueryRunner qr = new QueryRunner();
		Object[][] params = new Object[orderItems.size()][];
		
		for (int i = 0; i < params.length; i++) {
			
			params[i] = new Object[]{order.getId(),orderItems.get(i).getP().getId(),orderItems.get(i).getBuynum()};
		}
		qr.batch(ManagerThreadLocal.getConnection(),"INSERT INTO orderitem VALUES(?,?,?)", params );
	}
}