package com.company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminPage {
	@Autowired
	AdminService service;
	
	@GetMapping("/adminPage")
	public void adminPage() {
		log.info("admin 시작");
	}
	
	@PostMapping("/adminPage")
	public String adminLogin(String adminId,String adminPassword,RedirectAttributes attr,HttpSession session) {
		log.info(adminId);
		log.info(adminPassword);
		
		String admin = service.adminLogin(adminId, adminPassword);
		if(admin != null) {
			session.setAttribute("admin", admin);
			return "redirect:/";
		}else {
			attr.addFlashAttribute("error", "아이디와 비밀번호를 확인해주세요.");
			return "redirect:/adminPage";
		}
	}
}
