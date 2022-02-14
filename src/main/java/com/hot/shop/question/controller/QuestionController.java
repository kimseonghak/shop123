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
			if(farm.getFarmNo()!=((QuestionUser)map.get("qUser")).getFarmNo() && !(farm.getRating().equals("root")||farm.getRating().equals("admin"))) {
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
		@RequestMapping(value = "/question/buyListCheckPage.do",method = RequestMethod.GET)
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
				@RequestParam(required = false, defaultValue = "default") String type,
				@RequestParam String questionWriter) {
			
			boolean result = qService.questionAnswer(qAnswer);
			
			int questionBoadNo = qAnswer.getQuestionBoardNo();
			switch(questionWriter) {
			case "MU":
				if(result) {
					mav.addObject("msg", "답변이 등록되었습니다." );
					mav.addObject("location", "/question/questionViewPage.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword+"&questionUserNo="+questionBoadNo);
				}else {
					mav.addObject("msg", "오류가 발생하였습니다.." );
					mav.addObject("location", "/question/questionViewPage.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword+"&questionUserNo="+questionBoadNo);
				}
				break;
			case "MF":
				if(result) {
					mav.addObject("msg", "답변이 등록되었습니다." );
					mav.addObject("location", "/question/questionFarmViewPage.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword+"&questionFarmNo="+questionBoadNo);
				}else {
					mav.addObject("msg", "오류가 발생하였습니다.." );
					mav.addObject("location", "/question/questionFarmViewPage.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword+"&questionFarmNo="+questionBoadNo);
				}
				break;
			case "AU":
				if(result) {
					mav.addObject("msg", "답변이 등록되었습니다." );
					mav.addObject("location", "/admin/adminUserQNAContent.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword+"&questionUserNo="+questionBoadNo);
				}else {
					mav.addObject("msg", "오류가 발생하였습니다.." );
					mav.addObject("location", "/admin/adminUserQNAContent.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword+"&questionUserNo="+questionBoadNo);
				}
				break;
			case "AF":
				if(result) {
					mav.addObject("msg", "답변이 등록되었습니다." );
					mav.addObject("location", "/admin/adminFarmQNAContent.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword+"&questionFarmNo="+questionBoadNo);
				}else {
					mav.addObject("msg", "오류가 발생하였습니다.." );
					mav.addObject("location", "/admin/adminFarmQNAContent.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword+"&questionFarmNo="+questionBoadNo);
				}
				break;
			}
		
			mav.setViewName("commons/msg");
			return mav;
		}
		
		@RequestMapping(value = "/question/farmCheckPage.do",method = RequestMethod.GET)
		public String farmCheckPage() {
			
			return "question/QuestionUserListFarmCheck";
		}
		@RequestMapping(value = "/question/farmCheck.do",method = RequestMethod.GET)
		@ResponseBody
		public ArrayList<Farm> farmCheck(@RequestParam(required = false, defaultValue = "") String farmName) {
			ArrayList<Farm> farm = qService.farmCheck(farmName);
			return farm;
		}
		
		//-----------------------------------------농가 문의-----------------------------------------
		
		//헤더에서 1:1문의 버튼을 누르면 문의 리스트로 이동하는 메소드(유저 문의)	
		@RequestMapping(value = "/question/QuestionFarmPage.do",method = RequestMethod.GET)
		public ModelAndView QuestionFarmPage(	ModelAndView mav,
												@RequestParam(required = false,defaultValue = "1") int currentPage,
												@RequestParam(required = false, defaultValue = "") String keyword,
												@RequestParam(required = false, defaultValue = "default") String type,
												@SessionAttribute(required = false) Farm farm) {
		    //농가가 로그인 안되어 있다면?
			if(farm == null) {
				mav.setViewName("member/login");
				return mav;
			}
				
			//농가유저 세션/검색기능/페이지처리 한 거 맵에 넝기
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("farm", farm);
				map.put("currentPage", currentPage);
				map.put("keyword", keyword);
				map.put("type", type);
				//위에 넣어준 헤쉬맵을 리턴해주는 작업
				HashMap<String,Object> returnMap = qService.selectFarmQuestionList(map);
				returnMap.put("keyword", keyword);
				returnMap.put("type", type);
				mav.addObject("map",returnMap);
				mav.addObject("currentPage",currentPage);
				mav.setViewName("question/QuestionFarmList");

				return mav;
		}
		
		//글 쓰기 공간
			@RequestMapping(value = "/question/questionFarmWritePage.do",method = RequestMethod.GET)
			public String questionFarmWritePage() {
				return "question/QuestionFarmWrite";
			}
			
			//글 쓰기 백단
			@RequestMapping(value = "/question/questionFarmWrite.do",method = RequestMethod.POST)
			public ModelAndView questionFarmWrite(	ModelAndView mav,
													QuestionFarm qfarm) {
				
				int result = qService.questionFarmWrite(qfarm);
				if(result > 0) {
					mav.addObject("msg", "글이 등록되었습니다." );
					mav.addObject("location","/question/QuestionFarmPage.do");
				}else {
					mav.addObject("msg", "글이 등록되지 않았습니다." );
					mav.addObject("location","/question/questionFarmWritePage.do");
				}
				
				mav.setViewName("commons/msg");
				return mav;
			}
		//글 쓰기 공간 끝
			
			
		//글 조회
		@RequestMapping(value = "/question/questionFarmViewPage.do",method = RequestMethod.GET)
		public ModelAndView questionFarmViewPage(	ModelAndView mav,
											@RequestParam(required = false,defaultValue = "1") int currentPage,
											@RequestParam(required = false, defaultValue = "") String keyword,
											@RequestParam(required = false, defaultValue = "default") String type,
											@SessionAttribute(required = false) Farm farm,
											@RequestParam int questionFarmNo) {
			//정보를 우선 해쉬맵에 넣어준다.
			HashMap<String, Object>map = qService.questionFarmView(questionFarmNo);
			
			mav.addObject("currentPage",currentPage);
			mav.addObject("type",type);
			mav.addObject("keyword",keyword);
			mav.addObject("map", map);
			
			mav.setViewName("question/QuestionFarmView");
			return mav;
		}
		
		//글 수정 공간
		@RequestMapping(value = "/question/questionFarmUpdatePage.do",method = RequestMethod.GET)
		public ModelAndView questionFarmUpdatePage(@RequestParam int  questionFarmNo,ModelAndView mav) {
			HashMap<String, Object>map = qService.questionFarmView(questionFarmNo);
			mav.addObject("map", map);
			mav.setViewName("question/QuestionFarmUpdate");
			return mav;
		}
		
		@RequestMapping(value = "/question/questionFarmUpdate.do",method = RequestMethod.POST)
		public ModelAndView questionFarmUpdate(QuestionFarm qfarm,ModelAndView mav) {
			int result = qService.questionFaemUpdate(qfarm);
			
			if(result > 0) {
				mav.addObject("msg", "글이 등록되었습니다." );
				mav.addObject("location", "/question/QuestionFarmPage.do");
			}else {
				mav.addObject("msg", "글이 등록되지 않았습니다." );
				mav.addObject("location", "/question/questionFarmUpdatePage.do");
			}
			
			mav.setViewName("commons/msg");
			return mav;
		}
		//글 수정 공간 끝
		
		//글 삭제
		@RequestMapping(value = "/question/questionFarmDelete.do",method = RequestMethod.GET)
		public ModelAndView questionFarmDelete(		ModelAndView mav,
													@RequestParam int questionFarmNo) {
			int result = qService.questionFarmDelete(questionFarmNo);
			
			if(result > 0) {
				mav.addObject("msg", "글이 삭제 되었습니다." );
				mav.addObject("location", "/question/QuestionFarmPage.do");
			}else {
				mav.addObject("msg", "글이 삭제 되지 않았습니다." );
				mav.addObject("location", "/question/QuestionFarmPage.do");
			}
			
			mav.setViewName("commons/msg");
			return mav;
		}
		
}
