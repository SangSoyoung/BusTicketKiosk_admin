package com.busKiosk.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.busKiosk.demo.dto.BusDto;

// 버스 목록
@Mapper
public interface IBusDao {
	// 1. 조회 
	List<BusDto> busList();
	
	// 2. 검색(버스명) 
	List<BusDto> searchBus(@Param("busNo") String busNo);
	
	// 3. 추가 
	int insertBus(Map<String, String> map);
	
	// 4. 수정
	int updateBus(Map<String, String> map);
	
	// 5. 삭제
	int deleteBus(@Param("busNo") String busNo);
	
}
