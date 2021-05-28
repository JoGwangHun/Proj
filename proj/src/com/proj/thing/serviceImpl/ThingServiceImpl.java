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
		sql = "SELECT * FROM thing ORDER BY 1";
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
	public ThingVO ThingSelect(ThingVO vo) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return 0;
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
