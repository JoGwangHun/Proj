package com.proj.thing.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.thing.service.ThingService;
import com.proj.thing.serviceImpl.ThingServiceImpl;
import com.proj.thing.vo.ThingVO;

public class ThingInsert implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String kind = request.getParameter("kind");
		String price = request.getParameter("price");
		String desc = request.getParameter("desc");
		String thingImage = request.getParameter("imageName");
		String detailImage = request.getParameter("detailName");
		String descName = request.getParameter("descName");
		String dayPrice1 = request.getParameter("dayPrice1");
		String dayPrice2 = request.getParameter("dayPrice2");
		String dayPrice3 = request.getParameter("dayPrice3");
		String dayPrice4 = request.getParameter("dayPrice4");

		ThingVO vo = new ThingVO();
		vo.setUserId(id);
		vo.setThingName(name);
		vo.setThingKind(kind);
		vo.setThingPrice(Integer.parseInt(price));
		vo.setThingDesc(desc);
		vo.setThingImage(thingImage);
		vo.setThingImageDetail(detailImage);
		vo.setThingDetailDesc(descName);
		vo.setPrice1(Integer.parseInt(dayPrice1));
		vo.setPrice2(Integer.parseInt(dayPrice2));
		vo.setPrice3(Integer.parseInt(dayPrice3));
		vo.setPrice4(Integer.parseInt(dayPrice4));

		ThingService service = new ThingServiceImpl();
		int n = service.insertThing(vo);

		String path = null;
		if (n > 0) {
			path = "thingList.do";
		} else {
			path = "index.do";
		}

		return path;
	}

}
