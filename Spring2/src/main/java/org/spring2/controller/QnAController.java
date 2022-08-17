package org.spring2.controller;

import org.spring2.model.QnAVO;
import org.spring2.service.QnAService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnAController {
	@Autowired
	QnAService qs;
	
	@RequestMapping(value = "/qna/list", method = RequestMethod.GET)
	public void QnA(Model model) {
		model.addAttribute("list",qs.qnaList());
	}
	
	@RequestMapping(value = "/qna/list", method = RequestMethod.POST)
	public void QnA(QnAVO qvo) {
		System.out.println(qvo.getTitle());
		System.out.println(qvo.getContent());
		
	}
	
	@RequestMapping(value = "/qna/write", method = RequestMethod.POST)
	public void Write() {
	}
	
	@RequestMapping(value = "/qna/content", method = RequestMethod.GET)
	public void Content() {
	}
}
