package com.company.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UploadController {
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("ajax 업로드 폼 요청");
	}

	@PostMapping(value = "/uploadAjax", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> uploadPost(MultipartFile uploadFile,HttpServletRequest req) {
		log.info("업로드 요청"+uploadFile);
		String uploadFolder = req.getServletContext().getRealPath("\\resources\\assets\\custom\\infoimage");		
			log.info("---------------------------");
			log.info("upload file name : " + uploadFile.getOriginalFilename());
			log.info("upload file size : " + uploadFile.getSize());

			File saveFile = new File(uploadFolder, uploadFile.getOriginalFilename());
			try {
				// 서버에 저장
				uploadFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return new ResponseEntity<String>(uploadFile.getOriginalFilename(), HttpStatus.OK);
	}
	
	
}
