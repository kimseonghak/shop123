package com.hot.shop.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.question.model.service.QuestionService;
import com.hot.shop.question.model.vo.QuestionUser;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@Controller
public class QuestionController {

	@Autowired
	private QuestionService qService;
	
	@Autowired
	private ServletContext context;
	
	//헤더에서 1:1문의 버튼을 누르면 문의 리스트로 이동하는 메소드(유저 문의)	
	@RequestMapping(value = "/question/QuestionUserPage.do",method = RequestMethod.GET)
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
	
	//QuestionUserWrite 작성 전 파일 업로드
	@RequestMapping(value="/question/questionWriteFileUpload.do", method=RequestMethod.POST)
	public String QuestionUserWriteFileUpload(HttpServletRequest request, HttpServletResponse response)throws IOException {
		
		String uploadPath = "/resources/questionphoto/img/";
		
		String uploadFilePath = context.getRealPath(uploadPath);
		
		int uploadFileSizeLimit = 50*1024*1024;
		
		String encType="UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, 
				uploadFilePath, 
				uploadFileSizeLimit, 
				encType, 
				new DefaultFileRenamePolicy());
		
		
		
		return null;
	};
	
	
	@RequestMapping(value="/question/questionWrite.do", method=RequestMethod.POST)
	public void QuestionUserWrite(QuestionUser qUser, ModelAndView mav) {
		
		int result = qService.insertUserWrite(qUser);
		
		
	}
	
	
	
}
