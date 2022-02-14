package com.hot.shop.admin.contoller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.admin.model.service.AdminService;
import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.admin.model.vo.Refund;
import com.hot.shop.admin.model.vo.SellForm;
import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.question.model.vo.QuestionAnswer;
import com.hot.shop.question.model.vo.QuestionFarm;
import com.hot.shop.question.model.vo.QuestionUser;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	private IamportClient client;
	
	@Value("#{db['imp_key']}")
	private String key;
	@Value("#{db['imp_secret']}")
	private String secret;
	
	// 메인 대시보드
	@RequestMapping(value="/admin/adminDashboardPage.do",method = RequestMethod.GET)
	public ModelAndView adminDashboardPage(ModelAndView mav, @SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		HashMap<String, Integer> map = aService.countOutput();
		HashMap<String, Integer> joinMap = aService.joinOutput();
		HashMap<String, Integer> farmMap = aService.farmOutput();
		HashMap<String, Object> sugMap = aService.sugWork();
		ArrayList<QuestionUser> qUser = aService.questionUser();
		ArrayList<QuestionFarm> qFarm = aService.questionFarm();
		ArrayList<Refund> refund = aService.refund();
		mav.addObject("dayMap",map);
		mav.addObject("joinMap",joinMap);
		mav.addObject("farmMap",farmMap);
		mav.addObject("sugMap",sugMap);
		mav.addObject("qUser",qUser);
		mav.addObject("qFarm",qFarm);
		mav.addObject("refund",refund);
		mav.setViewName("admin/admin_dashBoard");
		return mav;
	}

// 옥션 기능 모음
	
	// 옥션 페이지
	@RequestMapping(value="/admin/adminAuctionPage.do",method = RequestMethod.GET)
	public ModelAndView adminAuctionPage(ModelAndView mav, @SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		HashMap<String, Object> map = aService.auctionCheck();
		HashMap<String, Object> map2 = aService.sellFormCheck();
		mav.addObject("map",map);
		mav.addObject("map2",map2);
		mav.setViewName("admin/admin_auction");
		return mav;
	}
	// 경매 정보 입력
	@RequestMapping(value = "/admin/auctionInput.do",method = RequestMethod.POST)
	public ModelAndView auctionInput(Auction au,ModelAndView mav, @SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		au.setFarmNo(1);
		System.out.println(au.toString());
		if(au.getAuctionEndYN()=='Y') {
			int result = aService.auctionUpdate(au);
			if(result>0) {
				mav.addObject("msg",au.getAuctionFormNo()+"번 경매가 취소되었습니다.");
				mav.addObject("location","/admin/adminAuctionPage.do");
			}else {
				mav.addObject("msg","오류가 발생하였습니다.");
				mav.addObject("location","/admin/adminAuctionPage.do");
			}
			
			mav.setViewName("commons/msg");
			
			return mav;
		}
		int result = aService.auctionInput(au);
		if(result>0) {
			mav.addObject("msg",au.getAuctionFormNo()+"번 경매가 시작되었습니다.");
			mav.addObject("location","/admin/adminAuctionPage.do");
		}else {
			mav.addObject("msg","오류가 발생하였습니다.");
			mav.addObject("location","/admin/adminAuctionPage.do");
		}
		
		mav.setViewName("commons/msg");
		
		return mav;
	}
	// 낙찰 정보 가져오기(BID)
	@RequestMapping(value = "/admin/adminAuctionInfoPage.do", method = RequestMethod.GET)
	public ModelAndView adminAuctionInfoPage(HttpServletRequest request,ModelAndView mav,@RequestParam int formNo,
			@RequestParam(required = false, defaultValue = "1") int currentPage,
			@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		HashMap<String,Object> map = aService.BIDInfo(currentPage,formNo);
		
		mav.addObject("currentPage",currentPage);
		mav.addObject("map",map);
		mav.addObject("formNo",formNo);
		mav.setViewName("admin/admin_auction_info");
		
		return mav;
	}
	// 관리자 페이지 판매폼에 낙찰된 경매 정보 입력받는 로직(BID 경매번호 토대로 경매 정보 가져오기)
	@RequestMapping(value = "/admin/outputAuctionInfo.do", method = RequestMethod.GET)
	@ResponseBody
	public Auction outputAucionInfo(@RequestParam int auctionNo,
			@SessionAttribute(required = false) Farm farm,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException{
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/error.jsp");
			view.forward(request, response);
		}
		
		Auction au = aService.outputAucionInfo(auctionNo);
		/*
		Gson gson = new Gson();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		gson.toJson(au,out);
		*/
		return au;
	}
	// 판매DB 입력 로직
	@RequestMapping(value = "/admin/sellInput.do", method = RequestMethod.POST)
	public ModelAndView sellInput(SellForm sf,ModelAndView mav,@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		int result = aService.sellInput(sf);
		if(result>1) {
			mav.addObject("msg",sf.getSellFormNo()+"번 판매가 시작되었습니다.");
			mav.addObject("location","/admin/adminAuctionPage.do");
		}else {
			mav.addObject("msg","오류가 발생하였습니다.");
			mav.addObject("location","/admin/adminAuctionPage.do");
		}
		
		mav.setViewName("commons/msg");
		
		return mav;
	}
	// 판매중인 상품의 판매기간/홍보주소/종료여부 변경하는 로직
	@RequestMapping(value = "/admin/sellUpdate.do", method = RequestMethod.POST)
	public ModelAndView sellUpdate(SellForm sf,ModelAndView mav,@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		int result = aService.sellUpdate(sf);
		if(result>0) {
			mav.addObject("msg",sf.getSellFormNo()+"번 판매 정보가 변경되었습니다.");
			mav.addObject("location","/admin/adminAuctionPage.do");
		}else {
			mav.addObject("msg","오류가 발생하였습니다.");
			mav.addObject("location","/admin/adminAuctionPage.do");
		}
		mav.setViewName("commons/msg");
		
		return mav;
	}
	
