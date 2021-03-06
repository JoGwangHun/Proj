package com.proj.info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.common.DbCommand;
import com.proj.member.MemberService;
import com.proj.member.MemberServiceImpl;

public class infoUpdatePwdForm implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session= request.getSession();
		String pwd=request.getParameter("UdPwd1");
		String newPwd=request.getParameter("UdPwd2");
		String id=(String)session.getAttribute("id");
		
		MemberServiceImpl service=new MemberServiceImpl();
		int r=service.updatePwd(id, pwd, newPwd);
		if(r>0) { //비밀번호 변경이 된 경우
			return "member/successInfoUpdate.tiles";
		}else {
			return "member/failInfoUpdate.tiles";
		}

	}

}
