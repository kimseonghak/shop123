package com.hot.shop.admin.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.admin.model.vo.Auction;

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

}
