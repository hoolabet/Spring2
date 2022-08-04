package org.spring2.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public void Board() {
	}
	@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
	public void BoardDetail() {
	}
	@RequestMapping(value = "/board/review", method = RequestMethod.GET)
	public void BoardReview() {
	}
}
