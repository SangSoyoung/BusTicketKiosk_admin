package com.busKiosk.demo.service;

import java.util.List;
import java.util.Map;

import com.busKiosk.demo.dto.StationDto;

//버스역 목록
public interface IStationService {
	// 1. 조회
	List<StationDto> stationList();
	
	// 2. 검색(역명)
	List<StationDto> searchStation(String station);
		
	// 3. 추가
	int insertStation(Map<String, String> map);
	
	// 4. 수정
	int updateStation(Map<String, String> map);
		
	// 5. 삭제
	int deleteStation(String station);
}
