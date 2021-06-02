package com.proj.common;

import java.io.IOException;

import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.info.infoAlter;
import com.proj.info.infoAlterForm;
import com.proj.info.infoUpdatePwd;
import com.proj.info.infoUpdatePwdForm;
import com.proj.member.memberInfo;
import com.proj.member.MemberLogOut;
import com.proj.member.memberDelete;
import com.proj.member.memberDeleteForm;
import com.proj.member.memberJoin;
import com.proj.member.memberJoinForm;
import com.proj.member.memberLogin;
import com.proj.member.memberLoginCheck;
import com.proj.thing.web.AddCartCnt;
import com.proj.thing.web.ThingDelete;
import com.proj.thing.web.ThingForm;
import com.proj.thing.web.ThingInsert;
import com.proj.thing.web.ThingList;
import com.proj.thing.web.ThingSelect;
import com.proj.thing.web.ThingUpdate;

public class FrontController  extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, DbCommand> map = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// 메인페이지
		map.put("/index.do", new indexPage());
		
		// 로그인
		map.put("/memberJoinForm.do", new memberJoinForm());
		map.put("/memberJoin.do", new memberJoin());
		map.put("/memberLogin.do", new memberLogin());
		map.put("/memberLogOut.do", new MemberLogOut());

		map.put("/memberLoginCheck.do", new memberLoginCheck());
		map.put("/memberLogOut.do", new MemberLogOut());
		
		
		// 상품 홈페이지
		map.put("/thingList.do", new ThingList());
		map.put("/thingSelect.do", new ThingSelect());
		map.put("/thingDelete.do", new ThingDelete());
		map.put("/thingUpdate.do", new ThingUpdate());
		map.put("/thingForm.do", new ThingForm());
		map.put("/thingInsert.do", new ThingInsert());

		//회원 정보
		map.put("/infoAlterForm.do", new infoAlterForm());
		map.put("/infoAlter.do", new infoAlter());
		map.put("/infoUpdatePwd.do", new infoUpdatePwd());
		map.put("/infoUpdatePwdForm.do", new infoUpdatePwdForm());
		map.put("/memberInfo.do", new memberInfo());
<<<<<<< HEAD
		map.put("/memberDelete.do", new memberDelete());
		map.put("/memberDeleteForm.do", new memberDeleteForm());
		
		map.put("/thingDelete.do", new ThingDelete());
		map.put("/thingDelete.do", new ThingDelete());
		map.put("/thingUpdate.do", new ThingUpdate());
		map.put("/thingForm.do", new ThingForm());

=======
		
		// 장바구니 카운트
		map.put("/addCnt.do", new AddCartCnt());
>>>>>>> branch 'master' of https://github.com/Narin88/Proj.git
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		String cpath = req.getContextPath();
		String path = uri.substring(cpath.length());
		DbCommand command = map.get(path);
		String viewPage = command.execute(req, resp);
		
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}
}
