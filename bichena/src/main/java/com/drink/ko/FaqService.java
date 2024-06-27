package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.FaqVO;

public interface FaqService {
	// 글 등록
	public int insertFaq(FaqVO vo);

	// 글 수정
	public int updateFaq(FaqVO vo);

	// 글 삭제
	public int deleteFaq(FaqVO vo);

	// 글상세 조회
	public FaqVO getFaq(FaqVO vo);

	// 페이징 처리된 글 목록 조회
	public List<FaqVO> faqListPaging(FaqVO vo);

	// 전체 글 수 조회
	public int faqTotalCnt(FaqVO vo);
	
    // 글 삭제시 faq_no 업데이트
    public int updateFaq_no1(FaqVO vo);
    public int updateFaq_no2(FaqVO vo);
    
}
