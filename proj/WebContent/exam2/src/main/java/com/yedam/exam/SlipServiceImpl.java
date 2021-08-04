package com.yedam.exam;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class SlipServiceImpl implements SlipService{

	@Resource	SlipDAO dao;
	
	@Override
	public int insertSlip(List<Slip> slip) {
		//테이블 입력
		
		return 0;  // 처리 건수 리턴;
	}

}
