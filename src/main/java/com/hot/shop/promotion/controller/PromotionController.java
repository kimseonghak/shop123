package com.hot.shop.promotion.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.promotion.model.service.PromotionService;
import com.hot.shop.promotion.model.vo.Promotion;
import com.hot.shop.promotion.model.vo.PromotionPhoto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class PromotionController {
	
	@Autowired
	private PromotionService pService;
	
	@Autowired
	private ServletContext context;

	//헤더에서 홍보 게시판을 누르면 이동하는 메소드(페이징 처리, 검색 기능까지 구현)
	@RequestMapping(value="/promotion/promotionListPage.do", method= RequestMethod.GET)
	public ModelAndView PromotionListPage(ModelAndView mav,
			@SessionAttribute(required = false) Member member,
			@RequestParam(required = false,defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam(required = false, defaultValue = "default") String type,
			@SessionAttribute(required = false) Farm farm) 
	{	
		if(member==null&&farm==null) {
			mav.setViewName("member/login");
			return mav;
		}else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("farm", farm);
			map.put("currentPage", currentPage);
			map.put("keyword", keyword);
			map.put("type", type);
			HashMap<String, Object> returnMap = pService.selectPromotionList(map);
			returnMap.put("keyword", keyword);
			returnMap.put("type", type);
			mav.addObject("map",returnMap);
			mav.addObject("currentPage",currentPage);
			mav.setViewName("promotion/PromotionList");
			return mav;
		}
		
	}
	
	//글 작성 페이지로 이동
	@RequestMapping(value="/promotion/promotionWritePage.do", method=RequestMethod.GET)
	public String PromotionWritePage() {
		return "promotion/PromotionWrite";
	}
	
	//글 쓰기 전 파일 업로드 로직(AJAX)
	@RequestMapping(value="/promotion/promotionWriteFileUpload.do")
	@ResponseBody
	public int PromotionWriteFileUpload(HttpServletRequest request, HttpServletResponse response)throws IOException {
		
		String uploadPath = "/resources/promotionphoto/img/";
		
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
		file.renameTo(new File(uploadFilePath+"\\"+currentTime+".jpg")); 
		
		String changedFileName = currentTime+".jpg";
		
		File reNameFile = new File(uploadFilePath+"\\"+changedFileName);
		String filePath = "/resources/promotionphoto/img/"+changedFileName;
		
		long fileSize = reNameFile.length();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		Timestamp uploadTime = Timestamp.valueOf(formatter.format(currentTime));
		
		PromotionPhoto pp = new PromotionPhoto();
		pp.setPromotionPhotoOriginal(originalFileName);
		pp.setPromotionPhotoChange(changedFileName);
		pp.setPromotionPhotoFilePath(filePath);
		pp.setPromotionPhotoFileSize(fileSize);
		pp.setPromotionPhotoUpdateTime(uploadTime);
		
		int result = pService.insertWriteFile(pp);
		
		return pp.getPromotionPhotoNo();
	};
	
	//미리 올려둔 파일과 같이 글을 작성하는 메소드
	@RequestMapping(value="/promotion/promotionWrite.do", method=RequestMethod.POST)
	public ModelAndView PromotionWrite(Promotion promotion, ModelAndView mav, @SessionAttribute Farm farm) {
		
		int farmNo = farm.getFarmNo();
		promotion.setFarmNo(farmNo);
		
		boolean check = false;
		int result = pService.insertWrite(promotion);
		
		if(promotion.getPromotionPhotoNo()==1&&result>0) {
			check=true;
		}else if(promotion.getPromotionPhotoNo()!=1&&result>1) {
			check=true;
		}
		
		if(check) {
			mav.addObject("msg", "글 작성에 성공했습니다." );
			mav.addObject("location", "/promotion/promotionListPage.do");
		}else {
			mav.addObject("msg", "글 작성에 실패했습니다." );
			mav.addObject("location", "/promotion/promotionListPage.do");
		}
		
		mav.setViewName("commons/msg");
		
		return mav;
	}
	
	//홍보 게시판 조회(조회수까지 완성)
	@RequestMapping(value = "/promotion/promotionViewPage.do", method = RequestMethod.GET)
	public ModelAndView promotionView(@RequestParam int promotionNo, 
					@RequestParam(required = false, defaultValue = "1") int currentPage,
					@RequestParam(required = false, defaultValue = "") String keyword,
					@RequestParam(required = false, defaultValue = "default") String type,
					@SessionAttribute(required = false) Member member,
					@SessionAttribute(required = false) Farm farm,
					ModelAndView mav)
	{
		HashMap<String, Object> map = pService.promotionView(promotionNo);
		
		System.out.println(map);
		
		mav.addObject("currentPage",currentPage);
		mav.addObject("type",type);
		mav.addObject("keyword",keyword);
		mav.addObject("map", map);
		mav.setViewName("promotion/PromotionView");
		return mav;
	}
}
