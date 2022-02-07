package com.hot.shop.auction.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.admin.model.vo.Auction;
import com.hot.shop.admin.model.vo.SellForm;
import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;

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

	public Member selectLoginMember(Member member) {

		return sql.selectOne("member.selectLoginMember",member);
	}

	

}
