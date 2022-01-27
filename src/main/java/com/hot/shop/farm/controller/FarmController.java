package com.hot.shop.farm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hot.shop.farm.model.service.FarmService;

@Controller
public class FarmController {
	@Autowired
	private FarmService fService;

	@RequestMapping(value="/farm/farmJoinPage.do")
	public String farmJoinPage() {
		return "farm/farmJoin";
	}
}
