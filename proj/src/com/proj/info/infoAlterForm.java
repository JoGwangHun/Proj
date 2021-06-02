package com.proj.info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.common.DbCommand;
import com.proj.member.MemberServiceImpl;

public class infoAlterForm implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session= request.getSession();
		String email=request.getParameter("email");
		String tel=request.getParameter("tel");
		String id=(String)session.getAttribute("id");
		
		MemberServiceImpl service=new MemberServiceImpl();
		int r=service.infoAlter(email, tel, id);
		if(r>0) { //정보 변경이 된 경우
			return "member/successInfoAlter.tiles";
		}else {
			return "member/failInfoAlter.tiles";
		}

	}
}
