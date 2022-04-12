package com.busKiosk.demo.dto;

import lombok.Data;

@Data
public class TimetableDto {
	private String busNo;
	private String dpt_st;
	private String arrv_st;
	private String ddate;
	private String adate;
	private int seat;
	private int unBookedSeat;
	private String grade;
	private String company;

}
