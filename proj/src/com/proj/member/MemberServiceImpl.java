package com.proj.member;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proj.common.DAO;

public class MemberServiceImpl extends DAO implements MemberService{
	
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	
	public int AdminDel(MemberVO vo) {
		sql="delete from member where member_id=?";
		int r=0;
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			r=psmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return r;
		
	}
	
	//회원정보 변경
	public int infoAlter(String email,String tel,String id) {
		sql="update member set member_email=? , member_tel=? where member_id=?";
		int r=0;
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, tel);
			psmt.setString(3, id);
			r=psmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
		return r;
	}

	
	//비밀번호 변경
	public int updatePwd(String id,String password, String newPassword) {
		sql="update  member set member_pwd=? where member_id=? and member_pwd=?";
		int r=0;
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, newPassword);
			psmt.setString(2, id);
			psmt.setString(3, password);
			r=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return r;
	}
	
	//id ,passwd를 체크해주는 
	public MemberVO loginCheck(MemberVO vo) {
		sql="select * from member where member_id=? and member_pwd=?";
		MemberVO  rvo=null;
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			psmt.setString(2, vo.getMemberPwd());
			rs=psmt.executeQuery();
			if(rs.next()) {
				rvo=new MemberVO();
				rvo.setMemberId(rs.getString("member_id"));
				rvo.setMemberPwd(rs.getString("member_pwd"));
				rvo.setMemberName(rs.getString("member_name"));
				rvo.setMemberEmail(rs.getString("member_email"));
				rvo.setMemberTel(rs.getString("member_tel"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
		return rvo;
	}
	
	
	//id를 중복 인지 체크 해주는 메소드 / 중복존재하면 true/아니면 false
		public boolean idCheck(String id) {
			
			boolean exist=false;
			String sql = "select member_id from member where member_id=?";
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, id);
				rs=psmt.executeQuery();
				if(rs.next()) {
					exist=true;
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				close();
			}
			return exist;
		}
	
	
	
	@Override
	public List<MemberVO> MemberList() {
		List<MemberVO> list= new ArrayList<MemberVO>();
		sql="select * from member order by 1";
		try {
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			while(rs.next()) {
				MemberVO vo= new MemberVO();
				vo.setMemberId(rs.getString("member_id"));
				vo.setMemberPwd(rs.getString("member_pwd"));
				vo.setMemberName(rs.getString("member_name"));
				vo.setMemberEmail(rs.getString("member_email"));
				vo.setMemberTel(rs.getString("member_tel"));
				list.add(vo);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
				
		return list;
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
		sql="update member set member_pwd=?, member_name=?, member_email=?,member_tel=? where member_id=?";
		int r=0;
		 	try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, vo.getMemberPwd());
				psmt.setString(2, vo.getMemberName());
				psmt.setString(3, vo.getMemberEmail());
				psmt.setString(4, vo.getMemberTel());
				psmt.setString(5, vo.getMemberId());
				r=psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
		 	
		
		return r;
	}

	@Override
	public int deleteMember(MemberVO vo) {
		int r=0;
		sql="delete from member where member_id=? and member_pwd=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			psmt.setString(2, vo.getMemberPwd());
			r=psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return r;
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


	@Override
	public MemberVO selectMember(MemberVO vo) {
		sql="select * from member where member_id=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			rs=psmt.executeQuery();
			if(rs.next()) {
				vo.setMemberId(rs.getString("member_id"));
				vo.setMemberPwd(rs.getString("member_pwd"));
				vo.setMemberName(rs.getString("member_name"));
				vo.setMemberEmail(rs.getString("member_email"));
				vo.setMemberTel(rs.getString("member_tel"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
		return vo;
	}
}
