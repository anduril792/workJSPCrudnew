package com.javatpoint.util;

import java.sql.Connection;
import java.sql.SQLException;

public class ManagerThreadLocal {
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
	
	//得到一個連接
	public static Connection getConnection(){
		Connection conn = tl.get();//從當前線程中取出一個連接
		if(conn==null){
			conn = C3P0Util.getConnection();//從池中取出一個
			tl.set(conn);//把conn對象放入到當前線程對象中
		}
		return conn;
	}
	
	//開始事務
	public static void startTransacation(){
		try {
			Connection conn = getConnection();
			conn.setAutoCommit(false);//從當前線程對象中取出的連接，并開始事務
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(){
		try {
			getConnection().commit();//提交事務
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(){
		try {
			getConnection().rollback();//回滾事務
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(){
		try {
			getConnection().close();//把連接放回池中
			tl.remove();//把當前線程對象中的conn移除
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}