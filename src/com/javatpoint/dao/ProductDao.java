package com.javatpoint.dao;

import java.awt.print.Book;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.javatpoint.bean.Order;
import com.javatpoint.bean.OrderItem;
import com.javatpoint.bean.Product;
import com.javatpoint.util.C3P0Util;
import com.javatpoint.util.ManagerThreadLocal;

public class ProductDao {
	
	public void updateProductNum(Order order) throws SQLException{
		List<OrderItem> orderItems = order.getOrderItems();
		QueryRunner qr = new QueryRunner();
		
		Object[][] params = new Object[orderItems.size()][];
		for (int i = 0; i < params.length; i++) {
			params[i] = new Object[]{orderItems.get(i).getBuynum(),orderItems.get(i).getP().getId()};
		}
		qr.batch(ManagerThreadLocal.getConnection(),"UPDATE products SET pnum=pnum-? WHERE id=?", params);
	}
	
	public List<Product> findAllBooks() throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from products", new BeanListHandler<Product>(Product.class));
	}
	
	public void addBook(Product product) throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("INSERT INTO products VALUES(?,?,?,?,?,?,?)",product.getId(),product.getName(),product.getPrice(),product.getPnum(),product.getCategory(),product.getDescription(),product.getImg_url());
	}
		
	public Product findBookById(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from products where id=?", new BeanHandler<Product>(Product.class),id);
	}
		
	public void updateBook(Product product) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("update products set name=?,price=?,pnum=?,category=?,description=? where id=?",
				product.getName(),product.getPrice(),product.getPnum(),product.getCategory(),product.getDescription(),product.getId());
		
		
	}
	
	public void delBook(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("delete from products where id=?",id);
	}
	
	public void deleAllBooks(String[] ids) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		Object[][] params = new Object[ids.length][];
		for (int i = 0; i < params.length; i++) {
			params[i] = new Object[]{ids[i]};
		}
		qr.batch("delete from products where id=?", params );
	}
	
	public List<Product> searchBooks(String id, String category, String name,
			String minprice, String maxprice) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from products where 1=1";
		List list = new ArrayList();
		if(!"".equals(id.trim())){
			sql+=" and id like ?"; 
			list.add("%"+id.trim()+"%");
		}
		
		if(!"".equals(category.trim())){
			sql+=" and category=?";
			list.add(category.trim());
		}
		
		if(!"".equals(name.trim())){
			sql+=" and name like ?";
			list.add("%"+name.trim()+"%");
		}
		
		if(!"".equals(minprice.trim())){
			sql+=" and price>?";
			list.add(minprice.trim());
		}
		if(!"".equals(maxprice.trim())){
			sql+=" and price< ?";
			list.add(maxprice.trim());
		}
		
		return qr.query(sql, new BeanListHandler<Product>(Product.class),list.toArray());
	}
	
	public int count(String category) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql ="select count(*) from products";
		
		if(!"".equals(category)){
			sql+=" where category='"+category+"'";
		}
		long l =  (Long)qr.query(sql, new ScalarHandler(1));
		return (int)l;
	}	
	
	public List<Product> findBooks(int currentPage, int pageSize,String category) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		
		String sql = "select * from products where 1=1";
		List list = new ArrayList();
		if(!"".equals(category)){
			sql+=" and category=?";
			list.add(category);
		}
		sql+=" limit ?,?";
		
		list.add((currentPage-1)*pageSize);
		list.add(pageSize);
		
		return qr.query(sql, new BeanListHandler<Product>(Product.class),list.toArray());
	}
	
	public List<Object> searchBookByName(String name) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select name from products where name like ?", new ColumnListHandler(),"%"+name+"%");
	}
}