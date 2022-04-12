package com.busKiosk.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;

import com.busKiosk.demo.dao.ITimetableDao;
import com.busKiosk.demo.dto.TimetableDto;

//배차 시간표
@Service
public class TimetableService implements ITimetableService {
	
	@Autowired
	private ITimetableDao tdao;
	
	@Autowired
	PlatformTransactionManager tm;
	@Autowired
	TransactionDefinition definition;
	
	
	@Override // 1-1. 조회(버스별)
	public List<TimetableDto> busTimetableList(String busNo) {
		return tdao.busTimetableList(busNo);
	}

	@Override // 1-2. 조회(역별)
	public List<TimetableDto> stationTimetableList(String station) {
		return tdao.stationTimetableList(station);
	}

	@Override // 2-1. 검색(버스별-배차)
	public List<TimetableDto> searchBusTimetable(String busNo, String ddate) {
		return tdao.searchBusTimetable(busNo, ddate);
	}

	@Override // 2-2. 검색(역별-배차)
	public List<TimetableDto> searchStationTimetable(String station, String ddate) {
		return tdao.searchStationTimetable(station, ddate);
	}

	@Override // 3. 시간표 추가 + 버스좌석 테이블 생성 + 좌석정보 추가
	public int insertBusTimetable(Map<String, String> map, Map<String, String> map2, String tableId, int seatNo) {
		
		TransactionStatus status = tm.getTransaction(definition);
		
		try {
			tdao.insertBusTimetable(map); // 시간표 추가
			tdao.createSeatTable(map2); // 버스좌석 테이블 생성
			tdao.insertSeatData(tableId, seatNo); // 좌석정보 추가
			
			return 1;
		} catch(Exception e) {
			System.out.println("버스시간표 등록, 버스좌석 테이블 생성, 버스좌석정보 등록시 에러발생으로 rollback");
			tm.rollback(status);
			return 0;
		}
	}

	@Override // 4. 수정
	public int updateTimetable(Map<String, String> map) {
		return tdao.updateTimetable(map);
	}

	@Override // 5. 삭제
	public int deleteTimetable(String busNo, String ddate) {
		return tdao.deleteTimetable(busNo, ddate);
	}

	
}
