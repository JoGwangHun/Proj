package com.proj.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.member.MemberService;
import com.proj.member.MemberServiceImpl;
import com.proj.member.MemberVO;

public class adminMemberList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberService service=new MemberServiceImpl();
		List<MemberVO> list=service.MemberList();
		
		request.setAttribute("AdminList", list);
		
		return "admin/adminMemberList.tiles";
	}

}