// farmQNA 모음	
	
	// farmQNA 페이지
	@RequestMapping(value = "/admin/adminFarmQNAPage.do", method = RequestMethod.GET)
	public ModelAndView farmQNASearch(@RequestParam(required = false, defaultValue = "default") String type, 
			@RequestParam(required = false, defaultValue = "") String keyword, 
			@RequestParam(required = false, defaultValue = "1") int currentPage, ModelAndView mav,
			@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		map = aService.farmQNASearchList(map,currentPage);
		
		mav.addObject("map",map);
		mav.addObject("currentPage",currentPage);
		mav.setViewName("admin/admin_farmQNA");
		
		return mav;
	}
	
	// farmQNA 내용 페이지
	@RequestMapping(value = "/admin/adminFarmQNAContent.do", method = RequestMethod.GET)
	public ModelAndView farmQNAContent(
			@RequestParam(required = false, defaultValue = "default") String type, 
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam(required = false, defaultValue = "1") int currentPage,
			@RequestParam int questionFarmNo,ModelAndView mav,
			@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		QuestionFarm qFarm = aService.questionFarmContent(questionFarmNo);
		QuestionAnswer qAnswer = aService.questionFarmAnswer(questionFarmNo);
		
		mav.addObject("type",type);
		mav.addObject("keyword",keyword);
		mav.addObject("qFarm",qFarm);
		mav.addObject("qAnswer",qAnswer);
		mav.addObject("currentPage",currentPage);
		mav.setViewName("admin/admin_farmQNAContent");
		
		return mav;
	}
	
// userQNA 모음	
	
	// userQNA 검색 페이지
	@RequestMapping(value = "/admin/adminUserQNAPage.do", method = RequestMethod.GET)
	public ModelAndView userQNASearch(
			@RequestParam(required = false, defaultValue = "default") String type, 
			@RequestParam(required = false, defaultValue = "") String keyword, 
			@RequestParam(required = false, defaultValue = "1") int currentPage, ModelAndView mav,
			@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		map = aService.userQNASearchList(map,currentPage);
		
		mav.addObject("map",map);
		mav.addObject("currentPage",currentPage);
		mav.setViewName("admin/admin_userQNA");
		
		return mav;
	}
	
	// userQNA 내용 페이지
	@RequestMapping(value = "/admin/adminUserQNAContent.do", method = RequestMethod.GET)
	public ModelAndView userQNAContent(
			@RequestParam(required = false, defaultValue = "default") String type, 
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam(required = false, defaultValue = "1") int currentPage,
			@RequestParam int questionUserNo,
			ModelAndView mav,
			@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		QuestionUser qUser = aService.questionUserContent(questionUserNo);
		QuestionAnswer qAnswer = aService.questionUserAnswer(questionUserNo);
		
		mav.addObject("type",type);
		mav.addObject("keyword",keyword);
		mav.addObject("qUser",qUser);
		mav.addObject("qAnswer",qAnswer);
		mav.addObject("currentPage",currentPage);
		mav.setViewName("admin/admin_userQNAContent");
		
		return mav;
	}	
	
