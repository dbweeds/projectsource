package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.BenefitVO;
import com.company.service.BenefitService;

import lombok.extern.slf4j.Slf4j;

//전기자동차 해택 컨트롤러
@Controller
@Slf4j
@RequestMapping("/benefitSupport/*")
public class BenefitSupportController {
	@Autowired
	BenefitService service;
	
	@GetMapping("/test")
	public void getest() {
		log.info("test시작");
	}
	@GetMapping("/SvAmount")
	public void getest2() {
		log.info("test2시작");
	}
	@GetMapping("/PCAmount")
	public void getest3() {
		log.info("PCAmount");
	}
	
	@PostMapping(value = "/evFuel", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Double> evFuel(@RequestBody String model){
		log.info(model);
		double fuel = service.getFuel(model);
		return new ResponseEntity<Double>(fuel,HttpStatus.OK);
	}
	@PostMapping(value = "/evVO", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<BenefitVO> evVO(@RequestBody String model){
		log.info(model);
		BenefitVO vo = service.getVO(model);
		return new ResponseEntity<BenefitVO>(vo,HttpStatus.OK);
	}

}
