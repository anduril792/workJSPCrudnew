package com.javatpoint.dao;

import com.javatpoint.bean.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ArticleDao
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

	public boolean add(Article a)
	{
		// int status = 0;
		boolean result = false;

		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into article(libelle,description,prix,category,qte,img) values(?,?,?,?,?,?)");
			ps.setString(1, a.getLibelle());
			ps.setString(2, a.getDesc());
			ps.setDouble(3, a.getPrix());
			ps.setString(4, a.getCate());
			ps.setInt(5, a.getQte());
			ps.setString(6, a.getImg());
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

	public boolean update(Article a)
	{
		boolean result = false;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update article set libelle=?,description=?,prix=?,category=?,qte=?,img=? where idArticle=?");
			ps.setString(1, a.getLibelle());
			ps.setString(2, a.getDesc());
			ps.setDouble(3, a.getPrix());
			ps.setString(4, a.getCate());
			ps.setInt(5, a.getQte());
			ps.setString(6, a.getImg());
			ps.setInt(7, a.getIdArticle());
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
	
	public static int delete(Article a)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from article where idArticle=?");
			ps.setInt(1, a.getIdArticle());
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
	/* public boolean remove(int idArticle) { try { String req =
	  "DELETE FROM article " + "WHERE idarticle = " + idArticle;
	  
	 * Statement st = con.createStatement();
	 * 
	 * int rs = st.executeUpdate(req);
	 * 
	 * if (rs > 0) { return true; }
	 * 
	 * } catch (Exception e1) { e1.printStackTrace(); }
	 * 
	 * return false; }
	 * 
	 * // henry 修改產品(方法) 傳入產品實體 public boolean update(Article a) { try { // vince
	 * 加了更新日期 String req = "UPDATE `article` " + "SET `libelle`='" + a.getLibelle()
	 * + "', " + "`desc`='" + a.getDesc() + "', " + "`prix`='" + a.getPrix() + "', "
	 * + "`img`='" + a.getImg() + "', " + "`qte`='" + a.getQte() + "', " +
	 * "`dateajout`='" + a.getDateAjout() + "' " + "WHERE `idarticle`='" +
	 * a.getIdArticle() + "';";
	 * 
	 * Statement st = con.createStatement();
	 * 
	 * int rs = st.executeUpdate(req);
	 * 
	 * if (rs > 0) { return true; }
	 * 
	 * } catch (Exception e1) { // TODO Auto-generated catch block
	 * e1.printStackTrace(); }
	 * 
	 * return false; }
	 * 
	 * // henry 查找特定產品(方法) 傳入id參數 public Article findByID(int id) { String req =
	 * "SELECT* " + " FROM article " + " WHERE idArticle = " + id;
	 * 
	 * try { Statement st = con.createStatement(); ResultSet rs =
	 * st.executeQuery(req);
	 * 
	 * Article e = null;
	 * 
	 * if (rs.next()) { // Article(int idArticle, String libelle, String desc,
	 * double prix, String img, // int qte, Date dateAjout)
	 * 
	 * e = new Article(rs.getInt(1), rs.getString(2), rs.getString(3),
	 * rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getDate(7)); } return e;
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return null; }
	 */
	public static List<Article> getAllArticle()
	{
		List<Article> list = new ArrayList<Article>();

		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from article");
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Article a = new Article();
				a.setIdArticle(rs.getInt("idarticle"));
				a.setLibelle(rs.getString("libelle"));
				a.setDesc(rs.getString("description"));
				a.setPrix(rs.getDouble("prix"));
				a.setCate(rs.getString("category"));
				a.setQte(rs.getInt("qte"));
				a.setImg(rs.getString("img"));
				list.add(a);
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
	
	

	public static Article getArticleById(int idArticle)
	{
		Article a = null;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from article where idArticle=?");
			ps.setInt(1, idArticle);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				a = new Article();
				a.setIdArticle(rs.getInt("idarticle"));
				a.setLibelle(rs.getString("libelle"));
				a.setDesc(rs.getString("description"));
				a.setPrix(rs.getDouble("prix"));
				a.setCate(rs.getString("category"));
				a.setQte(rs.getInt("qte"));
				a.setImg(rs.getString("img"));
			}
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return a;
	}
	
	public static List<Article> getAllArticleByPage(int page, int pagesize, String category)
	{
		List<Article> list = new ArrayList<Article>();
		String sql = "select * from article";
		if(!"".equals(category))
		{
			sql += " where category=?";
		}
		sql += " limit ?,?";
		int mypage = page;
		try
		{
			Connection con = getConnection();
			
			PreparedStatement ps = con.prepareStatement(sql);
			if(!"".equals(category))
			{
				ps.setString(1, category);
				ps.setInt(2, mypage);
				ps.setInt(3, pagesize);
			}
			else
			{
				ps.setInt(1, mypage);
				ps.setInt(2, pagesize);
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				list.add(new Article(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getDouble(4),rs.getString(5),rs.getInt(6),rs.getString(7)));
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
	
	public static List<Article> getAllArticleByPage(int page, int pagesize)
	{
		List<Article> list = new ArrayList<Article>();
		String sql = "select * from article limit ?,?";
		int mypage = page;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, mypage);
			ps.setInt(2, pagesize);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				list.add(new Article(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getDouble(4),rs.getString(5),rs.getInt(6),rs.getString(7)));
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
	
	public static int ArticleSize()
	{
		int result = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select count(*) from article");
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
	
	/*
	 * //  搜尋所有產品(方法) 並回傳 Vector資料型態 搜尋功能使用 (帶入搜尋關鍵字) public Vector<Article>
	 * findAll(String key) { String req = "SELECT* " +
	 * " FROM article WHERE libelle like '%" + key + "%'";
	 * 
	 * Vector<Article> vect = null;
	 * 
	 * try { Statement st = con.createStatement(); ResultSet rs =
	 * st.executeQuery(req);
	 * 
	 * while (rs.next()) {
	 * 
	 * if (vect == null) { vect = new Vector<>(); }
	 * 
	 * Article e = new Article(rs.getInt(1), rs.getString(2), rs.getString(3),
	 * rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getDate(7));
	 * 
	 * vect.add(e); }
	 * 
	 * return vect; } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return null; }
	 * 
	 * //  搜尋產品(隨機) 帶入隨機數值 public Vector<Article> findRandom(int nbMax) {
	 * String req = "SELECT* " + " FROM article ORDER BY RAND() LIMIT " + nbMax;
	 * 
	 * Vector<Article> vect = null;
	 * 
	 * try { Statement st = con.createStatement(); ResultSet rs =
	 * st.executeQuery(req);
	 * 
	 * while (rs.next()) {
	 * 
	 * if (vect == null) { vect = new Vector<>(); }
	 * 
	 * Article e = new Article(rs.getInt(1), rs.getString(2), rs.getString(3),
	 * rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getDate(7));
	 * 
	 * vect.add(e); }
	 * 
	 * return vect; } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return null; }
	 */
}
