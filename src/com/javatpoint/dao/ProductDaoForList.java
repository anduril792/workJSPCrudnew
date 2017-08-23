package com.javatpoint.dao;

import com.javatpoint.bean.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoForList
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

	public boolean add(ProductForList a)
	{
		boolean result = false;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("INSERT INTO products(id, name, price, category, pnum, img_url, description) values(?,?,?,?,?,?,?)");
			ps.setString(1,a.getId());
			ps.setString(2,a.getName());
			ps.setDouble(3,a.getPrice());
			ps.setString(4,a.getCategory());
			ps.setInt(5,a.getPnum());
			ps.setString(6,a.getImg_url());
			ps.setString(7,a.getDescription());
			// status = ps.executeUpdate();
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

	public boolean update(ProductForList a)
	{
		boolean result = false;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update products set name=?,price=?,category=?,pnum=?,img_url=?,description=? where id=?");
			ps.setString(1,a.getName());
			ps.setDouble(2,a.getPrice());
			ps.setString(3,a.getCategory());
			ps.setInt(4,a.getPnum());
			ps.setString(5,a.getImg_url());
			ps.setString(6,a.getDescription());
			ps.setString(7, a.getId());
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
	
	public static int delete(ProductForList a)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from products where id=?");
			ps.setString(1, a.getId());
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
	
	public static List<Product> getAllProduct()
	{
		List<Product> list = new ArrayList<Product>();

		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from products");
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Product p = new Product();
				p.setId(rs.getString("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getDouble("price"));
				p.setCategory(rs.getString("category"));
				p.setPnum(rs.getInt("pnum"));
				p.setImg_url(rs.getString("img_url"));
				p.setDescription(rs.getString("description"));
				list.add(p);
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

	public ProductForList getProductById(int id)
	{
		ProductForList p = null;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from products where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				p = new ProductForList();
				p.setId(rs.getString("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getDouble("price"));
				p.setCategory(rs.getString("category"));
				p.setPnum(rs.getInt("pnum"));
				p.setImg_url(rs.getString("img_url"));
				p.setDescription(rs.getString("description"));
			}
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return p;
	}
	
	public static List<ProductForList> getAllProductByPage(int page, int pagesize)
	{
		List<ProductForList> list = new ArrayList<ProductForList>();
		int mypage = page;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from products limit ?,?");
			ps.setInt(1, mypage);
			ps.setInt(2, pagesize);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				list.add(new ProductForList(rs.getString(1),rs.getString(2),rs.getDouble(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getString(7)));
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
	
	public static int ProductSize()
	{
		int result = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select count(*) from products");
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
}
