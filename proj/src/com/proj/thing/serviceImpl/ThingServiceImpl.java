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
		sql = "SELECT * FROM thing ORDER BY 7";
		List<ThingVO> list = new ArrayList<ThingVO>();

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ThingVO vo = new ThingVO();
				vo.setThingId(rs.getInt(1));
				vo.setThingImage(rs.getString(2));
				vo.setThingName(rs.getString(3));
				vo.setThingPrice(rs.getInt(4));
				vo.setThingEnDate(rs.getDate(5));
				vo.setThingDesc(rs.getString(6));
				vo.setThingKind(rs.getString(7));
				
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
			if(rs.next()) {
				vo.setThingId(rs.getInt(1));
				vo.setThingImage(rs.getString(2));
				vo.setThingName(rs.getString(3));
				vo.setThingPrice(rs.getInt(4));
				vo.setThingEnDate(rs.getDate(5));
				vo.setThingDesc(rs.getString(6));
				vo.setThingKind(rs.getString(7));
				vo.setThingImageDetail(rs.getString(8));
				vo.setThingImageDetail2(rs.getString(9));
				vo.setPrice1(rs.getInt(11));
				vo.setPrice2(rs.getInt(12));
				vo.setPrice3(rs.getInt(13));
				vo.setPrice4(rs.getInt(14));
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
		// TODO Auto-generated method stub
		return 0;
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

}
