package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public static Connection getConnection()throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
<<<<<<< HEAD
		Connection con = 
				DriverManager.getConnection(
			"jdbc:oracle:thin:@//192.168.7.14:1521/xe",
									"team3","1234");
		return con;
	}
}








=======
		Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@//192.168.7.14:1521/xe",
											"team3","1234");
		return con;
}
}
>>>>>>> b67334da950f1525542e6289073b76d40ccf1b6f
