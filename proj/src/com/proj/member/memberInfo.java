package com.proj.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;

public class memberInfo implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*String id=request.getParameter("id");
		 MemberVO vo = new MemberVO();
		 vo.setMemberId(id);
		 
		 MemberService service= new MemberServiceImpl();
		service.selectMember(vo);
		System.out.println(vo); 
		
		 request.setAttribute("vo", vo);
		 */
		return "member/memberInfo.tiles";
	}

}
