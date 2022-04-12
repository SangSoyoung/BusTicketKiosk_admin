package com.busKiosk.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.busKiosk.demo.dao.ITicketPriceDao;
import com.busKiosk.demo.dto.TicketPriceDto;

//버스 요금
@Service
public class TicketPriceService implements ITicketPriceService {
	
	@Autowired
	private ITicketPriceDao pdao;
	
	@Override // 1. 조회 
	public List<TicketPriceDto> ticketPriceList() {
		return pdao.ticketPriceList();
	}

	@Override // 2. 추가
	public int insertTicketPrice(Map<String, String> map) {
		return pdao.insertTicketPrice(map);
	}

	@Override // 3. 수정 
	public int updateTicketPrice(Map<String, String> map) {
		return pdao.updateTicketPrice(map);
	}

	@Override // 4. 삭제
	public int deleteTicketPrice(String type) {
		return pdao.deleteTicketPrice(type);
	}

}
