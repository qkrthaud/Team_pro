package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPKG.DBConnect;
import fan.FanDTO;


public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public MemberDAO() {
		try {
			con=DBConnect.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
