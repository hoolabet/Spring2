package org.spring2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MadeController {
	@RequestMapping(value = "/made/list", method = RequestMethod.GET)
	public void made() {
	}
	
	@RequestMapping(value = "/made/list", method = RequestMethod.POST)
	public void madePOST(String choose_1, String choose_2, String choose_3) {
		System.out.println(choose_1);
		System.out.println(choose_2);
		System.out.println(choose_3);
	}
}
