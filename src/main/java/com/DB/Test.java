package com.DB;

import java.sql.Connection;

public class Test {
	public static void main(String[] args) {
		Connection connection = DBConn.getConnection();
		System.out.println(connection);
	}
}
