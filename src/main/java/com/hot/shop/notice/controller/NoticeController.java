package com.hot.shop.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.member.model.vo.Member;
import com.hot.shop.notice.model.service.NoticeService;
import com.hot.shop.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	//공지사항 리스트 페이지
	@RequestMapping(value = "/notice/noticeList.do",method = RequestMethod.GET)
	public ModelAndView noticeListPage(ModelAndView mav,@SessionAttribute Member member) {
		ArrayList<Notice> list = nService.noticeList();
		mav.addObject("list", list);
		mav.setViewName("notice/NoticeList");
		return mav;
	}
	
	//공지사항 글쓰기 페이지
	@RequestMapping(value = "/notice/noticeWritePage.do",method = RequestMethod.GET)
	public String noticeWritePage(@SessionAttribute Member member) {
		return "notice/NoticeWrite";
	}
	
	//공지사항 글쓰기
	@RequestMapping(value = "/notice/noticeWrite.do",method = RequestMethod.POST)
	public ModelAndView noticeWrite(Notice n,ModelAndView mav,@SessionAttribute Member member) {
		
		int result = nService.insertWrite(n);
		
		if(result > 0) {
			mav.addObject("location", "/notice/noticeList.do");
		}else {
			mav.addObject("location", "/notice/noticeWritePage.do");
		}
		mav.setViewName("commons/msg");
		return mav;
	}
	
	
	//공지사항 죄회(뷰) 페이지
	@RequestMapping(value = "/notice/NoticeView.do",method = RequestMethod.GET)
	public ModelAndView NoticeViewPage(ModelAndView mav,@SessionAttribute Member member) {
		ArrayList<Notice> list = nService.NoticeViewPage();
		mav.addObject("list", list);
		mav.setViewName("notice/NoticeView");
		return mav;
	}
	
}
