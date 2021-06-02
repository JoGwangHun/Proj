package com.proj.cart.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.common.DbCommand;
import com.proj.thing.serviceImpl.ThingServiceImpl;

public class AddCartCnt implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String thing_id = request.getParameter("thing_id");
		int qty = 1;
		
		ThingServiceImpl service = new ThingServiceImpl();
		service.addCartCnt(user_id, Integer.parseInt(thing_id), qty);
		
		service = new ThingServiceImpl();
		HttpSession session = request.getSession();
		session.setAttribute("cartCnt", service.getCountCart(user_id));
		
		return "thingList.do";
	}

}
