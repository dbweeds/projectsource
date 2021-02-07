package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.CarInfoVO;
import com.company.service.InfoService;

import lombok.extern.slf4j.Slf4j;

//자동차 소개 컨트롤러
@Controller
@Slf4j
@RequestMapping("/info/*")
public class InfoController {
	
	@Autowired
	private InfoService service;
	
	//등록 폼
	@GetMapping("/infoRegist")
	public void regist() {
		log.info("등록 폼 OPEN...");
	}
	
	//작성
	@PostMapping("/infoRegist")
	public String registPost(CarInfoVO info){
		log.info("차량 등록..."+info);
		service.regist(info);
		return "redirect:list";
	}
	
	//목록
	@GetMapping("/list")
	public void list(Model model) {
		log.info("전기차 목록...");
		List<CarInfoVO> list = service.getList();
		model.addAttribute("list",list);

	}
	//읽기, 수정
	@GetMapping({"/inforead","/modify"} )
	public void get(int bno,Model model) {
		log.info("차량 상세페이지..."+bno);
		CarInfoVO info=service.getRow(bno);
		model.addAttribute("info", info);
	}
	
	//차량 삭제
	@PostMapping("/remove")
	public String remove(int bno) {
		log.info("삭제"+bno);
		service.remove(bno);
		return "redirect:list";
	}
	
	//차량 수정 -제목,내용
	@PostMapping("/modify")
	public String modify(CarInfoVO info) {
		log.info("내용 수정"+info);
		service.modify(info);
		return "redirect:list";
	}
	
	//검색 ..모르겠다;;
	
	
}
