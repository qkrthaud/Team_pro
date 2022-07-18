package fan_member;

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
	public int chklog(String id, String pwd) {
		String sql="select * from member_team where id='"+id+"'";
		int result=0;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("pwd").equals(pwd)) {
					System.out.println("찾음");
					result=rs.getInt("num");
					System.out.println("result : "+result);
				}else {
					System.out.println("못찾음");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void add(MemberDTO dto) {
		String sql="insert into member_team(id,name,pwd,addr,tel,num) values(?,?,?,?,?,mem_team_seq.nextval)";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getPwd());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getTel());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
	}
	public void remove(String num) {
		String sql="delete from member_team where num="+num;
		try {
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int chkId(String id) {
		String sql="select * from member_team where id='"+id+"'";
		int result=0;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				result=1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	public void modify(MemberDTO dto) {
		String sql="update member_team set id=?,pwd=?,addr=?,tel=?,name=? where num=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getAddr());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getName());
			ps.setInt(6, dto.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public MemberDTO getMem2(String num) {
		String sql="select * from member_team where num="+num;
		MemberDTO dto = null;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setAddr(rs.getString("addr"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));
				dto.setPwd(rs.getString("pwd"));
				dto.setTel(rs.getString("tel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public ArrayList<FanDTO> list(){
		String sql="select * from member_fan";
		//String sql="select B.* from(select rownum rn, A.* from(select * from member_fan order by no desc)A)B where rn between 1 and 5";
		ArrayList<FanDTO> arr = new ArrayList<FanDTO>();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				FanDTO dto = new FanDTO();
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setNo(rs.getInt("no"));
				arr.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	public ArrayList<FanDTO> list2(int start) {
		ArrayList<FanDTO> li = new ArrayList<FanDTO>();
		if(start==0) {
			start=1;
		}
		System.out.println(start);
		
		String sql="select B.* from\r\n"
				+ "(select rownum rn, A.* from(select * from member_fan order by no desc)A)\r\n"
				+ "B where rn between ? and ?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, start*10-9);
			ps.setInt(2, start*10);
			rs=ps.executeQuery();
			while(rs.next()) {
				FanDTO dto = new FanDTO();
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setNo(rs.getInt("no"));
				li.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return li;
	}
	public int getTotalPage() {
		String sql="select count(*) from member_fan";
		int cnt=0;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cnt;
	}
	public MemberDTO getMem(int num) {
		String sql="select * from member_team where num=?";
		MemberDTO dto = null;
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setAddr(rs.getString("addr"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));
				dto.setPwd(rs.getString("pwd"));
				dto.setTel(rs.getString("tel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
