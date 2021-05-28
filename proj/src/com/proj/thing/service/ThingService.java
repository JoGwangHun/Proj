package com.proj.thing.service;

import java.util.List;

import com.proj.thing.vo.ThingVO;

public interface ThingService {
	List<ThingVO> thingGetList();
	
	ThingVO ThingSelect(int id);

	int insertThing(ThingVO vo);

	int updateThing(ThingVO vo);

	int deleteThing(ThingVO vo);
}
