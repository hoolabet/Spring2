package org.spring2.controller;

import org.spring2.model.MadeVO;
import org.spring2.service.MadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MadeController {
	@Autowired
	MadeService ms;
	
	@RequestMapping(value = "/made/chooseForMade", method = RequestMethod.GET)
	public void made() {
	}
	
	@RequestMapping(value = "/made/chooseForMade", method = RequestMethod.POST)
	public String madePOST(MadeVO mvo) {
		ms.madeOrder(mvo);
		return "/cart/list";
	}
}
