package com.javatpoint.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.javatpoint.bean.Order;
import com.javatpoint.bean.OrderItem;
import com.javatpoint.bean.Product;
import com.javatpoint.util.C3P0Util;
import com.javatpoint.util.ManagerThreadLocal;

public class OrderDao {
	
	public void addOrder(Order order) throws SQLException {
		QueryRunner qr = new QueryRunner();
		qr.update(ManagerThreadLocal.getConnection(),
				"INSERT INTO orders VALUES(?,?,?,?,?,?,?,?)", order.getId(),
				order.getMoney(), order.getReceiverAddress(), order
						.getReceiverName(), order.getReceiverPhone(), order
						.getPaystate(), order.getOrdertime(), order.getUserId());
	}

	public List<Order> findOrders(int id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from orders where user_id=?",
				new BeanListHandler<Order>(Order.class), id);
	}

	public Order findOrdersByOrderId(String orderid) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		
		Order order = qr.query("select * from orders where id=?", new BeanHandler<Order>(Order.class),orderid);
		
		List<OrderItem>  orderItems = qr.query("SELECT * FROM orderitem o,products p WHERE p.id=o.product_id AND order_id=?", new ResultSetHandler<List<OrderItem>>(){

			public List<OrderItem> handle(ResultSet rs) throws SQLException {
				List<OrderItem> orderItems = new ArrayList<OrderItem>();
				while(rs.next()){
					
					OrderItem oi = new OrderItem();
					oi.setBuynum(rs.getInt("buynum"));
					
					Product p = new Product();
					p.setName(rs.getString("name"));
					p.setPrice(rs.getDouble("price"));
					
					oi.setP(p);
					
					orderItems.add(oi);
				}
				return orderItems;
			}
			
		},orderid);
		
		order.setOrderItems(orderItems);
		
		return order;
	}

	public List<Order> findAllOrders() throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from orders", new BeanListHandler<Order>(Order.class));
		
	}
}