package com.hot.shop.question.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.question.model.service.QuestionService;
import com.hot.shop.question.model.vo.QuestionAnswer;
import com.hot.shop.question.model.vo.QuestionFarm;
import com.hot.shop.question.model.vo.QuestionPhoto;
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
	public ModelAndView test(ModelAndView mav, 
			@SessionAttribute(required = false) Member member,
			@RequestParam(required = false,defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam(required = false, defaultValue = "default") String type,
			@SessionAttribute(required = false) Farm farm) {
		
		if(member==null&&farm==null) {
			mav.setViewName("member/login");
			return mav;
		}
		if(member!=null) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member", member);
			map.put("currentPage", currentPage);
			map.put("keyword", keyword);
			map.put("type", type);
			HashMap<String, Object> returnMap = qService.selectUserQuestionList(map);
			returnMap.put("keyword", keyword);
			returnMap.put("type", type);
			mav.addObject("map",returnMap);
			mav.addObject("currentPage",currentPage);
			mav.setViewName("question/QuestionList");
		    return mav;
		}else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("farm", farm);
			map.put("currentPage", currentPage);
			map.put("keyword", keyword);
			map.put("type", type);
			HashMap<String, Object> returnMap = qService.selectUserQuestionList(map);
			returnMap.put("keyword", keyword);
			returnMap.put("type", type);
			mav.addObject("map",returnMap);
			mav.addObject("currentPage",currentPage);
			mav.setViewName("question/QuestionList");
			return mav;
		}
	}

	//리스트 페이지에서 글 쓰기 버튼을 누르면 글 작성 페이지로 이동하는 메소드 (유저 문의)
	@RequestMapping(value="/question/questionWritePage.do", method=RequestMethod.GET)
	public String QuestionUserWritePage() {
		return "question/QuestionUserWrite";
	}
	
	//QuestionUserWrite 작성 전 파일 업로드
	@RequestMapping(value="/question/questionWriteFileUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public int QuestionUserWriteFileUpload(HttpServletRequest request, HttpServletResponse response)throws IOException {
		
		String uploadPath = "/resources/questionphoto/img/";
		
		String uploadFilePath = context.getRealPath(uploadPath);
		
		int uploadFileSizeLimit = 50*1024*1024;

		String encType="UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, 
				uploadFilePath, 
				uploadFileSizeLimit, 
				encType, 
				new DefaultFileRenamePolicy());
		
		String originalFileName = multi.getFilesystemName("file");
		
		long currentTime = Calendar.getInstance().getTimeInMillis();
		
		File file = new File(uploadFilePath+"\\"+originalFileName); 
		file.renameTo(new File(uploadFilePath+"\\"+currentTime+".jpg")); //파일 이름을 마사지하는 작업
		
		String changedFileName = currentTime+".jpg";
		
		File reNameFile = new File(uploadFilePath+"\\"+changedFileName);
		String filePath = "/resources/questionphoto/img/"+changedFileName;
		
		long fileSize = reNameFile.length();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		Timestamp uploadTime = Timestamp.valueOf(formatter.format(currentTime));
		
		QuestionPhoto qp = new QuestionPhoto();
		qp.setQuestionPhotoOriginal(originalFileName);
		qp.setQuestionPhotoChange(changedFileName);
		qp.setQuestionPhotoFilePath(filePath);
		qp.setQuestionPhotoFileSize(fileSize);
		qp.setQuestionPhotoUpdateTime(uploadTime);
		
		int result = qService.insertWriteFile(qp);
		return qp.getQuestionPhotoNo();
	};
	
	//미리 올려둔 파일과 같이 글을 작성하는 메소드(유저문의)
	@RequestMapping(value="/question/questionWrite.do", method=RequestMethod.POST)
	public ModelAndView QuestionUserWrite(QuestionUser qUser, ModelAndView mav,@SessionAttribute Member member) {
		int userNo = member.getUserNo();
		qUser.setUserNo(userNo);
		
		boolean check = false;
		int result = qService.insertUserWrite(qUser);
		if(qUser.getQuestionUserCode().equals("Q-2")&&qUser.getQuestionphotoNo()==1&&result>0) {
			check=true;
		}else if(qUser.getQuestionUserCode().equals("Q-2")&&qUser.getQuestionphotoNo()!=1&&result>1) {
			check=true;
		}else if(qUser.getQuestionUserCode().equals("Q-1")&&qUser.getQuestionphotoNo()==1&&result>1) {
			check=true;
		}else if(qUser.getQuestionUserCode().equals("Q-1")&&qUser.getQuestionphotoNo()!=1&&result>2) {
			check=true;
		}
		if(check) {
			mav.addObject("msg", "글 작성에 성공했습니다." );
			mav.addObject("location", "/question/QuestionUserPage.do");
		}else {
			mav.addObject("msg", "글 작성에 실패했습니다." );
			mav.addObject("location", "/question/QuestionUserPage.do");
		}
		
		mav.setViewName("commons/msg");
		return mav;
	}
	
	
	//1:1문의(사용자) 게시판 조회
	@RequestMapping(value = "/question/questionViewPage.do",method = RequestMethod.GET)
	public ModelAndView questionView(@RequestParam int questionUserNo,
			@RequestParam(required = false,defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam(required = false, defaultValue = "default") String type,
			@SessionAttribute(required = false) Member member,
			@SessionAttribute(required = false) Farm farm,
			ModelAndView mav) {
		HashMap<String, Object> map = qService.questionView(questionUserNo);
		
		if(member!=null) {
			if(member.getUserNo()!=((QuestionUser)map.get("qUser")).getUserNo()) {
				mav.setViewName("commons/error");
				return mav;
			}
		}else if(farm != null) {
			if(farm.getFarmNo()!=((QuestionUser)map.get("qUser")).getFarmNo()) {
				mav.setViewName("commons/error");
				return mav;
			}
		}else if(member==null && farm==null) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		mav.addObject("currentPage",currentPage);
		mav.addObject("type",type);
		mav.addObject("keyword",keyword);
		mav.addObject("map", map);
		mav.setViewName("question/QuestionView");
		return mav;
	}
	
	
	//1:1 문의 글수정 최초 페이지
		@RequestMapping(value="/question/questionUserUpdatePage.do", method=RequestMethod.GET)
		public ModelAndView QuestionUserUpdatePage(ModelAndView mav,
				@RequestParam int questionUserNo) {
			HashMap<String, Object> map = qService.questionView(questionUserNo);
			mav.addObject("map", map);
			mav.setViewName("question/QuestionUserUpdate2");
			return mav;
	}
		
	//1:1 문의 수정 로직
		@RequestMapping(value = "/question/questionUserUpdate.do",method = RequestMethod.GET)
		public ModelAndView questionUserUpdate(QuestionUser qUser,ModelAndView mav) {
			if(qUser.getQuestionphotoNo()==1) {
				qUser.setQuestionphotoNo(qUser.getOriginalQuestionphotoNo());
			}else if(qUser.getQuestionphotoNo()!=1 && qUser.getOriginalQuestionphotoNo()!=1) {
				QuestionPhoto qPhoto = qService.deleteFileCheck(qUser.getOriginalQuestionphotoNo());
				String path = context.getRealPath("/resources/questionphoto/img/");
				String filePath = path+qPhoto.getQuestionPhotoFilePath().toString().substring(29);
				
				File file = new File(filePath);
				file.delete();
			}
			
			int result = qService.questionUserUpdate(qUser);
			if(result>1) {
				mav.addObject("msg", "글이 수정되었습니다.." );
				mav.addObject("location", "/question/questionViewPage.do?questionUserNo="+qUser.getQuestionUserNo());
			}else {
				mav.addObject("msg", "글 작성에 실패했습니다." );
				mav.addObject("location", "/question/QuestionUserPage.do");
			}
			mav.setViewName("commons/msg");
			
			return mav;
		}
		// 구매목록리스트 불러오기
		@RequestMapping(value = "/question/buyListCheck.do",method = RequestMethod.GET)
		public ModelAndView buyListCheck(ModelAndView mav,
				@RequestParam(required = false,defaultValue = "1") int currentPage,
				@SessionAttribute Member member) {
			HashMap<String, Object> map = qService.buyListCheck(currentPage,member);
			mav.addObject("map",map);
			mav.addObject("currentPage",currentPage);
			mav.setViewName("question/QuestionUserListCheck");
			return mav;
		}
		
		@RequestMapping(value = "/question/questionUserDelete.do", method = RequestMethod.GET)
		public ModelAndView questionUserDelete(ModelAndView mav,
				@RequestParam int questionUserNo,
				@RequestParam String questionUserCode) {
			int result = qService.questionUserDelete(questionUserNo,questionUserCode);
			if(result>0) {
				mav.addObject("msg", "글이 삭제되었습니다." );
				mav.addObject("location", "/question/QuestionUserPage.do");
			}else {
				mav.addObject("msg", "오류가 발생했습니다." );
				mav.addObject("location", "/question/QuestionUserPage.do");
			}
			mav.setViewName("commons/msg");
			return mav;
		}
		
		@RequestMapping(value = "/qustionUser/questionAnswer.do", method = RequestMethod.POST)
		public ModelAndView questionAnswer(ModelAndView mav,QuestionAnswer qAnswer,
				@RequestParam(required = false,defaultValue = "1") int currentPage,
				@RequestParam(required = false, defaultValue = "") String keyword,
				@RequestParam(required = false, defaultValue = "default") String type) {
			boolean result = qService.questionAnswer(qAnswer);
			int questionUserNo = qAnswer.getQuestionBoardNo();
			if(result) {
				mav.addObject("msg", "답변이 등록되었습니다." );
				mav.addObject("location", "/question/questionViewPage.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword);
			}else {
				mav.addObject("msg", "오류가 발생하였습니다.." );
				mav.addObject("location", "/question/questionViewPage.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword+"&questionUserNo="+questionUserNo);
			}
			mav.setViewName("commons/msg");
			return mav;
		}
		
		//-----------------------------------------농가 문의-----------------------------------------
		
		//헤더에서 1:1문의 버튼을 누르면 문의 리스트로 이동하는 메소드(유저 문의)	
		@RequestMapping(value = "/question/QuestionFarmPage.do",method = RequestMethod.GET)
		public ModelAndView QuestionFarmPage(ModelAndView mav) {
		       ArrayList<QuestionFarm> list = qService.QuestionFarmPage();
		       mav.addObject("list", list);
		       mav.setViewName("question/QuestionFarmList");
		       return mav;
		}
}
