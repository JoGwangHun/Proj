package com.proj.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.common.DbCommand;

public class memberJoin implements DbCommand {

		
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException{
			HttpSession session = request.getSession();
			String id=request.getParameter("id");
			String pwd=request.getParameter("pwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String tel= request.getParameter("tel");
			System.out.println(tel);
			
//			MemberVO vo= new MemberVO();
//			vo.setMemberId(id);
//			vo.setMemberPwd(pwd);
//			vo.setMemberName(name);
//			vo.setMemberEmail(email);
//			vo.setMemberTel(tel);
//			
//			MemberService service = new MemberServiceImpl();
//			service.insertMember(vo);
//			
			
	
		
		return "/main/main.tiles";
	}

}
