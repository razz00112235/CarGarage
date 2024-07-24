package Ecommerce;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.http.HttpServlet;

public class Confiq_Data {
	static Connection con=null;
	public static int show() {
		
		return 0;
	}
	public static Connection confiq() {
		
		
		String driver="com.mysql.cj.jdbc.Driver";
		String user="root";
		String password="12345678";
		String path="jdbc:mysql://localhost:3306/flipcart";
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(path,user,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
}
