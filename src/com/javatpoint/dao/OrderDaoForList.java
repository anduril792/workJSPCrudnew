package com.javatpoint.dao;

import com.javatpoint.bean.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoForList
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

	public boolean update(OrderForList o)
	{
		boolean result = false;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update orders set paystate=? where id=?");
			ps.setInt(1,o.getPaystate());
			ps.setString(2, o.getId());
			ps.executeUpdate();
			result = true;
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return result;
	}
	
	public static int delete(OrderForList o)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from orders where id=?");
			ps.setString(1, o.getId());
			status = ps.executeUpdate();
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	public static List<Order> getAllOrder()
	{
		List<Order> list = new ArrayList<Order>();

		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from orders");
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Order o = new Order();
				o.setId(rs.getString("id"));
				o.setMoney(rs.getDouble("money"));
				o.setReceiverAddress(rs.getString("receiverAddress"));
				o.setReceiverName(rs.getString("receiverName"));
				o.setReceiverPhone(rs.getString("receiverPhone"));
				o.setPaystate(rs.getInt("paystate"));
				o.setOrdertime(rs.getDate("ordertime"));
				o.setUserId(rs.getInt("userid"));
				list.add(o);
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return list;
	}

	public static OrderForList getOrderById(int id)
	{
		OrderForList o = null;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from orders where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				o = new OrderForList();
				o.setId(rs.getString("id"));
				o.setMoney(rs.getDouble("money"));
				o.setReceiverAddress(rs.getString("receiverAddress"));
				o.setReceiverName(rs.getString("receiverName"));
				o.setReceiverPhone(rs.getString("receiverPhone"));
				o.setPaystate(rs.getInt("paystate"));
				o.setOrdertime(rs.getDate("ordertime"));
				o.setUserId(rs.getInt("userid"));
			}
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return o;
	}
	
	public static List<OrderForList> getAllOrderByPage(int page, int pagesize)
	{
		List<OrderForList> list = new ArrayList<OrderForList>();
		int mypage = page;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from orders limit ?,?");
			ps.setInt(1, mypage);
			ps.setInt(2, pagesize);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				list.add(new OrderForList(rs.getString(1),rs.getDouble(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getDate(7),rs.getInt(8)));
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
	
	public static int OrderSize()
	{
		int result = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select count(*) from orders");
			ResultSet rs = ps.executeQuery();
			rs.next();
			result = rs.getInt(1);
			rs.close();
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return result;
	}
	
	public static List<OrderForList> getAllOrderByUserId(int id)
	{
		List<OrderForList> list = new ArrayList<OrderForList>();
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from orders where user_id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				list.add(new OrderForList(rs.getString(1),rs.getDouble(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getDate(7),rs.getInt(8)));
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