// refund 기능 모음
	
	// 최초 refund 페이지
	@RequestMapping(value = "/admin/adminRefundPage.do", method = RequestMethod.GET)
	public ModelAndView adminRefund(ModelAndView mav,
			@RequestParam(required = false,defaultValue = "1") int currentPage,
			@RequestParam(required = false,defaultValue = "default") String type,
			@RequestParam(required = false,defaultValue = "") String keyword,
			@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		map = aService.refundList(currentPage,map);
		mav.addObject("currentPage",currentPage);
		mav.addObject("map",map);
		mav.setViewName("admin/admin_refund");
		return mav;
	}

	public void setup() {
		String test_api_key = key;
		String test_api_secret = secret;
		client = new IamportClient(test_api_key, test_api_secret);
	}
	
	//결제 환불 로직
	@RequestMapping(value = "/admin/adminRefundUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public Boolean adminRefundUpdate(
			@RequestParam int refundNo,
			@RequestParam char adminYN,
			@RequestParam String orderNo,
			@SessionAttribute(required = false) Farm farm,
			HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/error.jsp");
			view.forward(request, response);
		}
		
		setup();
		
		String test_already_cancelled_merchant_uid = orderNo;
		CancelData cancel_data = new CancelData(test_already_cancelled_merchant_uid, false); //merchant_uid를 통한 전액취소
		cancel_data.setEscrowConfirmed(true); //에스크로 구매확정 후 취소인 경우 true설정
		
		try {
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			
		} catch (IamportResponseException e) {
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("refundNo", refundNo);
		map.put("adminYN", adminYN);
		boolean result = aService.refundUpdate(map);
		
		
		return result;
	}
	
