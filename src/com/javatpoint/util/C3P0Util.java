package com.javatpoint.util;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Util {
	//得到一個數據源
	private static DataSource dataSource = new ComboPooledDataSource();
	
	
	public static DataSource getDataSource() {
		return dataSource;
	}

	//從數據源中得到一個連接對象
	public static Connection getConnection(){
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException("服務器錯誤");
		}
	}
	
	public static void release(Connection conn,Statement stmt,ResultSet rs){
		//關閉資源
				if(rs!=null){
					try {
						rs.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					rs = null;
				}
				if(stmt!=null){
					try {
						stmt.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					stmt = null;
				}
				if(conn!=null){
					try {
						conn.close();//關閉
					} catch (Exception e) {
						e.printStackTrace();
					}
					conn = null;
				}
	}
	
}