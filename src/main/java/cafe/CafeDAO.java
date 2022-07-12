package cafe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class CafeDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public CafeDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<CafeDTO> list(){
		
		ArrayList<CafeDTO> li = new ArrayList<CafeDTO>();
		String sql = "select * from cafe order by num desc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				li.add(getList());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return li;
	}
	private CafeDTO getList(){
		CafeDTO dto = new CafeDTO();
		try {
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setId(rs.getString("id"));
			dto.setContent(rs.getString("content"));
			dto.setSavedate(rs.getTimestamp("savedate"));
			dto.setHit(rs.getInt("hit"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public void insert(String id, String title,
			String content) {
		String sql = "insert into cafe(num,title,id,content)"
				+ "values(cafe_seq.nextval,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void upHit(String title) {
		String sql="update cafe set hit=hit+1 where title=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public CafeDTO getContent(String title) {
		upHit(title);
		
		System.out.println(title);
		String sql = "select * from cafe where title=?";
		CafeDTO dto = new CafeDTO();
		
		try {
			ps =con.prepareStatement(sql);
			ps.setString(1, title);
			rs = ps.executeQuery();
			if(rs.next()) {
				return getList();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public void delete(String id) {
		String sql = "delete from cafe where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void modify(String id) {
		
	}
}




