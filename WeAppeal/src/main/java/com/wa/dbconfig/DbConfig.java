package com.wa.dbconfig;

import java.sql.*;

public class DbConfig {
	public static Connection getConnect() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "silicon", "silicon");
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		return conn;
	}
}