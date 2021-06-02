package com.proj.info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.common.DbCommand;
import com.proj.member.MemberService;
import com.proj.member.MemberServiceImpl;
import com.proj.member.MemberVO;

public class infoAlter implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			HttpSession session = request.getSession();
		   String id= (String) session.getAttribute("id");
			MemberVO vo = new MemberVO();
			vo.setMemberId(id);
			
			MemberService service= new MemberServiceImpl();
			MemberVO rvo=service.selectMember(vo);
			rvo.getMemberEmail();
			rvo.getMemberId();
			rvo.getMemberPwd();
			rvo.getMemberName();
			rvo.getMemberTel();
			
			request.setAttribute("rvo", rvo);
		
		return "member/infoAlter.tiles";
	}

}
