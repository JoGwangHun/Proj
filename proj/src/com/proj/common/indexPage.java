package com.proj.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.thing.serviceImpl.ThingServiceImpl;

public class indexPage implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("id");
		ThingServiceImpl service = new ThingServiceImpl();
		session.setAttribute("cartCnt", service.getCountCart(user_id));
		
		return "main/main.tiles";
	}

}
