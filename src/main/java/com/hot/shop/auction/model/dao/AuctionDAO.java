package com.hot.shop.auction.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.admin.model.vo.Auction;

@Repository
public class AuctionDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public ArrayList<Auction> selectAuction() {
		
		return new ArrayList<Auction>(sql.selectList("auction.selectAuction"));
	}

}
