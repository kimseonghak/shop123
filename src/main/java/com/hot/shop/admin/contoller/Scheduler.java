package com.hot.shop.admin.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hot.shop.admin.model.service.AdminService;

@Component
public class Scheduler {
	
	@Autowired
	private AdminService aService;
	
	@Scheduled(cron = "0 05 00 * * *")
	public void BIDScheduler() {
		System.out.println("BID 예약 작업 실행");
		aService.BIDScheduler();
	}
	
}
