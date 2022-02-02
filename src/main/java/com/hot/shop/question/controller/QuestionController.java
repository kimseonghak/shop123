package com.hot.shop.question.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.question.model.service.QuestionService;
import com.hot.shop.question.model.vo.QuestionUser;



@Controller
public class QuestionController {

	@Autowired
	private QuestionService qService;
	
	//헤더에서 1:1문의 버튼을 누르면 문의 리스트로 이동하는 메소드(유저 문의)	
	@RequestMapping(value = "/question/questionUserList.do",method = RequestMethod.GET)
	public ModelAndView test(ModelAndView mav) {
	       ArrayList<QuestionUser> list = qService.selectUserQuestionList();
	       mav.addObject("list", list);
	       mav.setViewName("question/QuestionList");
	       return mav;
	}

	//리스트 페이지에서 글 쓰기 버튼을 누르면 글 작성 페이지로 이동하는 메소드 (유저 문의)
	@RequestMapping(value="/question/questionWritePage.do", method=RequestMethod.GET)
	public String QuestionUserWritePage() {
		return "question/QuestionUserWrite";
	}
	
	@RequestMapping(value="/question/questionWrite.do", method=RequestMethod.POST)
	public void QuestionUserWrite(QuestionUser qUser) {
		
		System.out.println(qUser);
		//내일 해야할 일: 위의 Sysout 문을 돌리면, 아무 데이터도 입력되지 않는다, 그래서 이 값에 각각 데이터를 넣어줄 방법을 찾아야 함
		//내일 오자마자, header에서 246번 줄에 /question/questionUserList.do" 넣어주고 다시 로직 짜기 시작하기
		
	}
	
	
	
}
