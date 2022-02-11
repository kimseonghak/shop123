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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.productintro.model.Service.ProductintroService;
import com.hot.shop.productintro.model.vo.LocalProductBoard;
import com.hot.shop.productintro.model.vo.LocalProductFile;
import com.hot.shop.productintro.model.vo.SeasonProductBoard;
import com.hot.shop.productintro.model.vo.SeasonProductFile;
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
	public ModelAndView SeasonList(	ModelAndView mav,
									@RequestParam(required = false, defaultValue = "1") int currentPage
									) {
		
		
		//페이징 처리
		HashMap<String, Object> map = piService.SeasonProductListPage(currentPage);
		mav.addObject("list", map.get("list"));
		mav.addObject("pageNavi", map.get("pageNavi"));
		mav.setViewName("productintro/SeasonProductList");
		
		return mav;
	}
	//메인에서 제철 특산물 버튼을 누르면 이동하는 메소드 끝
	
	
	//제철 특산물 리스트 작성 페이지
	@RequestMapping(value = "/productintro/SeasonProductWritePage.do",method = RequestMethod.GET)
	public String SeasonProductWritePage(@SessionAttribute Member member,@SessionAttribute Farm farm) {
		return "productintro/SeasonProductWrite";
	}
	//파일 넣기
	@RequestMapping(value = "/local/SeasonPhotoAjax.do",method = RequestMethod.POST)
	@ResponseBody
	public int SeasonPhotoAjax(HttpServletRequest request, HttpServletResponse response)throws IOException {
		
	String uploadPath = "/resources/SeasonProductPhoto/img/";
			
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
			String filePath = "/resources/SeasonProductPhoto/img/"+changedFileName;
			
			long fileSize = reNameFile.length();
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
			Timestamp uploadTime = Timestamp.valueOf(formatter.format(currentTime));
			
			SeasonProductFile seasonPhoto = new SeasonProductFile();
			seasonPhoto.setSeasonProductPhotoOriginal(originalFileName);
			seasonPhoto.setSeasonProductPhotoChange(changedFileName);
			seasonPhoto.setSeasonProductPhotoFilePath(filePath);
			seasonPhoto.setSeasonProductPhotoFileSize(fileSize);
			seasonPhoto.setSeasonProductPhotoUpdateTime(uploadTime);
			
			int result= piService.SeasonPhotoAjax(seasonPhoto);
			return seasonPhoto.getSeasonProductPhotoNo();
		}
		//실질적 글쓰기
		@RequestMapping(value = "/season/SeasonWrite.do",method = RequestMethod.POST)
		public ModelAndView localWrite(SeasonProductBoard seasonBoard,ModelAndView mav,@SessionAttribute Farm farm) {
			int farmNo = farm.getFarmNo();
			int result = piService.SeasonWrite(seasonBoard);
			
			if(result > 0) {
				mav.addObject("msg", "글 작성에 성공했습니다." );
				mav.addObject("location", "/productintro/SeasonProductListPage.do");
			}else {
				mav.addObject("msg", "글 작성에 실패했습니다." );
				mav.addObject("location", "/productintro/SeasonProductWritePage.do");
			}
			mav.setViewName("commons/msg");
			return mav;
		}
	//제철 특산물 리스트 작성 끝
	
	
	
	//제철 특산물 리스트 조회
		@RequestMapping(value = "/productintro/SeasonProductView.do",method = RequestMethod.GET)
		public ModelAndView SeasonProductView(	@RequestParam int seasonProductNo,ModelAndView mav,@SessionAttribute Member member,@SessionAttribute Farm farm) {
			SeasonProductBoard seasonBoard = piService.SeasonProductView(seasonProductNo);
			
			mav.addObject("seasonBoard", seasonBoard);
			mav.setViewName("productintro/SeasonProductView");
			return mav;
		}


	//제철 특산물 리스트 수정
		@RequestMapping(value = "/productintro/SeasonProductUpdatePage.do",method = RequestMethod.GET)
		public ModelAndView SeasonProductUpdatePage(ModelAndView mav,
											@RequestParam int seasonProductNo,@SessionAttribute Member member,@SessionAttribute Farm farm) {
			
			//리스트 갖고오기
			SeasonProductBoard seasonBoard = piService.SeasonProductView(seasonProductNo);
			
			mav.addObject("seasonBoard", seasonBoard);
			mav.setViewName("productintro/SeasonProductUpdate");
			return mav;
		}
		
		@RequestMapping(value = "/productintro/SeasonProductUpdate.do",method = RequestMethod.POST)
		public ModelAndView SeasonProductUpdate(	ModelAndView mav,SeasonProductBoard seasonBoard,@SessionAttribute Member member) {
			
			System.out.println(seasonBoard);
			//글 수정했을때 새로운 이미지 파일이 들어오지 않았을 경우
			if(seasonBoard.getSeasonProductPhotoNo()==1) {
				seasonBoard.setSeasonProductNo(seasonBoard.getOriginalSeasonphotoNo());
				
			//글 수정했을때 새로운 이미지 파일이 들어왔을 경우
			//기존 이미지도 기본 이미지가 아닌 경우
			//기존 이미지 삭제 로직
			}else if(seasonBoard.getSeasonProductPhotoNo() !=1  && seasonBoard.getOriginalSeasonphotoNo()!=1) {
				SeasonProductFile sPhoto = piService.deleteFileCheck(seasonBoard.getOriginalSeasonphotoNo());
				String path = context.getRealPath("/resources/SeasonProductPhoto/img/");
				String filePath = path + sPhoto.getSeasonProductPhotoFilePath().toString().substring(29);
				
				File file = new File(filePath);
				file.delete();
			}
			
			int result = piService.SeasonProductUpdate(seasonBoard);
			
			if(result > 1) {
				mav.addObject("msg", "글이 수정되었습니다.." );
				mav.addObject("location", "/productintro/SeasonProductView.do?seasonProductNo="+seasonBoard.getSeasonProductNo());
			}else {
				mav.addObject("msg", "글 작성에 실패했습니다." );
				mav.addObject("location", "/productintro/SeasonProductUpdatePage.do?seasonProductNo="+seasonBoard.getSeasonProductNo());
			}
				mav.setViewName("commons/msg");
			
			return mav;
		}
	
	//제철 특산물 리스트 삭제
	
		
		//제철 특산물 버튼 누를시 월별로 이동하는 페이지
		@RequestMapping(value = "/productintro/SeasonProductSearchListPage.do",method = RequestMethod.GET)
		public ModelAndView localProductSearchList(		HttpServletRequest request,
														ModelAndView mav,
														@RequestParam(required = false, defaultValue = "1") int currentPage
														) {
			
			//버튼을 누를시 나오는 값
			String seasonProductClassify = request.getParameter("seasonProductClassify");
			
			HashMap<String, Object> map = piService.SeasonProductListPage(currentPage,seasonProductClassify);
			
			mav.addObject("list", map.get("list"));
			mav.addObject("pageNavi", map.get("pageNavi"));
			mav.addObject("search", seasonProductClassify);
			mav.setViewName("productintro/SeasonProductList");
			
			return mav;
			
		}
		//제철 특산물 버튼 누를시 월별로 이동하는 페이지 끝
		
		
		//삭제
		@RequestMapping(value = "/productintro/seasonDelete.do",method = RequestMethod.POST)
		public ModelAndView seasonDelete(	ModelAndView mav,
									HttpServletRequest request
									) {
			
			int seasonProductNo = Integer.parseInt(request.getParameter("seasonProductNo"));
			
			int result = piService.seasonDelete(seasonProductNo);
			
			
			if(result > 0) {
				mav.addObject("location", "/productintro/SeasonProductListPage.do");
			}else {
				mav.addObject("location", "/productintro/SeasonProductUpdatePage.do");
			}
			mav.setViewName("commons/msg");
			return mav;
		}
	
	
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
	@RequestMapping(value = "/productintro/LocalProductWritePage.do",method = RequestMethod.POST)
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
	public ModelAndView test(HttpServletRequest request,
							ModelAndView mav,
							@RequestParam(required = false, defaultValue = "1") int currentPage
							) {
		//검색값
		String localProductClassify = request.getParameter("localProductClassify");
		
		//검색값 해쉬맵
		//HashMap<String, Object> localProductClassifyKeyword = new HashMap<String, Object>();
		//localProductClassifyKeyword.put("localProductClassify", localProductClassify);
		
//		ArrayList<LocalProductBoard> list = piService.productintroLocalBtn(localProductClassify);
//		mav.addObject("list", list);
//		mav.setViewName("productintro/LocalProductList");

		//검색값 토대로 페이징 처리하기
		HashMap<String, Object> map = piService.productintroLocalBtn(currentPage,localProductClassify);
		
		mav.addObject("list", map.get("list"));
		mav.addObject("pageNavi", map.get("pageNavi"));
		mav.addObject("localProductClassify", localProductClassify);
		mav.setViewName("productintro/LocalProductList");
		
		return mav;
	}
	
	
	//지역 특산물 글 수정 공간
	@RequestMapping(value = "/productintro/localProductUpdatePage.do",method = RequestMethod.GET)
	public ModelAndView localProductUpdatePage(	ModelAndView mav,
												@RequestParam int localProductNo) {
		
		//리스트 갖고오기
		LocalProductBoard localBoard = piService.LocalProductView(localProductNo);
		
		mav.addObject("localBoard", localBoard);
		mav.setViewName("productintro/LocalProductUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/productintro/localProductUpdate.do",method = RequestMethod.POST)
	public ModelAndView localProductUpdate (	ModelAndView mav,LocalProductBoard localBoard) {
		System.out.println(localBoard);
		//글 수정했을때 새로운 이미지 파일이 들어오지 않았을 경우
		if(localBoard.getLocalProductPhotoNo()==1) {
			localBoard.setLocalProductNo(localBoard.getOriginalLocalphotoNo());
			
		//글 수정했을때 새로운 이미지 파일이 들어왔을 경우
		//기존 이미지도 기본 이미지가 아닌 경우
		//기존 이미지 삭제 로직
			
		
		}else if(localBoard.getLocalProductPhotoNo() !=1  && localBoard.getOriginalLocalphotoNo()!=1) {
			LocalProductFile lPhoto = piService.localdeleteFileCheck(localBoard.getOriginalLocalphotoNo());
			String path = context.getRealPath("/resources/localProductPhoto/img/");
			String filePath = path + lPhoto.getLocalProductPhotoFilePath().toString().substring(29);
			
			File file = new File(filePath);
			file.delete();
		}
		
		int result = piService.localProductUpdate(localBoard);
		
		if(result > 1) {
			mav.addObject("msg", "글이 수정되었습니다.." );
			mav.addObject("location", "/productintro/LocalProductView.do?localProductNo="+localBoard.getLocalProductNo());
		}else {
			mav.addObject("msg", "글 작성에 실패했습니다." );
			mav.addObject("location", "/productintro/localProductUpdatePage.do?localProductNo="+localBoard.getLocalProductNo());
		}
			mav.setViewName("commons/msg");
		
		return mav;
	}
	//지역 특산물 글 수정 공간 종료
	
	//삭제
	@RequestMapping(value = "/productintro/localDelete.do",method = RequestMethod.POST)
	public ModelAndView localDelete(HttpServletRequest request, ModelAndView mav) {
		int localProductNo = Integer.parseInt(request.getParameter("localProductNo"));
		
		int result = piService.localDelete(localProductNo);
		
		if(result > 0) {
			mav.addObject("msg", "글 작성에 성공했습니다." );
			mav.addObject("location", "/productintro/LocalProductListPage.do");
		}else {
			mav.addObject("msg", "글 작성에 실패했습니다." );
			mav.addObject("location", "/productintro/LocalProductView.do");
		}
		mav.setViewName("commons/msg");
		return mav;
	}
	
	
	
}
