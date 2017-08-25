package com.javatpoint.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.javatpoint.bean.Msg;

public class MsgDao
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

	public boolean save(Msg m)
	{
		boolean result = false;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into msg(name,email,subject,message) values(?,?,?,?)");
			ps.setString(1, m.getMsgName());
			ps.setString(2, m.getMsgEmail());
			ps.setString(3, m.getMsgSub());
			ps.setString(4, m.getMessage());
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

	public boolean delete(Msg m)
	{
		boolean result = false;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from msg where idMsg=?");
			ps.setInt(1, m.getIdMsg());
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

	public static List<Msg> getAllMsg()
	{
		List<Msg> list = new ArrayList<Msg>();

		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from msg");
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Msg m = new Msg();
				m.setIdMsg(rs.getInt("idMsg"));
				m.setMsgName(rs.getString("name"));
				m.setMsgEmail(rs.getString("email"));
				m.setMsgSub(rs.getString("subject"));
				m.setMessage(rs.getString("message"));
				list.add(m);
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

	public static Msg getMsgById(int idMsg)
	{
		Msg m = null;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from msg where idMsg=?");
			ps.setInt(1, idMsg);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				m = new Msg();
				m.setIdMsg(rs.getInt("idMsg"));
				m.setMsgName(rs.getString("name"));
				m.setMsgEmail(rs.getString("email"));
				m.setMsgSub(rs.getString("subject"));
				m.setMessage(rs.getString("message"));
			}
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return m;
	}
	
	public static List<Msg> getAllMsgByPage(int page, int pagesize)
	{
		List<Msg> list = new ArrayList<Msg>();
		int mypage = page;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from msg limit ?,?");
			ps.setInt(1, mypage);
			ps.setInt(2, pagesize);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				list.add(new Msg(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)));
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
	
	public static int MsgSize()
	{
		int result = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select count(*) from msg");
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