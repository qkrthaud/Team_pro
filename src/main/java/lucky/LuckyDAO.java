package lucky;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBPKG.DBConnect;

public class LuckyDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public LuckyDAO() {
		try {
			con=DBConnect.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int getRantop() {
		String sql="select count(*) from lucky_fan";
		int result=1;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	public LuckyDTO getLuck(int ran) {
		String sql="select * from lucky_fan where ran=?";
		LuckyDTO dto =null;
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, ran);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto = new LuckyDTO();
				dto.setContent(rs.getString("content"));
				dto.setEnd(rs.getString("end"));
				dto.setTitle(rs.getString("title"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public void addLuc(LuckyDTO dto) {
		String sql="insert into lucky_fan(ran,title,content,end) values(lucky_seq.nextval,?,?,?)";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getEnd());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
