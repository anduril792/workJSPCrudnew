package com.javatpoint.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.javatpoint.bean.User;

public class UserDao
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

	public static int save(User u)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into register(name,password,email,sex,country) values(?,?,?,?,?)");
			String name = new String(u.getName().getBytes("ISO-8859-1"), "UTF-8");
			ps.setString(1, name);
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSex());
			ps.setString(5, u.getCountry());
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

	public static int update(User u)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update register set name=?,password=?,email=?,sex=?,country=? where id=?");
			String name = new String(u.getName().getBytes("ISO-8859-1"), "UTF-8");
			ps.setString(1, name);
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSex());
			ps.setString(5, u.getCountry());
			ps.setInt(6, u.getId());
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

	public static int delete(User u)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from register where id=?");
			ps.setInt(1, u.getId());
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

	public static List<User> getAllRecords()
	{
		List<User> list = new ArrayList<User>();

		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from register");
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setCountry(rs.getString("country"));
				list.add(u);
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

	public static User getRecordById(int id)
	{
		User u = null;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from register where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setCountry(rs.getString("country"));
			}
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return u;
	}
	
	public static User getRecordByName(String name)
	{
		User u = null;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from register where name=?");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setCountry(rs.getString("country"));
			}
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return u;
	}
	
	public static List<User> getAllUsersByPage(int page, int pagesize)
	{
		List<User> list = new ArrayList<User>();
		int mypage = page;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from register limit ?,?");
			ps.setInt(1, mypage);
			ps.setInt(2, pagesize);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				list.add(new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)));
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
	
	public static int UserSize()
	{
		int result = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select count(*) from register");
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
	
	public Boolean findName(String name)
	{
		Boolean result =false;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select name from register where name=?");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				result = true; 
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return result;
	}
	
}