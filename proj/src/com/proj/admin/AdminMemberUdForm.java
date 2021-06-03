package com.proj.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.member.MemberService;
import com.proj.member.MemberServiceImpl;
import com.proj.member.MemberVO;

public class AdminMemberUdForm implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("UdId");
		String pwd=request.getParameter("rvoPwd");
		String name=request.getParameter("rvoName");
		String email=request.getParameter("rvoEmail");
		String tel=request.getParameter("rvoTel");
		
		MemberVO vo= new MemberVO();
		vo.setMemberPwd(pwd);
		vo.setMemberName(name);
		vo.setMemberEmail(email);
		vo.setMemberTel(tel);
		vo.setMemberId(id);
		
		System.out.println(vo);
		MemberService service= new MemberServiceImpl();
		int r=service.updateMember(vo);
		
		if(r>0) {
			return "admin/SuccessAdminUdForm.tiles";
		}else {
			return "";
		}
		

	}

}
