package com.busKiosk.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.busKiosk.demo.dao.IStationDao;
import com.busKiosk.demo.dto.StationDto;

//버스역 목록
@Service
public class StationService implements IStationService {
	
	@Autowired 
	private IStationDao sdao;
	
	@Override // 1. 조회
	public List<StationDto> stationList() {
		return sdao.stationList();
	}

	@Override // 2. 검색(역명)
	public List<StationDto> searchStation(String station) {
		return sdao.searchStation(station);
	}

	@Override // 3. 추가
	public int insertStation(Map<String, String> map) {
		return sdao.insertStation(map);
	}

	@Override // 4. 수정
	public int updateStation(Map<String, String> map) {
		return sdao.updateStation(map);
	}

	@Override // 5. 삭제
	public int deleteStation(String station) {
		return sdao.deleteStation(station);
	}

}
