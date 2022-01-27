package com.hot.shop.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.admin.model.vo.BID;
import com.hot.shop.admin.model.vo.SellForm;

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
		
		for(int i=1; i<=3; i++) {
			if(map.get("bid"+i)!=null) {
				// 날짜가 지난 모든 경매를 endYN = 'Y'로 변경
				sql.update("admin.auctionEndYN",(Auction)map.get("bid"+i));
				// 낙찰된 경매 번호를 낙찰DB에 저장
				sql.insert("admin.BIDinsert",(Auction)map.get("bid"+i));
			}
		}
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
	public String getPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage) {
		int recordTotalCount = totalCount();
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage=1' class='naviArrow'>&lt;&lt;</a>");
		sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage="+(currentPage-10)+"' class='naviArrow' id='prev'>&lt;</a>");
		for(int i= startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage="+i+"' id='currentNavi'>"+i+"</a>");
			}else {
				sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage="+i+"' class='otherNavi'>"+i+"</a>");
			}
		}
		sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage="+(currentPage+10)+"' class='naviArrow' id='next'>&gt;</a>");
		sb.append("<a href='/admin/adminAuctionInfoPage.do?currentPage="+pageTotalCount+"' class='naviArrow'>&gt;&gt;</a>");
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
}
