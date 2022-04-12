package com.busKiosk.demo.service;

import java.util.List;
import java.util.Map;

import com.busKiosk.demo.dto.TicketPriceDto;

//버스 요금
public interface ITicketPriceService {
	// 1. 조회 
	List<TicketPriceDto> ticketPriceList();
	
	// 2. 추가
	int insertTicketPrice(Map<String, String> map);
	
	// 3. 수정 
	int updateTicketPrice(Map<String, String> map);
	
	// 4. 삭제
	int deleteTicketPrice(String type);
}
