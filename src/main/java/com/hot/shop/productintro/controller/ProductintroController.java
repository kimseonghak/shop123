package com.hot.shop.productintro.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

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

import com.hot.shop.member.model.vo.Member;
import com.hot.shop.productintro.model.Service.ProductintroService;
import com.hot.shop.productintro.model.vo.LocalProductBoard;
import com.hot.shop.productintro.model.vo.LocalProductFile;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class ProductintroController {
	
	@Autowired
	private ProductintroService piService;
	
	@Autowired
	private ServletContext context;

	//메인에서 제철 특산물 버튼을 누르면 이동하는 메소드
	@RequestMapping(value="/productintro/SeasonProductListPage.do", method= RequestMethod.GET)
	public ModelAndView SeasonList(ModelAndView mav) {
		
		mav.setViewName("productintro/SeasonProductList");
		return mav;
	}
	
	//제철 특산물 리스트 작성
	
	
	
	//지역 특산물 리스트 조회
	
	
	//지역 특산물 리스트 수정
	
	//지역 특산물 리스트 삭제
	
	
	
	//------------------------------------------------------------------------------------------
	//지역특산물 리스트
	@RequestMapping(value = "/productintro/LocalProductListPage.do",method = RequestMethod.GET)
	public ModelAndView LocalProductListPage(ModelAndView mav,
											@RequestParam(required = false, defaultValue = "1") int currentPage) {
		
		//페이징 처리
		HashMap<String, Object> map = piService.LocalProductListPage(currentPage);
		mav.addObject("list", map.get("list"));
		mav.addObject("pageNavi", map.get("pageNavi"));
		mav.setViewName("productintro/LocalProductList");
		return mav;
	}
	
	
	//지역특산물 글쓰기 페이지
	@RequestMapping(value = "/productintro/LocalProductWritePage.do",method = RequestMethod.GET)
	public String LocalProductWritePage() {
		return "productintro/LocalProductWrite";
	}
	
	//지역특산물 글쓰기 백단 구현
	@RequestMapping(value = "/local/localWrite.do",method = RequestMethod.POST)
	public ModelAndView localWrite(LocalProductBoard localBoard,ModelAndView mav) {
		int result = piService.localWrite(localBoard);
		
		if(result > 0) {
			mav.addObject("msg", "글 작성에 성공했습니다." );
			mav.addObject("location", "/productintro/LocalProductWritePage.do");
		}else {
			mav.addObject("msg", "글 작성에 실패했습니다." );
			mav.addObject("location", "/productintro/LocalProductWritePage.do");
		}
		mav.setViewName("commons/msg");
		return mav;
	}
	
	//지역특산물 이미지 올리기
	@RequestMapping(value = "/local/localPhotoAjax.do",method = RequestMethod.POST)
	@ResponseBody
	public int localPhotoAjax(HttpServletRequest request, HttpServletResponse response)throws IOException {
		
	String uploadPath = "/resources/localProductPhoto/img/";
			
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
			String filePath = "/resources/localProductPhoto/img/"+changedFileName;
			
			long fileSize = reNameFile.length();
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
			Timestamp uploadTime = Timestamp.valueOf(formatter.format(currentTime));
			
			LocalProductFile localPhoto = new LocalProductFile();
			localPhoto.setLocalProductPhotoOriginal(originalFileName);
			localPhoto.setLocalProductPhotoChange(changedFileName);
			localPhoto.setLocalProductPhotoFilePath(filePath);
			localPhoto.setLocalProductPhotoFileSize(fileSize);
			localPhoto.setLocalProductPhotoUpdateTime(uploadTime);
			
			int result= piService.localPhotoAjax(localPhoto);
			return localPhoto.getLocalProductPhotoNo();
		}
	
	
	//지역 특산물 글조회
	@RequestMapping(value = "/productintro/LocalProductView.do",method = RequestMethod.GET)
	public ModelAndView LocalProductView(@RequestParam int localProductNo,ModelAndView mav) {
		LocalProductBoard localBoard = piService.LocalProductView(localProductNo);
		
		mav.addObject("localBoard", localBoard);
		mav.setViewName("productintro/LocalProductView");
		return mav;
	}
	
	//버튼 클릭시 지역별로 나오도록 이동
	@RequestMapping(value = "/productintro/productintroLocalBtn.do",method = RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request,ModelAndView mav) {
		String localProductClassify = request.getParameter("localProductClassify");

		ArrayList<LocalProductBoard> list = piService.productintroLocalBtn(localProductClassify);
		
		mav.addObject("list", list);
		mav.setViewName("productintro/LocalProductList");
		return mav;
	}
}
