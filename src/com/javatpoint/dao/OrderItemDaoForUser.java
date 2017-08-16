package com.javatpoint.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.javatpoint.bean.OrderItemForUser;

public class OrderItemDaoForUser
{
	public static Connection getConnection()
	{
		Connection con = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8",
					"root", "");
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
	
	
	
	public static List<OrderItemForUser> getAllOrderItemByUserId(int id)
	{
		List<OrderItemForUser> list = new ArrayList<OrderItemForUser>();
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * from orderitem INNER JOIN products on orderitem.product_id=products.id INNER JOIN orders ON orderitem.order_id=orders.id where user_id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				list.add(new OrderItemForUser(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getInt(8),
											rs.getString(9),rs.getString(10),rs.getString(11),rs.getDouble(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getInt(16),
											rs.getDate(17),rs.getInt(18)));
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return list;
	}
}
