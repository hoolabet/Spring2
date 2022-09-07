package org.spring2.controller;

import org.spring2.model.RICriteriaVO;
import org.spring2.model.InquiryVO;
import org.spring2.model.RIPageVO;
import org.spring2.model.ReviewVO;
import org.spring2.service.InquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InquiryController {
	
	@Autowired
	InquiryService is;
	
	// 문의 목록, 페이징
	@RequestMapping(value = "/board/inquiry", method = RequestMethod.GET)
	public String list(Model model,RICriteriaVO cri) {
		model.addAttribute("list",is.list(cri));
		int total = is.total(cri);
		// System.out.println("문의 : "+total);
		model.addAttribute("paging",new RIPageVO(cri, total));
		return "/board/inquiry";
	}
	// 문의 작성(get)
	@RequestMapping(value = "/inquiry/write", method = RequestMethod.GET)
	public String writeGet() {
		System.out.println("write연결 get");
		return "/board/newreview";
	}
	// 문의 작성(post)
	@RequestMapping(value = "/inquiry/write", method = RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody InquiryVO ivo){
		int result = is.write(ivo);
		
		System.out.println("writecontroller"+ivo);
		
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
