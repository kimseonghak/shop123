package com.hot.shop.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.admin.model.vo.BID;
import com.hot.shop.admin.model.vo.Count;
import com.hot.shop.admin.model.vo.SellForm;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.question.model.vo.QuestionFarm;
import com.hot.shop.question.model.vo.QuestionUser;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public int auctionInput(Auction au) {
		// 경매 폼 데이터 토대로 경매 정보 저장
		return sql.insert("admin.auctionInput", au);
	}

	public HashMap<String, Object> auctionCheck() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 옥션페이지 접속시 경매 진행중인 정보를 가져옴
		for(int i=1; i<4; i++) {
			Auction au = new Auction();
			au = sql.selectOne("admin.auctionCheck",i);
			map.put("au"+i, au);
		}
		return map;
	}
	
	public void BIDScheduler() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 경매가 종료된 날을 기준으로 제일 마지막(낙찰된) 경매 정보를 가져와서 맵에 저장
		for(int i=1; i<=3; i++) {
			Auction au = new Auction();
			au = sql.selectOne("admin.BIDScheduler",i);
			map.put("bid"+i, au);
		}
		System.out.println("낙찰 정보 저장 완료");
		for(int i=1; i<=3; i++) {
			if(map.get("bid"+i)!=null) {
				// 날짜가 지난 모든 경매를 endYN = 'Y'로 변경
				sql.update("admin.auctionEndYN",(Auction)map.get("bid"+i));
				// 낙찰된 경매 번호를 낙찰DB에 저장
				sql.insert("admin.BIDinsert",(Auction)map.get("bid"+i));
			}
		}
		System.out.println("경매 날짜 지난 경매 종료");
		sql.update("admin.sellFormEndYN");
		System.out.println("판매 날짜 지난 경매 종료");
		System.out.println("예약 작업 종료");
	}
	// BID 목록과 정보 가져오는 로직
	public ArrayList<BID> BIDList(int recordCountPerPage, int currentPage) {
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end",end);
		return new ArrayList<BID>(sql.selectList("admin.BIDList",map));
	}
	public String getPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage,int formNo) {
		int recordTotalCount = totalCount();
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage=1&formNo="+formNo+"' class='naviArrow'>&lt;&lt;</a>");
		sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage="+(currentPage-10)+"&formNo="+formNo+"' class='naviArrow' id='prev'>&lt;</a>");
		for(int i= startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage="+i+"&formNo="+formNo+"' id='currentNavi'>"+i+"</a>");
			}else {
				sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage="+i+"&formNo="+formNo+"' class='otherNavi'>"+i+"</a>");
			}
		}
		if((currentPage+10)<pageTotalCount) {
			sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage="+pageTotalCount+"&formNo="+formNo+"' class='naviArrow' id='next'>&gt;</a>");
		}else {
			sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage="+(currentPage+10)+"&formNo="+formNo+"' class='naviArrow' id='next'>&gt;</a>");
		}
		
		sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage="+pageTotalCount+"&formNo="+formNo+"' class='naviArrow'>&gt;&gt;</a>");
		return sb.toString();
	}
	public int totalCount() {
		return sql.selectOne("admin.BIDTotalCount");
	}
	// 경매 정보 1개 가져오는 로직 (판매 폼에 정보 입력하게 위한 용도)
	public Auction outputAucionInfo(int auctionNo) {
		return sql.selectOne("admin.selectOneAuction",auctionNo);
	}
	// 판매 시작할 경우 낙찰DB에 판매유무 Y로 변경 + 판매 정보 입력하는 로직
	public int sellInput(SellForm sf) {
		return sql.insert("admin.sellInput",sf)+sql.update("admin.BIDEndYNUpdate",sf.getAuctionNo());
	}
	
	// 판매 중인 경우 판매중인 정보 가져오는 로직
	public HashMap<String, Object> sellFormCheck() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		for(int i=1; i<4; i++) {
			SellForm sf = new SellForm();
			Auction au = new Auction();
			sf = sql.selectOne("admin.sellFormCheck",i);
			if(sf!=null) {
				au = sql.selectOne("admin.selectOneAuction",sf.getAuctionNo());
				map.put("au"+i, au);
			}
			map.put("sf"+i, sf);
		}
		return map;
	}
	// 판매중인 상품의 판매기간/홍보주소/종료여부 변경하는 로직
	public int sellUpdate(SellForm sf) {
		return sql.update("admin.sellUpdate",sf);
	}

	public HashMap<String, Integer> countOutput() {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("yester", ((Count)sql.selectOne("admin.countOutput", 1)).getCountSum());
		map.put("today", ((Count)sql.selectOne("admin.countOutput", 0)).getCountSum());
		return map;
	}

	public void countInput() {
		if(sql.selectOne("admin.countCheck")==null) {
			sql.insert("admin.countInsert");
		}else {
			sql.update("admin.countUpdate");
		}
	}

	public HashMap<String, Integer> joinOutput() {
		HashMap<String, Integer> joinMap = new HashMap<String, Integer>();
		joinMap.put("yester",sql.selectOne("admin.joinOutput",1));
		joinMap.put("today", sql.selectOne("admin.joinOutput",0));
		return joinMap;
	}

	public HashMap<String, Integer> farmOutpuf() {
		HashMap<String, Integer> farmMap = new HashMap<String, Integer>();
		farmMap.put("yester",sql.selectOne("admin.farmOutput",1));
		farmMap.put("today", sql.selectOne("admin.farmOutput",0));
		return farmMap;
	}

	public ArrayList<QuestionUser> questionUser() {
		return new ArrayList<QuestionUser>(sql.selectList("admin.questionUserListMain"));
	}

	public ArrayList<QuestionFarm> questionFarm() {
		return new ArrayList<QuestionFarm>(sql.selectList("admin.questionFarmListMain"));
	}

	public ArrayList<QuestionFarm> questionFarmSearchList(int recordCountPerPage, int currentPage,
			HashMap<String, Object> map) {
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		map.put("start", start);
		map.put("end",end);
		
		return new ArrayList<QuestionFarm>(sql.selectList("admin.questionFarmSearchList",map));
	}

	public String getFarmQNASearchPageNavi(int recordCountPerPage, int currentPage, HashMap<String, Object> map,
			int naviCountPerPage) {
		int recordTotalCount = farmQNASeqarchTotalCount(map); 
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<a href='/admin/adminFarmQNAPage.do?currentPage=1&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&lt;&lt;</a>");
		sb.append("<a href='/admin/adminFarmQNAPage.do?currentPage="+(currentPage-10)+"' class='naviArrow' id='prev'>&lt;</a>");
		for(int i= startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<a href='/admin/adminFarmQNAPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' id='currentNavi'>"+i+"</a>");
			}else {
				sb.append("<a href='/admin/adminFarmQNAPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='otherNavi'>"+i+"</a>");
			}
		}
		if((currentPage+10)>pageTotalCount) {
			sb.append("<a href='/admin/adminFarmQNAPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}else {
			sb.append("<a href='/admin/adminFarmQNAPage.do?currentPage="+(currentPage+10)+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}
		sb.append("<a href='/admin/adminFarmQNAPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&gt;&gt;</a>");
		
		return sb.toString();
	}

	private int farmQNASeqarchTotalCount(HashMap<String, Object> map) {
		return sql.selectOne("admin.farmQNASearchTotalCount",map);
	}

	public QuestionFarm questionFarmContent(int questionFarmNo) {
		return sql.selectOne("admin.questionFarmContent",questionFarmNo);
	}

	public ArrayList<QuestionUser> questionUserSearchList(int recordCountPerPage, int currentPage,
			HashMap<String, Object> map) {
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		map.put("start", start);
		map.put("end",end);
		
		return new ArrayList<QuestionUser>(sql.selectList("admin.questionUserSearchList",map));
	}

	public String getUserQNASearchPageNavi(int recordCountPerPage, int currentPage, HashMap<String, Object> map,
			int naviCountPerPage) {
		int recordTotalCount = userQNASeqarchTotalCount(map); 
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<a href='/admin/adminUserQNAPage.do?currentPage=1&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&lt;&lt;</a>");
		sb.append("<a href='/admin/adminUserQNAPage.do?currentPage="+(currentPage-10)+"' class='naviArrow' id='prev'>&lt;</a>");
		for(int i= startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<a href='/admin/adminUserQNAPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' id='currentNavi'>"+i+"</a>");
			}else {
				sb.append("<a href='/admin/adminUserQNAPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='otherNavi'>"+i+"</a>");
			}
		}
		if((currentPage+10)>pageTotalCount) {
			sb.append("<a href='/admin/adminUserQNAPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}else {
			sb.append("<a href='/admin/adminUserQNAPage.do?currentPage="+(currentPage+10)+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}
		sb.append("<a href='/admin/adminUserQNAPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&gt;&gt;</a>");
		
		return sb.toString();
	}

	private int userQNASeqarchTotalCount(HashMap<String, Object> map) {
		return sql.selectOne("admin.userQNASearchTotalCount",map);
	}


	public Member selectMember(int userNo) {
		return sql.selectOne("admin.selectMember",userNo);
	}

	public int memberEndYNUpdate(HashMap<String, Object> map) {
		return sql.update("admin.memberEndYNUpdate",map);
	}

	public ArrayList<Member> memberSearchList(int currentPage, int recordCountPerPage, HashMap<String, Object> map) {
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		map.put("start", start);
		map.put("end", end);
		return new ArrayList<Member>(sql.selectList("admin.memberSearchList",map));
	}

	public String getMemberSearchPageNavi(int recordCountPerPage, int currentPage, HashMap<String, Object> map,
			int naviCountPerPage) {
		int recordTotalCount = memberSeqarchTotalCount(map); 
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<a href='/admin/adminMemberPage.do?currentPage=1&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&lt;&lt;</a>");
		sb.append("<a href='/admin/adminMemberPage.do?currentPage="+(currentPage-10)+"' class='naviArrow' id='prev'>&lt;</a>");
		for(int i= startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<a href='/admin/adminMemberPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' id='currentNavi'>"+i+"</a>");
			}else {
				sb.append("<a href='/admin/adminMemberPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='otherNavi'>"+i+"</a>");
			}
		}
		if((currentPage+10)>pageTotalCount) {
			sb.append("<a href='/admin/adminMemberPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}else {
			sb.append("<a href='/admin/adminMemberPage.do?currentPage="+(currentPage+10)+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}
		sb.append("<a href='/admin/adminMemberPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&gt;&gt;</a>");
		
		return sb.toString();
	}

	private int memberSeqarchTotalCount(HashMap<String, Object> map) {
		return sql.selectOne("admin.memberSearchTotalCount",map);
	}

	public ArrayList<Member> refundList(int currentPage, int recordCountPerPage, HashMap<String, Object> map) {
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		map.put("start", start);
		map.put("end", end);
		return new ArrayList<Member>(sql.selectList("admin.refundList",map));
	}
}
