package org.spring2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CartController {
	@RequestMapping(value = "/cart/list", method = RequestMethod.GET)
	public void Cart() {
	}
	@RequestMapping(value = "/cart/payment", method = RequestMethod.GET)
	public void payment() {
	}
}
