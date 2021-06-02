package com.proj.thing.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proj.common.DAO;
import com.proj.thing.service.ThingService;
import com.proj.thing.vo.ThingVO;

public class ThingServiceImpl extends DAO implements ThingService {
	private PreparedStatement psmt;
	private ResultSet rs;
	private String sql;

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
		// TODO Auto-generated method stub
		return 0;
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

}
