package com.hot.shop.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.notice.model.service.NoticeService;
import com.hot.shop.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	//공지사항 리스트 페이지
	@RequestMapping(value = "/notice/noticeListPage.do",method = RequestMethod.GET)
	public ModelAndView noticeListPage(ModelAndView mav,
			@SessionAttribute(required = false) Member member,
			@RequestParam(required = false,defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam(required = false, defaultValue = "default") String type,
			@SessionAttribute(required = false) Farm farm) 
	
	{
		
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("farm", farm);
			map.put("currentPage", currentPage);
			map.put("keyword", keyword);
			map.put("type", type);
			HashMap<String, Object> returnMap = nService.selectNoticeList(map);
			returnMap.put("keyword", keyword);
			returnMap.put("type", type);
			mav.addObject("map",returnMap);
			mav.addObject("currentPage",currentPage);
			mav.setViewName("notice/NoticeList");
			return mav;
		
		
	}
	
	//공지사항 글쓰기 페이지
	@RequestMapping(value = "/notice/noticeWritePage.do",method = RequestMethod.GET)
	public String noticeWritePage(@SessionAttribute Farm farm) {
		return "notice/NoticeWrite";
	}
	
	//공지사항 글쓰기
	@RequestMapping(value = "/notice/noticeWrite.do",method = RequestMethod.POST)
	public ModelAndView noticeWrite(Notice n,ModelAndView mav,@SessionAttribute Farm farm) {
		
		int result = nService.insertWrite(n);
		
		if(result > 0) {
			mav.addObject("location", "/notice/noticeListPage.do");
		}else {
			mav.addObject("location", "/notice/noticeWritePage.do");
		}
		mav.setViewName("commons/msg");
		return mav;
	}
	
	
	//공지사항 조회(뷰) 페이지
	@RequestMapping(value = "/notice/NoticeView.do",method = RequestMethod.GET)
	public ModelAndView NoticeViewPage(@RequestParam int noticeNo,
					@RequestParam(required = false, defaultValue = "1") int currentPage,
					@RequestParam(required = false, defaultValue = "") String keyword,
					@RequestParam(required = false, defaultValue = "default") String type,
					@SessionAttribute(required = false) Member member,
					@SessionAttribute(required = false) Farm farm,
					ModelAndView mav) 
	{
		HashMap<String, Object> map = nService.NoticeViewPage(noticeNo);
		
		mav.addObject("currentPage",currentPage);
		mav.addObject("type",type);
		mav.addObject("keyword",keyword);
		mav.addObject("map", map);
		mav.setViewName("notice/NoticeView");
		return mav;
	}
	
	//공지사항 수정 페이지로 이동
	@RequestMapping(value="/notice/noticeUpdatePage.do", method = RequestMethod.GET)
	public ModelAndView NoticeUpdatePage(ModelAndView mav, @RequestParam int noticeNo, @SessionAttribute Farm farm) {			
		
		HashMap<String, Object> map = nService.NoticeViewPage(noticeNo);
		mav.addObject("map", map);
		mav.setViewName("notice/NoticeUpdate");
		return mav;
	};
	
	//공지사항 수정
	@RequestMapping(value="/notice/noticeUpdate.do", method = RequestMethod.POST)
	public ModelAndView NoticeUpdate(Notice n, ModelAndView mav, @SessionAttribute Farm farm) {
		
		int result = nService.updateWrite(n);
		System.out.println(n);
		
		if(result > 0) {
			mav.addObject("location", "/notice/noticeListPage.do");
		}else {
			mav.addObject("location", "/notice/noticeUpdatePage.do");
		}
		mav.setViewName("commons/msg");
		return mav;
	};
	
	
	
	//공지사항 삭제
	@RequestMapping(value="/notice/noticeDelete.do", method = RequestMethod.POST)
	public ModelAndView NoticeDelete(HttpServletRequest request, ModelAndView mav) {
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		int result = nService.noticeDelete(noticeNo);
		
		if(result > 0) {
			mav.addObject("msg", "글 삭제에 성공했습니다." );
			mav.addObject("location", "/notice/noticeListPage.do");
		}else {
			mav.addObject("msg", "글 삭제에 실패했습니다." );
			mav.addObject("location", "/notice/noticeView.do");
		}
		mav.setViewName("commons/msg");
		return mav;

	}
}
