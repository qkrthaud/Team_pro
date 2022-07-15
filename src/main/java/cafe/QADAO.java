package cafe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class QADAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public QADAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<QADTO> list(int start, int end){
		System.out.println("start : "+start);
		System.out.println("end : "+end);
		if(start == 0) {
			start=1;
		}
		String sql = "select B.* from(select rownum rn, A.* from (select * from cafeqa order by idgroup desc, step asc)A)B where rn between ? and ?";
		ArrayList<QADTO> li = new ArrayList<QADTO>();
		try {
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				li.add(getBoard());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return li;
	}
	private QADTO getBoard() {
		QADTO dto = new QADTO();
		try {
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setId(rs.getString("id"));
			dto.setContent(rs.getString("content"));
			dto.setSavedate(rs.getTimestamp("savedate"));
			dto.setHit(rs.getInt("hit"));
			dto.setIdgroup(rs.getInt("idgroup"));
			dto.setStep(rs.getInt("step"));
			dto.setIndent(rs.getInt("indent"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public void insert(String id, String title, String content) {
		String sql = "insert into cafeqa(num,id,title,content,idgroup,step,indent)"+
				"values(cafeqa_seq.nextval,?,?,?,cafeqa_seq.currval,0,0)";
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
	private void upHit(String id) {
		String sql="update cafeqa set hit=hit+1 where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	public QADTO getContent(String id) {
		upHit(id);
		
		String sql = "select * from cafeqa where id=?";
		QADTO dto = new QADTO();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				return getBoard();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public void update(QADTO dto) {
		String sql = "update cafeqa set title=?, content=? where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getId());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void delete(String id) {
		String sql = "delete from cafeqa where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void replyShap(QADTO dto) {
		String sql ="update cafeqa set step=step+1 where idgroup=? and step > ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getIdgroup());
			ps.setInt(2, dto.getStep());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void reply(QADTO dto) {
		replyShap(dto);
		
		String sql = 
"insert into cafeqa(num,id,title,content,idgroup,step,indent)"
	+"values(cafeqa_seq.nextval, ?, ?, ?, ?, ?, ?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			
			ps.setInt(4, dto.getIdgroup());
			ps.setInt(5, dto.getStep() +1 );
			ps.setInt(6, dto.getIndent() +1 );
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int getTotalPage() {
		String sql ="select count(*) from cafeqa";
		int cnt = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public PageCount pagingNum(int start) {
		if(start ==0) {
			start=1;
		}
		PageCount pc = new PageCount();
		int pageNum = 10; //한페이지당 보여질 글 개수
		int totalPage = getTotalPage();//글 총 개수 얻어옴
		int allPage=0;
		allPage = totalPage / pageNum;
		if(totalPage % pageNum != 0)
			allPage +=1;
		pc.setTotEndPage(allPage);
		pc.setStartPage((start-1) * pageNum + 1);
		pc.setEndPage(pageNum * start );
		return pc;
	}
}









