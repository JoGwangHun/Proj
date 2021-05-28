package com.proj.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.member.memberJoin;
import com.proj.member.memberJoinForm;
import com.proj.member.memberLogin;
import com.proj.thing.web.ThingList;
import com.proj.thing.web.ThingSelect;

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
		
		// 상품 홈페이지
		map.put("/thingList.do", new ThingList());

		map.put("/memberLogin.do", new memberLogin());

		map.put("/thingSelect.do", new ThingSelect());
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
