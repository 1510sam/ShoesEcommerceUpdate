package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	private static Connection conn;
	public static Connection getConnection() {
		Connection c = null;
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			String url = "jdbc:mySQL://localhost:3306/shoes-website";
			String username = "root";
			String password = "abc@123";
			c = DriverManager.getConnection(url, username, password);

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return c;
	}
}
