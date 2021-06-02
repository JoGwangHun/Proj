package com.proj.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.common.DbCommand;

public class memberDeleteForm implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		MemberVO vo= new MemberVO();
		vo.setMemberId(id);
		vo.setMemberPwd(pwd);
		
		MemberService service = new MemberServiceImpl();
		int r=service.deleteMember(vo);
		if(r>0) {
			return "member/deleteSuccess.tiles";
		}else {
			return "member/deleteFail.tiles";
		}
	
	}

}
