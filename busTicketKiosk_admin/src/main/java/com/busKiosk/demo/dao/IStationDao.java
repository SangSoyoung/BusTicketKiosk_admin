package com.busKiosk.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.busKiosk.demo.dto.StationDto;

// 버스역 목록
@Mapper
public interface IStationDao {
	// 1. 조회
	List<StationDto> stationList();
	
	// 2. 검색(역명)
	List<StationDto> searchStation(@Param("station") String station);
		
	// 3. 추가
	int insertStation(Map<String, String> map);
	
	// 4. 수정
	int updateStation(Map<String, String> map);
		
	// 5. 삭제
	int deleteStation(@Param("station") String station);
}
