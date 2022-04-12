package com.busKiosk.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.busKiosk.demo.dao.IBusDao;
import com.busKiosk.demo.dto.BusDto;

// 버스 목록
@Service
public class BusService implements IBusService{
	
	@Autowired
	private IBusDao bdao;
	
	@Override // 1. 조회 
	public List<BusDto> busList(){
		return bdao.busList();
	};
		
	@Override // 2. 검색(버스명) 
	public List<BusDto> searchBus(String busNo){
		return bdao.searchBus(busNo);
	};
		
	@Override // 3. 추가 
	public int insertBus(Map<String, String> map) {
		return bdao.insertBus(map);
	};
		
	@Override // 4. 수정
	public int updateBus(Map<String, String> map) {
		return bdao.updateBus(map);
	};
		
	@Override // 5. 삭제
	public int deleteBus(String busNo) {
		return bdao.deleteBus(busNo);
	};	
	
	
}
