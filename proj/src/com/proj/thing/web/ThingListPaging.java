package com.proj.thing.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.common.DbCommand;
import com.proj.common.Paging;
import com.proj.thing.serviceImpl.ThingServiceImpl;
import com.proj.thing.vo.ThingVO;

public class ThingListPaging implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page"); // 페이지번호.
		if (page == null) {
			page = "1";
		}
		int pageCnt = Integer.parseInt(page);
		
		ThingServiceImpl service = new ThingServiceImpl();
		List<ThingVO> total = service.thingGetList();
		
		service = new ThingServiceImpl();
		List<ThingVO> list = service.thingListPaging(pageCnt);
		
		Paging paging = new Paging();
        paging.setPageNo(pageCnt);
        paging.setPageSize(8);
        paging.setTotalCount(total.size());
        
        request.setAttribute("list", list);
        request.setAttribute("paging", paging);
		
		return "thing/thingListPaging.tiles";
	}

}
