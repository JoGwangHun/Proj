package com.proj.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.common.DbCommand;

public class memberLoginCheck implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id=request.getParameter("LoginId");
		String pwd=request.getParameter("LoginPwd");
		System.out.print(id);
		System.out.println(pwd);
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		vo.setMemberPwd(pwd);
		
		MemberServiceImpl service= new MemberServiceImpl();
		MemberVO rvo = service.loginCheck(vo);
		
		String path="";
		
		if(rvo ==null) {
			path="member/memberLoginFail.tiles";
		}else {
			path="member/memberLoginSuccess.tiles";
			session.setAttribute("id", rvo.getMemberId());
			request.setAttribute("vo", rvo);
		}
		
		return path;
	}

}
