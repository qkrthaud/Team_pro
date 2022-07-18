package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public static Connection getConnection()throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");

		Connection con = 
				DriverManager.getConnection(
			"jdbc:oracle:thin:@//192.168.7.14:1521/xe",
									"team3","1234");
		return con;
	}
}







