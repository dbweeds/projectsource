package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

//전기차 충전소 컨트롤러
@Controller
@Slf4j
@RequestMapping("/chargerMap/*")
public class ChargerMapController {
	
	@GetMapping("/test")
	public void getest() {
		log.info("test시작");
	}
}
