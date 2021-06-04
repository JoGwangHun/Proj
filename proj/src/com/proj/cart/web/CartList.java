package com.proj.cart.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.common.DbCommand;
import com.proj.thing.serviceImpl.ThingServiceImpl;
import com.proj.thing.vo.CartVO;

public class CartList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("id");
		
		ThingServiceImpl service = new ThingServiceImpl();
		
		List<CartVO> list = service.getCartList(user_id);
		
		service = new ThingServiceImpl();
		int total = service.getTotalPrice(user_id);
		
		request.setAttribute("total", total);
		request.setAttribute("list", list);
		
		service = new ThingServiceImpl();
		session.setAttribute("cartCnt", service.getCountCart(user_id));

		return "/cart/checkOut.tiles";
	}

}
