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
					.prepareStatement("insert into article(libelle,description,prix,qte,img) values(?,?,?,?,?)");
			ps.setString(1, a.getLibelle());
			ps.setString(2, a.getDesc());
			ps.setDouble(3, a.getPrix());
			ps.setInt(4, a.getQte());
			ps.setString(5, a.getImg());
			// status = ps.executeUpdate();
			ps.executeUpdate();
			result = true;
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return result;
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
	 * // henry �קﲣ�~(��k) �ǤJ���~���� public boolean update(Article a) { try { // vince
	 * �[�F��s��� String req = "UPDATE `article` " + "SET `libelle`='" + a.getLibelle()
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
	 * // henry �d��S�w���~(��k) �ǤJid�Ѽ� public Article findByID(int id) { String req =
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
				a.setQte(rs.getInt("qte"));
				a.setImg(rs.getString("img"));
				list.add(a);
			}
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return list;
	}

	/*
	 * // henry �j�M�Ҧ����~(��k) �æ^�� Vector��ƫ��A �j�M�\��ϥ� (�a�J�j�M����r) public Vector<Article>
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
	 * // henry �j�M���~(�H��) �a�J�H���ƭ� public Vector<Article> findRandom(int nbMax) {
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