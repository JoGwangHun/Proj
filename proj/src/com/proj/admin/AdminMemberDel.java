package com.proj.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.member.MemberService;
import com.proj.member.MemberServiceImpl;
import com.proj.member.MemberVO;

public class AdminMemberDel implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("DelId");
		MemberVO vo= new MemberVO();
		vo.setMemberId(id);
		
		MemberServiceImpl service= new MemberServiceImpl();
		int r=service.AdminDel(vo);
		if(r>0) {
			return "admin/adminMemberDelSuccess.tiles";
		}else {
			return "";
		}
		
		
		
	
	}

}