// farm 기능 모음
	
	// 농가 검색 페이지
	@RequestMapping(value = "/admin/adminFarmPage.do", method = RequestMethod.GET)
	public ModelAndView farmSearchList(ModelAndView mav,
			@RequestParam(required = false,defaultValue = "1") int currentPage,
			@RequestParam(required = false,defaultValue = "default") String type, 
			@RequestParam(required = false,defaultValue = "") String keyword,
			@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		if(type.equals("farmNo")) {
			boolean isNumber = Pattern.matches("^[0-9]*$", keyword);
			if(isNumber==false) {
				type="default";
				keyword="";
			}
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		map = aService.farmSearchList(map,currentPage);
		
		mav.addObject("map",map);
		mav.addObject("currentPage",currentPage);
		mav.setViewName("admin/admin_farm");
		
		return mav;
	}
	//농가 탈퇴 복구 로직
	@RequestMapping(value = "/admin/adminFarmEndYNUpdate.do", method = RequestMethod.GET)
	public ModelAndView farmEndYNUpdate(ModelAndView mav,
			@RequestParam int farmNo,
			@RequestParam int currentPage,
			@RequestParam(required = false, defaultValue = "default") String type, 
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam String endYN,
			@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("farmNo", farmNo);
		map.put("endYN", endYN);
		int result = aService.farmEndYNUpdate(map);
		if(result>0 && endYN.equals("N")) {
			mav.addObject("msg","탈퇴 처리 되었습니다.");
			mav.addObject("location","/admin/adminFarmPage.do?curretnPage="+currentPage+"&type="+type+"&keyword="+keyword);
		}else {
			mav.addObject("msg","복구 처리 되었습니다.");
			mav.addObject("location","/admin/adminFarmPage.do?curretnPage="+currentPage+"&type="+type+"&keyword="+keyword);
		}
		mav.setViewName("commons/msg");
		return mav;
	}
	
	// 농장 정보 팝업 로직
	@RequestMapping(value = "/admin/adminFarmInfoPage.do", method = RequestMethod.GET)
	public ModelAndView farmInfoPage(ModelAndView mav,
			@RequestParam int farmNo,
			@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		Farm f = aService.farmInfo(farmNo);
		mav.addObject("f",f);
		mav.setViewName("/admin/admin_farm_info");
		return mav;
	}
	
// member 기능 모음
	
	// member 페이지
	@RequestMapping(value = "/admin/adminMemberPage.do", method = RequestMethod.GET)
	public ModelAndView memberSearchList(ModelAndView mav,
			@RequestParam(required = false,defaultValue = "1") int currentPage,
			@RequestParam(required = false,defaultValue = "default") String type, 
			@RequestParam(required = false,defaultValue = "") String keyword,
			@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		if(type.equals("userNo")) {
			boolean isNumber = Pattern.matches("^[0-9]*$", keyword);
			if(isNumber==false) {
				type="default";
				keyword="";
			}
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		map = aService.memberSearchList(map,currentPage);
		
		mav.addObject("map",map);
		mav.addObject("currentPage",currentPage);
		mav.setViewName("admin/admin_member");
		
		return mav;
	}
	
	// member 탈퇴 관리 (EndYN 변경)
	@RequestMapping(value = "/admin/adminMemberEndYNUpdate.do", method = RequestMethod.GET)
	public ModelAndView memberEndYNUpdate(ModelAndView mav,
			@RequestParam int userNo,
			@RequestParam int currentPage,
			@RequestParam(required = false, defaultValue = "default") String type, 
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam String endYN,
			@SessionAttribute(required = false) Farm farm) {

		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("endYN", endYN);
		int result = aService.memberEndYNUpdate(map);
		if(result>0 && endYN.equals("N")) {
			mav.addObject("msg","탈퇴 처리 되었습니다.");
			mav.addObject("location","/admin/adminMemberPage.do?curretnPage="+currentPage+"&type="+type+"&keyword="+keyword);
		}else {
			mav.addObject("msg","복구 처리 되었습니다.");
			mav.addObject("location","/admin/adminMemberPage.do?curretnPage="+currentPage+"&type="+type+"&keyword="+keyword);
		}
		mav.setViewName("commons/msg");
		return mav;
	}
	
	// member 상세정보 팝업창
	@RequestMapping(value = "/admin/adminMemberInfoPage.do", method = RequestMethod.GET)
	public ModelAndView memberInfoPage(@RequestParam int userNo,ModelAndView mav,@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		
		Member m = aService.selectMember(userNo);
		mav.addObject("m",m);
		mav.setViewName("admin/admin_member_info");
		return mav;
	}
// 게시판 관련 기능
	// 게시판 페이지
	@RequestMapping(value = "/admin/adminBoardPage.do", method = RequestMethod.GET)
	public ModelAndView adminBoardPage(ModelAndView mav,
			@RequestParam(required = false, defaultValue = "default") String type, 
			@RequestParam(required = false, defaultValue = "") String keyword, 
			@RequestParam(required = false, defaultValue = "1") int currentPage,
			@SessionAttribute(required = false) Farm farm) {
		
		// 관리자 확인 코드
		if(farm == null || farm.getRating().equals("FARM")) {
			mav.setViewName("commons/error");
			return mav;
		}
		HashMap<String,Object>map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map = aService.adminBoard(map);
		
		mav.addObject("map",map);
		mav.setViewName("admin/admin_board");
		
		return mav;
	}
	// 홍보게시판 삭제 복구
	@RequestMapping(value = "/admin/adminPromotionEndYNUpdate.do", method = RequestMethod.GET)
	public ModelAndView promotionEndYNUpdate(ModelAndView mav,
			@RequestParam String endYN,
			@RequestParam String promotionNo,
			@RequestParam(required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "default") String type, 
			@RequestParam(required = false, defaultValue = "") String keyword) {
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("endYN", endYN);
		map.put("promotionNo",promotionNo);
		
		boolean result = aService.promotionEndYNUpdate(map);
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		
		if(result) {
			if(endYN.equals("Y")) mav.addObject("msg","게시판이 삭제되었습니다.");
			else mav.addObject("msg","게시판이 복구되었습니다.");
			mav.addObject("location", "/admin/adminBoardPage.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword);
		}else {
			mav.addObject("msg","오류가 발생하였습니다.");
			mav.addObject("location", "/admin/adminBoardPage.do?currentPage="+currentPage+"&type="+type+"&keyword="+keyword);
		}
		mav.setViewName("commons/msg");
		
		return mav;
	}
	
// 기타 로직 모음
		
	// 방문자 카운트 더하는 로직
	@RequestMapping(value = "/admin/countInput.do", method = RequestMethod.GET)
	@ResponseBody
	public String countInput() {
		aService.countInput();
		return "1";
	}
}
