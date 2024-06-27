package com.drink.ko.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.NoticeService;
import com.drink.ko.impl.dao.NoticeDAO;
import com.drink.ko.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	// 글 등록
	@Override
	public int insertNotice(NoticeVO vo) {
		return noticeDAO.insertNotice(vo);
	}

	// 글 수정
	public int updateNotice(NoticeVO vo) {
		return noticeDAO.updateNotice(vo);
	}

	// 글 삭제
	public int deleteNotice(NoticeVO vo) {
		return noticeDAO.deleteNotice(vo);
	}

	// 글상세 조회
	public NoticeVO getNotice(NoticeVO vo) {
		return noticeDAO.getNotice(vo);
	}

	// 글목록 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return noticeDAO.getNoticeList(vo);
	}

	// 페이징 처리된 글 목록 조회
	@Override
	public List<NoticeVO> noticeListPaging(NoticeVO vo) {
		return noticeDAO.noticeListPaging(vo);
	}

	// 전체 글 수 조회
	@Override
	public int noticeTotalCnt(NoticeVO vo) {
		return noticeDAO.getCount(vo);
	}

    // jsp파일을 만들때, 몇번째인지 설정하는 메소드
    @Override
    public int getMaxNotice() {
    	return noticeDAO.getMaxNotice();
    }
    
    // 다음글, 이전글을 불러오는 메소드
    @Override
    public NoticeVO getPrevNext(NoticeVO vo) {
        return noticeDAO.getPrevNext(vo);
    }
    
    // 글 삭제시, not_no를 초기화 하는 메소드
    public int updateNot_no1(NoticeVO vo) {
    	return noticeDAO.updateNot_no1(vo);
    }
    
    public int updateNot_no2(NoticeVO vo) {
    	return noticeDAO.updateNot_no2(vo);
    }
}
