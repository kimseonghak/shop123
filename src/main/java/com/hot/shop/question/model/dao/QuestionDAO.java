package com.hot.shop.question.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hot.shop.admin.model.vo.BID;
import com.hot.shop.admin.model.vo.Refund;
import com.hot.shop.auction.model.vo.Purchaselist;
import com.hot.shop.farm.model.vo.Farm;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.question.model.vo.QuestionAnswer;
import com.hot.shop.question.model.vo.QuestionFarm;
import com.hot.shop.question.model.vo.QuestionPhoto;
import com.hot.shop.question.model.vo.QuestionUser;

@Repository
public class QuestionDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//1:1문의 글쓰기(유저 실질적인 백단)
	public int insertUserWrite(QuestionUser qUser) {
		int result1 = sqlSession.insert("qUser.insertUserWrite", qUser);
		int result2 = 0;
		int result3 = 0;
		if(qUser.getQuestionphotoNo()!=1) {
			result2 = sqlSession.update("qUser.updateQPhote",qUser.getQuestionphotoNo());
		}
		if(qUser.getQuestionUserCode().equals("Q-1")) {
			Purchaselist pur = sqlSession.selectOne("qUser.selectPurchaselist",qUser);
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("qUser", qUser);
			map.put("pur", pur);
			result3 = sqlSession.insert("qUser.refund",map);
		}
		return result1+result2+result3;
	}

	//1:1문의 사진 넣기
	public int insertWriteFile(QuestionPhoto qp) {
		return sqlSession.insert("qUser.insertWriteFile", qp);
	}

	//1:1문의 조회(사용자)
	public HashMap<String, Object> questionView(int questionUserNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("qUser", sqlSession.selectOne("qUser.questionView", questionUserNo));
		map.put("refund", sqlSession.selectOne("qUser.questionViewRefund",questionUserNo));
		map.put("qAnswer", sqlSession.selectOne("qUser.questionAnswerCheck",questionUserNo));
		return map;
	}

	public ArrayList<Purchaselist> getBuyList(int currentPage, Member member, int recordCountPerPage) {
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end",end);
		map.put("userNo", member.getUserNo());
		return new ArrayList<Purchaselist>(sqlSession.selectList("qUser.buyCheckList",map));
	}

	public String getBuyPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage, Member member) {
		int recordTotalCount = buyTotalCount(member);
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<a href='/question/buyListCheckPage.do?currentPage=1' class='naviArrow'>&lt;&lt;</a>");
		sb.append("<a href='/question/buyListCheckPage.do?currentPage="+(currentPage-10)+"' class='naviArrow' id='prev'>&lt;</a>");
		for(int i= startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<a href='/question/buyListCheckPage.do?currentPage="+i+"' id='currentNavi'>"+i+"</a>");
			}else {
				sb.append("<a href='/question/buyListCheckPage.do?currentPage="+i+"' class='otherNavi'>"+i+"</a>");
			}
		}
		if((currentPage+10)>pageTotalCount) {
			sb.append("<a href='/question/buyListCheckPage.do?currentPage="+pageTotalCount+"' class='naviArrow' id='next'>&gt;</a>");
		}else {
			sb.append("<a href='/question/buyListCheckPage.do?currentPage="+(currentPage+10)+"' class='naviArrow' id='next'>&gt;</a>");
		}
		
		sb.append("<a href='/question/buyListCheckPage.do?currentPage="+pageTotalCount+"' class='naviArrow'>&gt;&gt;</a>");
		return sb.toString();
	}

	private int buyTotalCount(Member member) {
		return sqlSession.selectOne("qUser.buyListTotalCount",member.getUserNo());
	}


	

	public ArrayList<QuestionUser> getUserQuestionList(int recordCountPerPage, HashMap<String, Object> map) {
		int start = (int)map.get("currentPage")*recordCountPerPage-(recordCountPerPage-1);
		int end = (int)map.get("currentPage")*recordCountPerPage;
		
		map.put("start", start);
		map.put("end",end);
		return new ArrayList<QuestionUser>(sqlSession.selectList("qUser.questionUserList",map));
	}

	public String getUserQuestionNavi(int recordCountPerPage, int naviCountPerPage, HashMap<String, Object> map) {
		int recordTotalCount = qUserTotalCount(map);
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		int currentPage = (int)map.get("currentPage");
		
		int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<a href='/question/QuestionUserPage.do?currentPage=1&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&lt;&lt;</a>");
		sb.append("<a href='/question/QuestionUserPage.do?currentPage="+(currentPage-10)+"' class='naviArrow' id='prev'>&lt;</a>");
		for(int i= startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<a href='/question/QuestionUserPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' id='currentNavi'>"+i+"</a>");
			}else {
				sb.append("<a href='/question/QuestionUserPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='otherNavi'>"+i+"</a>");
			}
		}
		if((currentPage+10)>pageTotalCount) {
			sb.append("<a href='/question/QuestionUserPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}else {
			sb.append("<a href='/question/QuestionUserPage.do?currentPage="+(currentPage+10)+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}
		sb.append("<a href='/question/QuestionUserPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&gt;&gt;</a>");
		
		return sb.toString();
	}

	private int qUserTotalCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("qUser.qUserTotalCount",map);
	}

	public int questionUserDelete(int questionUserNo,String questionUserCode) {
		if(questionUserCode.equals("Q-1")) {
			sqlSession.update("qUser.refundDelete",questionUserNo);
		}
		return sqlSession.update("qUser.questionUserDelete",questionUserNo);
	}

	public boolean questionAnswer(QuestionAnswer qAnswer) {
		if(qAnswer.getQuestionUserAnswerYN() == 'N') {
			int result =sqlSession.insert("qUser.questionAnswer",qAnswer);
			int result2 = sqlSession.update("qUser.questionUserAnswerYN",qAnswer);
			return result+result2 > 1;
		}else {
			int result = sqlSession.update("qUser.questionAnswerUpdate",qAnswer);
			return result > 0;
		}
	}

	public QuestionPhoto deleteFileCheck(int originalQuestionphotoNo) {
			sqlSession.update("qUser.deleteFileUpdate",originalQuestionphotoNo);
		return sqlSession.selectOne("qUser.deleteFileCheck",originalQuestionphotoNo);
	}

	public int questiouUserUpdate(QuestionUser qUser) {
		return sqlSession.update("qUser.questionUserUpdate",qUser)+sqlSession.update("qUser.updateQPhote",qUser.getQuestionphotoNo());
	}

	public ArrayList<Farm> farmCheck(String farmName) {
		return new ArrayList<Farm>(sqlSession.selectList("qUser.farmCheck",farmName));
	}


	
	
	
	//-----------------------------------------농가 문의-----------------------------------------
	//농가 문의 리스트 공간
		public ArrayList<QuestionFarm> farmQuestionList(int recordCountPerPage, HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			int start = (int)map.get("currentPage")*recordCountPerPage-(recordCountPerPage-1);
			int end = (int)map.get("currentPage")*recordCountPerPage;
			
			map.put("start", start);
			map.put("end",end);
			return new ArrayList<QuestionFarm>(sqlSession.selectList("qFarm.farmQuestionList",map));
		}

		public String FarmQuestionNavi(int recordCountPerPage, int naviCountPerPage, HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			int recordTotalCount = qFarmTotalCount(map);
			int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
			int currentPage = (int)map.get("currentPage");
			
			int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
			int endNavi = startNavi+naviCountPerPage-1;
			
			if(endNavi>pageTotalCount) {
				endNavi=pageTotalCount;
			}
			
			StringBuilder sb = new StringBuilder();
			sb.append("<a href='/question/QuestionFarmPage.do?currentPage=1&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&lt;&lt;</a>");
			sb.append("<a href='/question/QuestionFarmPage.do?currentPage="+(currentPage-10)+"' class='naviArrow' id='prev'>&lt;</a>");
			for(int i= startNavi; i<=endNavi; i++) {
				if(i==currentPage) {
					sb.append("<a href='/question/QuestionFarmPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' id='currentNavi'>"+i+"</a>");
				}else {
					sb.append("<a href='/question/QuestionFarmPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='otherNavi'>"+i+"</a>");
				}
			}
			if((currentPage+10)>pageTotalCount) {
				sb.append("<a href='/question/QuestionFarmPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
			}else {
				sb.append("<a href='/question/QuestionFarmPage.do?currentPage="+(currentPage+10)+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
			}
			sb.append("<a href='/question/QuestionFarmPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&gt;&gt;</a>");
			
			return sb.toString();
		}

		private int qFarmTotalCount(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("qFarm.qFarmTotalCount",map);
		}
		//농가 문의 리스트 공간 끝

		//글 쓰기
		public int questionFarmWrite(QuestionFarm qfarm) {
			// TODO Auto-generated method stub
			return sqlSession.insert("qFarm.questionFarmWrite", qfarm);
		}

		//글 조회
		public HashMap<String, Object> questionFarmView(int questionFarmNo) {
			// TODO Auto-generated method stub
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("qFarm", sqlSession.selectOne("qFarm.questionFarmView", questionFarmNo));
			map.put("qAnswer", sqlSession.selectOne("qFarm.questionFarmAnswerCheck",questionFarmNo));
			return map;
		}

		//글 수정
		public int questionFaemUpdate(QuestionFarm qfarm) {
			// TODO Auto-generated method stub
			return sqlSession.update("qFarm.questionFaemUpdate", qfarm);
		}

		public int questionFarmDelete(int questionFarmNo) {
			// TODO Auto-generated method stub
			return sqlSession.update("qFarm.questionFarmDelete",questionFarmNo);
		}
		
}
