package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.Criteria;
import com.company.domain.NoticeVO;
import com.company.domain.PageDTO;
import com.company.domain.QAVO;
import com.company.service.QAService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/comunity/*")
public class QAController {

	@Autowired
	private QAService service;
	
	@GetMapping("/QAList")
	public void QAList(Criteria cri, Model model) {
		
		log.info("QAList:"+cri);
		
		model.addAttribute("QA", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotalCount(cri)));
		
	}
	
	@GetMapping("/QARegister")
	public void register() {
		
	}
	
	@PostMapping("/QARegister")
	public String register(QAVO QA, RedirectAttributes rttr) {
		
		log.info("notice register" + QA);
		
		service.register(QA);
		
		rttr.addFlashAttribute("result", QA.getBno());
		
		return "redirect:/comunity/QAList";
	}
	
	//조회수 올리기
	@GetMapping({"/QAHitUpdate"})
	public String hitUpdate(@RequestParam("bno") int bno,  RedirectAttributes rttr) {
		
		log.info("조회수 ");
		
		//조회수+1
		service.plusCnt(bno);
		
		rttr.addAttribute("bno", bno);
		return "redirect:QAGet";
	}
	
	
	@GetMapping({"/QAGet", "/QAModify"})
	public void get(@RequestParam("bno") int bno, Model model) {
		
		log.info("QAGet or QAModify");
		model.addAttribute("QA", service.get(bno));
		
		
	}
	
	@PostMapping("/QAModify")
	public String modify(QAVO QA, RedirectAttributes rttr) {
		log.info("QA modify:" + QA);
		
		if (service.modify(QA)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/comunity/QAList";
	}
	
	@PostMapping("/QARemove")
	 public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr)
	 {
	
	 log.info("QAremove..." + bno);
	 if (service.remove(bno)) {
	 rttr.addFlashAttribute("result", "success");
	 }
	 return "redirect:/comunity/QAList";
	 }
	
	
	@GetMapping({"/password"})
	public void passwordForm(@RequestParam("bno") int bno,Model model) {
		
		log.info("비밀번호 확인 "+bno);
		
		model.addAttribute("bno", bno);
		
		//조회수+1
		//service.plusCnt(bno);
	}
	@PostMapping({"/password"})
	public String passwordForm(@RequestParam("bno") int bno,@RequestParam("password") int password,RedirectAttributes rttr) {
		
		log.info("비밀번호 확인");
		
		rttr.addAttribute("bno", bno);
		
		//비밀번호 확인
		if(service.checkPw(password, bno)) {
			//맞으면 -> QAGet.pa
			return "redirect:QAHitUpdate";
			
			
		}else {
		//틀리면 -> 비밀번호 입력
			return "redirect:password";
		
		}
	}
	
} 
