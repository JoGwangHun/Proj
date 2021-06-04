package com.proj.cart.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.thing.serviceImpl.ThingServiceImpl;

public class DeleteCartList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		ThingServiceImpl service = new ThingServiceImpl();
		
		service.deleteCartList(user_id);
		
		return "index.do";
	}

}
