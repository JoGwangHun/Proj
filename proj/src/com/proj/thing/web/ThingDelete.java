package com.proj.thing.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.thing.service.ThingService;
import com.proj.thing.serviceImpl.ThingServiceImpl;
import com.proj.thing.vo.ThingVO;

public class ThingDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("delId");
		
		ThingVO vo = new ThingVO();
		ThingService service = new ThingServiceImpl();
		
		vo.setThingId(Integer.parseInt(id));
		
		int n = service.deleteThing(vo);
		String path = null;
		
		if(n > 0) {
			path = "thingList.do";
		} else {
			path = "index.do";
		}
		
		return path;
	}

}
