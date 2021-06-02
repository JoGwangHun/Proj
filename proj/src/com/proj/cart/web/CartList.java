package com.proj.cart.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.thing.serviceImpl.ThingServiceImpl;
import com.proj.thing.vo.CartVO;

public class CartList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		
		ThingServiceImpl service = new ThingServiceImpl();
		
		List<CartVO> list = service.getCartList(user_id);
		
		service = new ThingServiceImpl();
		int total = service.getTotalPrice(user_id);
		
		request.setAttribute("total", total);
		request.setAttribute("list", list);

		return "/cart/checkOut.tiles";
	}

}
