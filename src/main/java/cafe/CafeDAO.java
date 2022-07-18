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
	//메인페이지 구현
	public ArrayList<CafeDTO> list(int start, int end){
		System.out.println("start : "+start);
		System.out.println("end : "+end);
		if(start == 0) {
			start=1;
		}
		ArrayList<CafeDTO> li = new ArrayList<CafeDTO>();
		String sql = "select B.* from(select rownum rn, A.* from (select * from cafe order by num desc)A)B where rn between ? and ?";
		try {
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				li.add(getList());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return li;
	}
	//메인페이지 작성글 가져오기
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
	//글 작성 메소드
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
	//조회수 증가 메소드
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
	//작성글 내용 보기
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
	//삭제 메소드
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
	//수정 메소드
	public void modify(CafeDTO dto) {
		String sql = "update cafe set title=?, content=? where id=?";
		try {
			ps =con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getId());
			
			ps.executeUpdate();
			
			System.out.println(dto.getTitle());
			System.out.println(dto.getContent());
			System.out.println(dto.getId());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int getTotalPage() {
		String sql ="select count(*) from cafe";
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




