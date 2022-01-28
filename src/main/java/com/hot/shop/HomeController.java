package com.hot.shop;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hot.shop.admin.model.service.AdminService;

@Controller
public class HomeController {
	
	@Autowired
	private AdminService aService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		aService.countInput();
		return "index";
	}
	
}
