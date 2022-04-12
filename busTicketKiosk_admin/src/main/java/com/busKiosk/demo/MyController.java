package com.busKiosk.demo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.busKiosk.demo.dto.BusDto;
import com.busKiosk.demo.service.IBusService;

@Controller
public class MyController {

	@Autowired
	private IBusService bsvc;
	
	@RequestMapping("/")
	public String root() throws Exception {
		return "index";
	}
	
	// 버스목록 페이지
	@RequestMapping("/busList")
	public String busList() {
		
		return "busList";
	}
	
	// (전체)버스목록
	@RequestMapping("/getbusList")
	public @ResponseBody List<BusDto> getbusList() {
		List<BusDto> list = bsvc.busList();
		return list;
	}
	
	// (버스명-검색)버스목록
	@RequestMapping("/searchBus")
	public @ResponseBody List<BusDto> searchBus(HttpServletRequest request){
		
		String busNo = request.getParameter("keyword");
		System.out.println(busNo);
		
		List<BusDto> list = bsvc.searchBus(busNo);
		return list;
	}
	
	// 버스등록
	@RequestMapping("/insertBus")
	public String insertBus(HttpServletRequest request) {

		Map<String, String> map = new HashMap<>();
		map.put("items1", request.getParameter("busNo"));
		map.put("items2", request.getParameter("seat"));
		map.put("items3", request.getParameter("grade"));
		map.put("items4", request.getParameter("company"));
		map.put("items5", request.getParameter("plate"));
		map.put("items6", request.getParameter("driver"));
		
		bsvc.insertBus(map);
		
		return "redirect:busList";
	}

	
}
