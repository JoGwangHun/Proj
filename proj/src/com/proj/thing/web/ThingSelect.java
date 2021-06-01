package com.proj.thing.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.thing.service.ThingService;
import com.proj.thing.serviceImpl.ThingServiceImpl;
import com.proj.thing.vo.ThingVO;

public class ThingSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("itemId");
		
		ThingService service = new ThingServiceImpl();
		ThingVO vo = service.ThingSelect(id);
		
		request.setAttribute("vo", vo);
		
		return "thing/thingSelect.tiles";
	}

}
