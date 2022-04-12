package com.busKiosk.demo.dto;

import lombok.Data;

@Data
public class BusDto {
	private String busNo;
	private int seat;
	private String grade;
	private String company;
	private String plate;
	private String driver;
}
