package com.hot.shop.auction.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.admin.model.vo.SellForm;
import com.hot.shop.auction.model.vo.Purchaselist;
import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.question.model.vo.QuestionFarm;

@Repository
public class AuctionDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	//경매 진행중인 경매 폼  데이터 가져오기
	public HashMap<String, Object> selectAuction() {
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(int i=1; i<4; i++) {
			Auction au = new Auction();
			au = sql.selectOne("auction.selectAuction",i);
			map.put("au"+i, au);
		}
		return map;
		
	}
	
	//최저가 입력 시 insert 이용하여 데이터 삽입
	public int inputLowestPrice(Auction auc, int farmNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("auc", auc);
		map.put("farmNo", farmNo);
		
		return sql.insert("auction.inputLowestPrice",map);
	}
	
	//구매 가능한 구매 폼 찾기
	public HashMap<String, Object> selectAuctionSale() {
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(int i=1; i<4; i++) {
			SellForm sf = new SellForm();
			sf = sql.selectOne("auction.selectAuctionSale",i);
			map.put("au"+i, sf);
		}
		
		return map;
		
	}
	
	//주문하기 페이지를 눌렀을 경우 회원 정보 가져오기
	public Member selectLoginMember(Member member) {

		return sql.selectOne("member.selectLoginMember",member);
	}

	public Farm selectFarmName(Farm f) {
		
		return sql.selectOne("auction.selectFarmName",f);
	}

	//결제하기 눌렀을 경우 Purchaselist 테이블의 데이터 삽입
	public int insertOrder(Purchaselist p) {

		return sql.insert("auction.insertOrder",p);
	}

	//주문 결제가 완료되면 판매 수량에서 유저가 구매한 수량 빼주기
	public int minusAuctionCount1(int auctionCount, int auctionNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("auctionCount", auctionCount);
		map.put("auctionNo", auctionNo);
		
		return sql.update("auction.minusAuctionCount1",map);
	}

	public ArrayList<Purchaselist> orderListInfo(int recordCountPerPage, int currentPage, HashMap<String, Object> map) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		map.put("start", start);
		map.put("end",end);
		
		return new ArrayList<Purchaselist>(sql.selectList("auction.orderListInfo",map));
	}

	public String getPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage, HashMap<String, Object> map) {
		
		int recordTotalCount = totalCount(map);
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<a href='/auction/orderListPage.do?currentPage=1&userNo="+map.get("userNo")+"' class='naviArrow'>&lt;&lt;</a>");
		sb.append("<a href='/auction/orderListPage.do?currentPage="+(currentPage-10)+"&userNo="+map.get("userNo")+"' class='naviArrow' id='prev'>&lt;</a>");
		for(int i= startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<a href='/auction/orderListPage.do?currentPage="+i+"&userNo="+map.get("userNo")+"' id='currentNavi'>"+i+"</a>");
			}else {
				sb.append("<a href='/auction/orderListPage.do?currentPage="+i+"&userNo="+map.get("userNo")+"' class='otherNavi'>"+i+"</a>");
			}
		}
		if((currentPage+10)>pageTotalCount) {
			sb.append("<a href='/auction/orderListPage.do?currentPage="+pageTotalCount+"&userNo="+map.get("userNo")+"' class='naviArrow' id='next'>&gt;</a>");
		}else {
			sb.append("<a href='/auction/orderListPage.do?currentPage="+(currentPage+10)+"&userNo="+map.get("userNo")+"' class='naviArrow' id='next'>&gt;</a>");
		}
		
		sb.append("<a href='/auction/orderListPage.do?currentPage="+pageTotalCount+"&userNo="+map.get("userNo")+"' class='naviArrow'>&gt;&gt;</a>");
		return sb.toString();
	}
	
	public int totalCount(HashMap<String, Object> map) {
		
		return sql.selectOne("auction.orderListTotalCount",map);
	}

	public Purchaselist selectOrderDetail(String orderNo) {

		return sql.selectOne("auction.selectOrderDetail",orderNo);
		
	}

	
	

}
