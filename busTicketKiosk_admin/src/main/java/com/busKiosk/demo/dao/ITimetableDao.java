package com.busKiosk.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.busKiosk.demo.dto.TimetableDto;

// 배차 시간표
@Mapper
public interface ITimetableDao {	
	// 1-1. 조회(버스별)
	List<TimetableDto> busTimetableList(@Param("busNo") String busNo);
	// 1-2. 조회(역별)
	List<TimetableDto> stationTimetableList(@Param("station") String station);
	
	// 2-1. 검색(버스별-배차)
	List<TimetableDto> searchBusTimetable(@Param("busNo") String busNo, @Param("ddate") String ddate);
	// 2-2. 검색(역별-배차)
	List<TimetableDto> searchStationTimetable(@Param("busNo") String station, @Param("ddate") String ddate);
	
	// 3. 시간표 추가 
	int insertBusTimetable(Map<String, String> map);
	// 3-1. 버스좌석 테이블 생성
	int createSeatTable(Map<String, String> map2);
	// 3-2. 좌석정보 추가
	int insertSeatData(@Param("tableId") String tableId, @Param("seatNo") int seatNo);
	
	// 4. 수정
	int updateTimetable(Map<String, String> map);
		
	// 5-1. 삭제(버스별)
	int deleteTimetable(@Param("busNo") String busNo, @Param("ddate") String ddate);

}
