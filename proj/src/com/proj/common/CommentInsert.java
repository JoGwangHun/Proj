package com.proj.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.thing.serviceImpl.ThingServiceImpl;
import com.proj.thing.vo.CommentVO;

public class CommentInsert implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String comment = request.getParameter("comment");
		String thing_id = request.getParameter("thing_id");
		
		ThingServiceImpl service = new ThingServiceImpl();
		
		int parseThing_id = Integer.parseInt(thing_id);
		
		service.commentInsert(user_id, comment, parseThing_id);
		
		service = new ThingServiceImpl();
		List<CommentVO> list = service.commentGetList(parseThing_id);
		
		return "thingSelect.do?itemId=" + thing_id;
	}

}
