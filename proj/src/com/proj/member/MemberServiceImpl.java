package com.proj.member;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.proj.common.DAO;

public class MemberServiceImpl extends DAO implements MemberService{
	
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
		
	@Override
	public List<MemberVO> selectMemberList() {
		
		return null;
	}

	@Override
	public MemberVO selectMember() {
	
		return null;
	}

	@Override
	public int insertMember(MemberVO vo) {
		String sql="insert into member values(?,?,?,?,?)";
		int r=0;
		try {
			psmt=conn.prepareStatement(sql);
			//각각 ?<?<?<? 지정
			psmt.setString(1, vo.getMemberId());
			psmt.setString(2, vo.getMemberPwd());
			psmt.setString(3, vo.getMemberName());
			psmt.setString(4, vo.getMemberEmail());
			psmt.setString(5, vo.getMemberTel());
			r=psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return r;
	}

	@Override
	public int updateMember(MemberVO vo) {
		
		return 0;
	}

	@Override
	public int deleteMember(MemberVO vo) {
	
		return 0;
	}

	
	private void close() {
		if(rs!=null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		if(psmt!=null)
			try {
				psmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		if(conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}
