package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;
import blogmember.BlogDTO;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MemberDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public MemberDTO getDTO(String name) {
		String sql = "select * from member_team where name = ?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			return makeDTO(rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	public MemberDTO loginChk(MemberDTO dto) {
		String sql = "select * from member_team where id = ? and pwd = ?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = makeDTO(rs);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	private MemberDTO makeDTO(ResultSet rs) {
		MemberDTO dto = null;
		
		try {
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setAddr(rs.getString("addr"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));
				dto.setPwd(rs.getString("pwd"));
				dto.setTel(rs.getString("tel"));
				System.out.println(rs.getString("id"));
				System.out.println("없음");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public void blogContentInsert(MemberDTO dto, BlogDTO bdto) {
		String sql = "insert into blog_member(num, step, title, content, tnum)"
				+ "values(?,blog_member_seq.nextval,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getNum());
			ps.setString(2, bdto.getTitle());
			ps.setString(3, bdto.getContent());
			ps.setInt(4, bdto.getTnum());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<BlogDTO> blogContentView(MemberDTO dto) {
		String sql = "select * from member_team where name = ?";
		ArrayList<BlogDTO> list = new ArrayList<BlogDTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			rs = ps.executeQuery();
			dto = makeDTO(rs);
			sql = "select * from blog_member where num = ? order by step asc";
			try {
				ps = con.prepareStatement(sql);
				ps.setInt(1, dto.getNum());
				rs = ps.executeQuery();
				while(rs.next()) {
					BlogDTO bdto = new BlogDTO();		
					bdto.setStep(rs.getInt("step"));
					bdto.setNum(rs.getInt("num"));
					bdto.setTitle(rs.getString("title"));
					bdto.setContent(rs.getString("content"));
					bdto.setBdate(rs.getTimestamp("bdate"));
					bdto.setTnum(rs.getInt("tnum"));
					
					list.add(bdto);
				}				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<BlogDTO> blogContentViewTab(int num){
		String sql = "select * from blog_member where tnum = ? order by step asc";
		ArrayList<BlogDTO> list = new ArrayList<BlogDTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			while(rs.next()) {
				BlogDTO bdto = new BlogDTO();	
				bdto.setStep(rs.getInt("step"));
				bdto.setNum(rs.getInt("num"));
				bdto.setTitle(rs.getString("title"));
				bdto.setContent(rs.getString("content"));
				bdto.setBdate(rs.getTimestamp("bdate"));
				bdto.setTnum(rs.getInt("tnum"));
				
				list.add(bdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public BlogDTO stepView(int value) {
		String sql = "select * from blog_member where step = ?";
		BlogDTO bdto = new BlogDTO();
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, value);
			rs = ps.executeQuery();
			if(rs.next()) {
				bdto.setStep(rs.getInt("step"));
				bdto.setNum(rs.getInt("num"));
				bdto.setTitle(rs.getString("title"));
				bdto.setContent(rs.getString("content"));
				bdto.setBdate(rs.getTimestamp("bdate"));
				bdto.setTnum(rs.getInt("tnum"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bdto;
	}
}
