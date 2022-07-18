package fan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBPKG.DBConnect;

public class FanDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public FanDAO() {
		try {
			con=DBConnect.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public FanDTO getFan(String no) {
		String sql="select * from member_fan where no="+no;
		FanDTO dto = null;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto = new FanDTO();
				dto.setContent(rs.getString("content"));
				dto.setTitle(rs.getString("title"));
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	public void delete(String no) {
		String sql="delete from member_fan where no="+no;
		try {
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void regMod(FanDTO dto) {
		String sql="update member_fan set title=?,content=? where no=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getNo());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public FanDTO getFan2(int no) {
		String sql="select * from member_fan where no=?";
		FanDTO dto = null;
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto = new FanDTO();
				dto.setContent(rs.getString("content"));
				dto.setTitle(rs.getString("title"));
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	public void regAdd(FanDTO dto) {
		String sql="insert into member_fan(num,no,title,content) values(?,mem_fan_seq.nextval,?,?)";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, dto.getNum());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
