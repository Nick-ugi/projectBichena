package com.drink.ko.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.FaqService;
import com.drink.ko.impl.dao.FaqDAO;
import com.drink.ko.vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDAO faqDAO;

	// 글 등록
	@Override
	public int insertFaq(FaqVO vo) {
		return faqDAO.insertFaq(vo);
	}

	// 글 수정
	public int updateFaq(FaqVO vo) {
		return faqDAO.updateFaq(vo);
	}

	// 글 삭제
	public int deleteFaq(FaqVO vo) {
		return faqDAO.deleteFaq(vo);
	}

	// 글상세 조회
	public FaqVO getFaq(FaqVO vo) {
		return faqDAO.getFaq(vo);
	}

	// 글목록 조회
	public List<FaqVO> getFaqList(FaqVO vo) {
		return faqDAO.getFaqList(vo);
	}

	// 페이징 처리된 글 목록 조회
	@Override
	public List<FaqVO> faqListPaging(FaqVO vo) {
		return faqDAO.faqListPaging(vo);
	}

	// 전체 글 수 조회
	@Override
	public int faqTotalCnt(FaqVO vo) {
		return faqDAO.getCount(vo);
	}
	
    // 삭제시 faq_no 업데이트
    public int updateFaq_no1(FaqVO vo) {
    	return faqDAO.updateFaq_no1(vo);
    }
    public int updateFaq_no2(FaqVO vo) {
    	return faqDAO.updateFaq_no2(vo);
    }
}
