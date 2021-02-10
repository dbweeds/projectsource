package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.CarInfoVO;
import com.company.domain.CarSearchVO;
import com.company.domain.InfoCriateria;
import com.company.domain.InfoPageVO;
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
	public String registPost(CarInfoVO info,RedirectAttributes rttr){
		log.info("차량 등록..."+info);
		service.regist(info);
		log.info("글번호"+info.getBno()+info.getCarname());
		
		rttr.addFlashAttribute("result", info.getBno());
		return "redirect:list";
	}
	
	//목록
	@GetMapping("/list")
	public void list(Model model, InfoCriateria cri,CarSearchVO vo) {
		log.info("전기차 목록...");
		log.info("검색vo"+vo);
		log.info("페이지cri"+cri);
		vo.setCri(cri);
		//목록
		List<CarInfoVO> list = service.getList(vo);
		//게시물수
		int total = service.getTotalCnt(vo);
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		model.addAttribute("infoPageVO", new InfoPageVO(cri, total));
 
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
	public String remove(int bno,RedirectAttributes rttr) {
		log.info("삭제"+bno);
		service.remove(bno);
		rttr.addFlashAttribute("result", "success");
		return "redirect:list";
	}
	
	//차량 수정 -제목,내용
	@PostMapping("/modify")
	public String modify(CarInfoVO info,RedirectAttributes rttr) {
		log.info("내용 수정"+info);
		service.modify(info);
		rttr.addFlashAttribute("result", "success");
		return "redirect:list";
	}
	
	//검색 ..모르겠다;;
	
	
}
