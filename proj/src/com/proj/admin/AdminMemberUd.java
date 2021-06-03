package com.proj.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.member.MemberService;
import com.proj.member.MemberServiceImpl;
import com.proj.member.MemberVO;

public class AdminMemberUd implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String id=request.getParameter("UdId");
			MemberVO vo= new MemberVO();
			vo.setMemberId(id);
			
			MemberService service = new MemberServiceImpl();
			MemberVO rvo=service.selectMember(vo);
			
			
			request.setAttribute("rvo", rvo);
			
		return "admin/AdminMemberUdForm.tiles";
	}

}
