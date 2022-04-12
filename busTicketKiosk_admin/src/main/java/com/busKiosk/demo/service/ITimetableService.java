package com.busKiosk.demo.service;

import java.util.List;
import java.util.Map;


import com.busKiosk.demo.dto.TimetableDto;

//배차 시간표
public interface ITimetableService {
	// 1-1. 조회(버스별)
	List<TimetableDto> busTimetableList(String busNo);
	// 1-2. 조회(역별)
	List<TimetableDto> stationTimetableList(String station);
	
	// 2-1. 검색(버스별-배차)
	List<TimetableDto> searchBusTimetable(String busNo, String ddate);
	// 2-2. 검색(역별-배차)
	List<TimetableDto> searchStationTimetable(String station, String ddate);
	
	// 3. 시간표 추가 + 버스좌석 테이블 생성 + 좌석정보 추가
	int insertBusTimetable(Map<String, String> map, Map<String, String> map2, String tableId, int seatNo);
	
	// 4. 수정
	int updateTimetable(Map<String, String> map);
		
	// 5-1. 삭제(버스별)
	int deleteTimetable(String busNo, String ddate);

}
