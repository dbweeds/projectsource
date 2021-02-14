package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
		boolean yn = service.regist(info);
		
		if(yn) {
			rttr.addFlashAttribute("message", "입력에 성공했습니다.");			
		}else {
			rttr.addFlashAttribute("message", "입력에 실패했습니다.");						
		}
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
		model.addAttribute("searchvo",vo);
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
	@GetMapping("/count")
	public String count(int bno) {
		service.count(bno);
		return "redirect:inforead?bno="+bno;
	}
	
	//차량 삭제
	@PostMapping("/remove")
	public String remove(int bno,RedirectAttributes rttr) {
		log.info("삭제"+bno);
		boolean yn = service.remove(bno);
		if(yn) {
			rttr.addFlashAttribute("message", "삭제에 성공했습니다.");			
		}else {
			rttr.addFlashAttribute("message", "삭제에 실패했습니다.");						
		}
		return "redirect:list";
	}
	
	//차량 수정 -제목,내용
	@PostMapping("/modify")
	public String modify(CarInfoVO info,RedirectAttributes rttr) {
		log.info("내용 수정"+info);
		boolean yn = service.modify(info);
		if(yn) {
			rttr.addFlashAttribute("message", "수정에 성공했습니다.");			
		}else {
			rttr.addFlashAttribute("message", "수정에 실패했습니다.");						
		}
		return "redirect:inforead?bno="+info.getBno();
	}
	@GetMapping(value = "/countlist", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<CarInfoVO>> countList(){
		List<CarInfoVO> countvo = service.countlist();
		return new ResponseEntity<List<CarInfoVO>>(countvo,HttpStatus.OK);
	}

	
	
}
