package com.proj.thing.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.thing.service.ThingService;
import com.proj.thing.serviceImpl.ThingServiceImpl;
import com.proj.thing.vo.ThingVO;

public class ThingUpdate implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("chId");
		String title = request.getParameter("chTitle");
		String price = request.getParameter("chPrice");
		String desc = request.getParameter("chDesc");
		String dayPrice1 = request.getParameter("chDayPrice1");
		String dayPrice2 = request.getParameter("chDayPrice2");
		String dayPrice3 = request.getParameter("chDayPrice3");
		String dayPrice4 = request.getParameter("chDayPrice4");
		String image = request.getParameter("chImage");
		String detailImage = request.getParameter("chDetailImage");
		String detailDesc = request.getParameter("chDetailDesc");
		String kind = request.getParameter("chKind");
		
		ThingVO vo = new ThingVO();
		
		vo.setThingId(Integer.parseInt(id));
		vo.setThingName(title);
		vo.setThingPrice(Integer.parseInt(price));
		vo.setThingDesc(desc);
		vo.setPrice1(Integer.parseInt(dayPrice1));
		vo.setPrice2(Integer.parseInt(dayPrice2));
		vo.setPrice3(Integer.parseInt(dayPrice3));
		vo.setPrice4(Integer.parseInt(dayPrice4));
		vo.setThingImage(image);
		vo.setThingImageDetail(detailImage);
		vo.setThingDetailDesc(detailDesc);
		vo.setThingKind(kind);
		
		ThingService service = new ThingServiceImpl();
		int n = service.updateThing(vo);
		
		String path = null;
		if(n > 0) {
			path = "thingList.do";
		} else {
			path = "index.do";
		}
		
		return path;
	}

}
