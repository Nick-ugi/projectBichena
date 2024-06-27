package com.drink.ko.impl.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drink.ko.vo.FaqVO;

@Repository
public class FaqDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 글 등록
	public int insertFaq(FaqVO vo) {
		return mybatis.insert("FaqDAO.insertFaq", vo);
	}

	// 글 수정
	public int updateFaq(FaqVO vo) {
		return mybatis.update("FaqDAO.updateFaq", vo);
	}

	// 글 삭제
	public int deleteFaq(FaqVO vo) {
		return mybatis.delete("FaqDAO.deleteFaq", vo);
	}

	// 글상세 조회
	public FaqVO getFaq(FaqVO vo) {
		return mybatis.selectOne("FaqDAO.getFaq", vo);
	}

	// 글목록 조회
	public List<FaqVO> getFaqList(FaqVO vo) {
		return mybatis.selectList("FaqDAO.getFaqList", vo);
	}

	// 공지사항의 총 개수 조회
	public int getCount(FaqVO vo) {
		return mybatis.selectOne("FaqDAO.getCount", vo);
	}

	// 페이징 처리된 글 목록 조회
	public List<FaqVO> faqListPaging(FaqVO vo) {
		return mybatis.selectList("FaqDAO.getFaqListPaging", vo);
	}

	// 글 삭제시 not_no를 업데이트 하는 메소드
	public int updateFaq_no1(FaqVO vo) {
		return mybatis.update("FaqDAO.updateFaq_no1", vo);
	}
	public int updateFaq_no2(FaqVO vo) {
		return mybatis.update("FaqDAO.updateFaq_no2", vo);
	}	 
}
