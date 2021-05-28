package com.proj.thing.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.thing.service.ThingService;
import com.proj.thing.serviceImpl.ThingServiceImpl;
import com.proj.thing.vo.ThingVO;

public class ThingList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		ThingService service = new ThingServiceImpl();
		List<ThingVO> list = service.thingGetList();
		
		request.setAttribute("list", list);

		return "thing/thingList.tiles";
	}

}
