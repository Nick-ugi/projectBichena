package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.NoticeVO;

public interface NoticeService {
	// 글 등록
	public int insertNotice(NoticeVO vo);

	// 글 수정
	public int updateNotice(NoticeVO vo);

	// 글 삭제
	public int deleteNotice(NoticeVO vo);

	// 글상세 조회
	public NoticeVO getNotice(NoticeVO vo);

	// 페이징 처리된 글 목록 조회
	public List<NoticeVO> noticeListPaging(NoticeVO vo);

	// 전체 글 수 조회
	public int noticeTotalCnt(NoticeVO vo);
	
    // jsp파일을 만들때, 몇번째인지 설정하는 메소드
    public int getMaxNotice();
    
    // 다음글, 이전글을 불러오는 메소드
    public NoticeVO getPrevNext(NoticeVO vo);
    
    // 글 삭제시, not_no를 초기화 하는 메소드
    public int updateNot_no1(NoticeVO vo);
    public int updateNot_no2(NoticeVO vo);
}
