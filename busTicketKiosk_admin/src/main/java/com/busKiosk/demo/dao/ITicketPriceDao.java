package com.busKiosk.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.busKiosk.demo.dto.TicketPriceDto;

// 버스 요금
@Mapper
public interface ITicketPriceDao {
	// 1. 조회 
	List<TicketPriceDto> ticketPriceList();
	
	// 2. 추가
	int insertTicketPrice(Map<String, String> map);
	
	// 3. 수정 
	int updateTicketPrice(Map<String, String> map);
	
	// 4. 삭제
	int deleteTicketPrice(@Param("type") String type);
}
