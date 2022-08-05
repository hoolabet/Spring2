package org.spring2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnAController {
	@RequestMapping(value = "/qna/list", method = RequestMethod.GET)
	public void QnA() {
	}
	
	@RequestMapping(value = "/qna/list", method = RequestMethod.POST)
	public void QnA(String title,String content) {
		System.out.println(title);
		System.out.println(content);
	}
	
	@RequestMapping(value = "/qna/write", method = RequestMethod.POST)
	public void Write() {
	}
	
	@RequestMapping(value = "/qna/content", method = RequestMethod.GET)
	public void Content() {
	}
}
