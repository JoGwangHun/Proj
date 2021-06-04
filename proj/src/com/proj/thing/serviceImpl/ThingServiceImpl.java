package com.proj.thing.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proj.common.DAO;
import com.proj.thing.service.ThingService;
import com.proj.thing.vo.CartVO;
import com.proj.thing.vo.CommentVO;
import com.proj.thing.vo.ThingVO;

public class ThingServiceImpl extends DAO implements ThingService {
	private PreparedStatement psmt;
	private ResultSet rs;
	private String sql;
	
	// 댓글 리스트 가져오기
	public List<CommentVO> commentGetList(int thing_id) {
		sql = "SELECT * FROM comments WHERE thing_id=?";
		List<CommentVO> list = new ArrayList<CommentVO>();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, thing_id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setUserId(rs.getString("user_id"));
				vo.setCommentDate(rs.getString("comment_date"));
				vo.setContents(rs.getString("contents"));
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 댓글 Insert
	public void commentInsert(String user_id, String comment, int thing_id) {
		sql = "INSERT INTO comments VALUES(?, to_char(sysdate, 'yyyy-MM-dd hh24:mi:ss'), ?, ?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			psmt.setString(2, comment);
			psmt.setInt(3, thing_id);
			
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	// 페이징
	public List<ThingVO> thingListPaging(int page) {
		sql = "SELECT m.membeR_name, b.* from (select rownum rn, a.* from (select * FROM thing n order by user_id) a) b, member m WHERE (b.user_id = m.member_id) AND (b.rn between ? and ?)";
		List<ThingVO> list = new ArrayList<ThingVO>();

		int firstCnt, lastCnt = 0;
		firstCnt = (page - 1) * 8 + 1; // 1
		lastCnt = (page * 8); // 10

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, firstCnt);
			psmt.setInt(2, lastCnt);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ThingVO vo = new ThingVO();
				vo.setThingId(rs.getInt("thing_id"));
				vo.setThingImage(rs.getString("thing_image"));
				vo.setThingName(rs.getString("thing_name"));
				vo.setThingPrice(rs.getInt("thing_price"));
				vo.setThingDesc(rs.getString("thing_desc"));
				vo.setThingKind(rs.getString("thing_kind"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 장바구니 초기화
	public void deleteCartList(String user_id) {
		sql = "DELETE FROM cart WHERE user_id=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	// 가격 총합
	public int getTotalPrice(String user_id) {
		sql = "select sum(total) from (SELECT t.user_id, t.thing_id, t.thing_name, t.thing_price, sum(c.count) AS cnt, (t.thing_price * sum(c.count)) AS total\r\n"
				+ "FROM thing t, cart c\r\n"
				+ "WHERE t .thing_id = c.thing_id AND c.user_id = ?\r\n"
				+ "GROUP BY t.user_id, t.thing_id, t.thing_name, t.thing_price, c.count)";
		int total = 0;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			while (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return total;
	}

	// cartList가져오기
	public List<CartVO> getCartList(String user_id) {
		sql = "SELECT c.user_id, t.thing_id, t.thing_name, t.thing_price, sum(c.count) AS cnt, (t.thing_price * sum(c.count)) AS total\r\n"
				+ "FROM thing t, cart c\r\n"
				+ "WHERE t .thing_id = c.thing_id AND c.user_id = ?\r\n"
				+ "GROUP BY C.user_id, t.thing_id, t.thing_name, t.thing_price, c.count";
		List<CartVO> list = new ArrayList<CartVO>();

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			while (rs.next()) {
				CartVO vo = new CartVO();
				vo.setUser_id(rs.getString("user_id"));
				vo.setThing_id(rs.getInt("thing_id"));
				vo.setThing_name(rs.getString("thing_name"));
				vo.setPrice(rs.getInt("thing_price"));
				vo.setCount(rs.getInt("cnt"));
				vo.setTotalPrice(rs.getInt("total"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	// cart안의 정보 갯수를 가져오기
	public int getCountCart(String id) {
		sql = "SELECT count(*) FROM cart WHERE user_id = ?";
		int cnt = 0;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// cart 정보 추가하는 메소드
	public void addCartCnt(String user_id, int thing_id, int qty) {
		sql = "INSERT INTO cart VALUES(?, ?, ?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			psmt.setInt(2, thing_id);
			psmt.setInt(3, qty);

			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	@Override
	public List<ThingVO> thingGetList() {
		sql = "SELECT * FROM thing ORDER BY thing_kind";
		List<ThingVO> list = new ArrayList<ThingVO>();

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ThingVO vo = new ThingVO();
				vo.setThingId(rs.getInt("thing_id"));
				vo.setThingImage(rs.getString("thing_image"));
				vo.setThingName(rs.getString("thing_name"));
				vo.setThingPrice(rs.getInt("thing_price"));
				vo.setThingDesc(rs.getString("thing_desc"));
				vo.setThingKind(rs.getString("thing_kind"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	@Override
	public ThingVO ThingSelect(String id) {
		sql = "SELECT t.*, p.* FROM thing t, price_his p WHERE t.thing_id = p.thing_id AND t.thing_id = ?";
		ThingVO vo = new ThingVO();

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setThingId(rs.getInt("thing_id"));
				vo.setThingImage(rs.getString("thing_image"));
				vo.setThingName(rs.getString("thing_name"));
				vo.setThingPrice(rs.getInt("thing_price"));
				vo.setThingDesc(rs.getString("thing_desc"));
				vo.setThingKind(rs.getString("thing_kind"));
				vo.setThingImageDetail(rs.getString("thing_imagedetail"));
				vo.setThingDetailDesc(rs.getString("thing_detaildesc"));
				vo.setPrice1(rs.getInt("price1"));
				vo.setPrice2(rs.getInt("price2"));
				vo.setPrice3(rs.getInt("price3"));
				vo.setPrice4(rs.getInt("price4"));
				vo.setUserId(rs.getString("user_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return vo;
	}

	@Override
	public int insertThing(ThingVO vo) {
		sql = "INSERT INTO thing VALUES(thing_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		int n = 0;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getThingImage());
			psmt.setString(2, vo.getThingName());
			psmt.setInt(3, vo.getThingPrice());
			psmt.setString(4, vo.getThingDesc());
			psmt.setString(5, vo.getThingKind());
			psmt.setString(6, vo.getThingImageDetail());
			psmt.setString(7, vo.getThingDetailDesc());
			psmt.setString(8, vo.getUserId());

			n = psmt.executeUpdate();
			priceInsert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return n;
	}

	@Override
	public int updateThing(ThingVO vo) {
		sql = "UPDATE thing SET thing_name = ?, thing_desc = ?, thing_price=?, thing_kind=?, thing_imagedetail=?, thing_detaildesc=?, thing_image=? WHERE thing_id = ?";
		int n = 0;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getThingName());
			psmt.setString(2, vo.getThingDesc());
			psmt.setInt(3, vo.getThingPrice());
			psmt.setString(4, vo.getThingKind());
			psmt.setString(5, vo.getThingImageDetail());
			psmt.setString(6, vo.getThingDetailDesc());
			psmt.setString(7, vo.getThingImage());
			psmt.setInt(8, vo.getThingId());
			n = psmt.executeUpdate();
			priceUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return n;
	}

	@Override
	public int deleteThing(ThingVO vo) {
		sql = "delete from thing where thing_id = ?";
		int n = 0;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getThingId());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return n;
	}

	// resource 반환
	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 가격 히스토리 업데이트
	private void priceUpdate(ThingVO vo) {
		sql = "UPDATE price_his SET price1= ?, price2=?, price3=?, price4=? WHERE thing_id = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getPrice1());
			psmt.setInt(2, vo.getPrice2());
			psmt.setInt(3, vo.getPrice3());
			psmt.setInt(4, vo.getPrice4());
			psmt.setInt(5, vo.getThingId());

			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 가격 히스토리 입력
	private void priceInsert(ThingVO vo) {
		sql = "INSERT INTO price_his VALUES (thing_seq.currval, ?, ?, ?, ?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getPrice1());
			psmt.setInt(2, vo.getPrice2());
			psmt.setInt(3, vo.getPrice3());
			psmt.setInt(4, vo.getPrice4());

			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
