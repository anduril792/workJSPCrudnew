package com.javatpoint.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import com.javatpoint.bean.Order;
import com.javatpoint.bean.OrderItem;
import com.javatpoint.util.C3P0Util;
import com.javatpoint.util.ManagerThreadLocal;

public class OrderItemDao {
	//添加定單項
	public void addOrderItem(Order order) throws SQLException{
		List<OrderItem> orderItems = order.getOrderItems();//得到所有定單項的集合
		QueryRunner qr = new QueryRunner();
		Object[][] params = new Object[orderItems.size()][];
		
		for (int i = 0; i < params.length; i++) {
			//數組中的第一個參數代表主單id， 第二個參數：商品id 第三個參數 ：商品的購買數量
			params[i] = new Object[]{order.getId(),orderItems.get(i).getP().getId(),orderItems.get(i).getBuynum()};
		}
		qr.batch(ManagerThreadLocal.getConnection(),"INSERT INTO orderitem VALUES(?,?,?)", params );
	}
}