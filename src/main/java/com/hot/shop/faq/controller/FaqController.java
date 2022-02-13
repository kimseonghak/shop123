package com.hot.shop.faq.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.faq.model.service.FaqService;
import com.hot.shop.faq.model.vo.FAQ;


@Controller
public class FaqController {

	@Autowired	
	private FaqService faqService;
	
	//자주 묻는 질문 게시물 리스트
	@RequestMapping(value="/faq/faqListPage.do")
	public ModelAndView faqListPage(ModelAndView mv)
	{
		ArrayList<FAQ> list = faqService.selectFAQList();
		
		mv.addObject("list", list);
		mv.setViewName("/faq/FAQlist");
		
		return mv;
	}
	
	// 게시물 삭제
	@ResponseBody
	@RequestMapping(value="/faq/faqBoardDelete.do",method = RequestMethod.GET,produces = "application/text; charset=UTF-8")
	public String faqBoardDelete(@RequestParam int boardNo,HttpServletResponse response)
	{
		int result = faqService.deleteFaqBoard(boardNo);
		
		if(result>0)
		{
			return "삭제 완료하였습니다.";
		}else
		{
			return "삭제 완료하지 못하였습니다.";
		}
	}
	
	//게시물 등록 페이지 이동
	@RequestMapping(value="/faq/faqWritePage.do",method = RequestMethod.GET)
	public String faqWritePage()
	{
		return "faq/FAQwrite";
	}
	
	//게시물 등록
	@RequestMapping(value="/fqa/fqaBoardWrite.do",method = RequestMethod.GET)
	public ModelAndView faqWrite(@RequestParam String type,@RequestParam String faqTitle,@RequestParam String faqContent,ModelAndView mv)
	{
		HashMap<String, String>	dataMap = new HashMap<String, String>();
		dataMap.put("type", type);
		dataMap.put("faqTitle", faqTitle);
		dataMap.put("faqContent", faqContent);
		
		int result = faqService.insertfaqBoard(dataMap);
			
		if(result>0)
		{
			mv.addObject("msg", "등록이 완료되었습니다.");
		}else
		{
			mv.addObject("msg", "등록 실패하였습니다.");
		}
			mv.addObject("location", "/faq/faqListPage.do"); 
			mv.setViewName("/commons/msg");
			
			return mv;
	}
	
	//게시물 수정 페이지
	@RequestMapping(value="/faq/faqUpdatePage.do",method = RequestMethod.GET)
	public ModelAndView faqUpdatePage(@RequestParam int boardNo,ModelAndView mv)
	{
		//수정할 게시물 가져오기	
		ArrayList<FAQ> list = faqService.selectFaqOneBoard(boardNo);
		
		mv.addObject("list", list);
		mv.setViewName("/faq/FAQupdate");
		return mv;
	}
	
	//게시물 수정 
	@RequestMapping(value="/fqa/fqaBoardUpdate.do",method = RequestMethod.POST)
	public ModelAndView faqUpdate(@RequestParam int boardNo,@RequestParam String type,@RequestParam String faqTitle,
									@RequestParam String faqContent,ModelAndView mv)
	{
		HashMap<String, Object>	dataMap = new HashMap<String, Object>();
		dataMap.put("boardNo",boardNo);
		dataMap.put("type", type);
		dataMap.put("faqTitle", faqTitle);
		dataMap.put("faqContent", faqContent);

		int result = 	faqService.updateFaqBoard(dataMap);
		
		if(result>0)
		{
			mv.addObject("msg", "수정 완료되었습니다.");
		}else
		{
			mv.addObject("msg", "수정 실패하였습니다.");
		}
			mv.setViewName("/farm/farmMsg");
			
			return mv;
	}
	
	
	
}
