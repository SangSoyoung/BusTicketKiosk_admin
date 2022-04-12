package com.busKiosk.demo.service;

import java.util.List;
import java.util.Map;

import com.busKiosk.demo.dto.BusDto;

//버스 목록
public interface IBusService {
	// 1. 조회 
	List<BusDto> busList();
		
	// 2. 검색(버스명) 
	List<BusDto> searchBus(String busNo);
		
	// 3. 추가 
	int insertBus(Map<String, String> map);
		
	// 4. 수정
	int updateBus(Map<String, String> map);
		
	// 5. 삭제
	int deleteBus(String busNo);	
}
