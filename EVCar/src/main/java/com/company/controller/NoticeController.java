package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.NoticeVO;
import com.company.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/comunity/*")
public class NoticeController {
	
	private NoticeService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("noticeList");
		
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping("/register")
	public String register(NoticeVO notice, RedirectAttributes rttr) {
		
		log.info("notice register" + notice);
		
		service.register(notice);
		
		rttr.addFlashAttribute("result", notice.getBno());
		
		return "redirect:/comunity/noticeList";
	}
	
	@GetMapping("/get")
	public String get(@RequestParam("bno") int bno, Model model) {
		
		log.info("notice get");
		model.addAttribute("notice", service.get(bno));
		
		//조회수+1
		service.plusCnt(bno);
		
		return "redirect:/comunity/noticeGet";
	}
	
	@PostMapping("")
	public String modify(NoticeVO notice, RedirectAttributes rttr) {
		log.info("notice modify:" + notice);
		
		if (service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/comunity/noticeList";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr) {
		
		log.info("notice delete" + bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/comunity/noticeList";
	}
} 
