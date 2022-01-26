package com.hot.shop.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.admin.model.vo.BID;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public int auctionInput(Auction au) {
		return sql.insert("admin.auctionInput", au);
	}

	public HashMap<String, Object> auctionCheck() {
		Auction au1 = sql.selectOne("admin.auctionCheck",1);
		Auction au2 = sql.selectOne("admin.auctionCheck",2);
		Auction au3 = sql.selectOne("admin.auctionCheck",3);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("au1", au1);
		map.put("au2", au2);
		map.put("au3", au3);
		return map;
	}
	
	public void BIDScheduler() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		for(int i=1; i<=3; i++) {
			Auction au = new Auction();
			au = sql.selectOne("admin.BIDScheduler",i);
			map.put("bid"+i, au);
		}
		for(int i=1; i<=3; i++) {
			if(map.get("bid"+i)!=null) {
				sql.update("admin.auctionEndYN",(Auction)map.get("bid"+i));
				sql.insert("admin.BIDinsert",(Auction)map.get("bid"+i));
			}
		}
		System.out.println("예약 작업 종료");
	}

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

	public Auction outputAucionInfo(int auctionNo) {
		return sql.selectOne("admin.selectOneAuction",auctionNo);
	}

}
