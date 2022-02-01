package com.hot.shop.auction.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.admin.model.vo.Auction;

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

}
