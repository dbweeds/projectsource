package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

//자동차 모델 컨트롤러
@Controller
@Slf4j
@RequestMapping("/int/*")
public class IntController {
	
	@GetMapping("/int1")
	public void getInt1() {
		log.info("전기차란 시작");
	}
	
	@GetMapping("/int2")
	public void getInt2() {
		log.info("전기차 보급목적 시작");
	}
	
}
