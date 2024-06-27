package com.drink.ko.impl.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drink.ko.vo.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 글 등록
	public int insertNotice(NoticeVO vo) {
		return mybatis.insert("NoticeDAO.insertNotice", vo);
	}

	// 글 수정
	public int updateNotice(NoticeVO vo) {
		return mybatis.update("NoticeDAO.updateNotice", vo);
	}

	// 글 삭제
	public int deleteNotice(NoticeVO vo) {
		return mybatis.delete("NoticeDAO.deleteNotice", vo);
	}

	// 글상세 조회
	public NoticeVO getNotice(NoticeVO vo) {
		return mybatis.selectOne("NoticeDAO.getNotice", vo);
	}

	// 글목록 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return mybatis.selectList("NoticeDAO.getNoticeList", vo);
	}

	// 공지사항의 총 개수 조회
	public int getCount(NoticeVO vo) {
		return mybatis.selectOne("NoticeDAO.getCount", vo);
	}

	// 페이징 처리된 글 목록 조회
	public List<NoticeVO> noticeListPaging(NoticeVO vo) {
		return mybatis.selectList("NoticeDAO.getNoticeListPaging", vo);
	}

    // jsp파일을 만들때, 몇번째인지 설정하는 메소드
	public int getMaxNotice() {
		return mybatis.selectOne("NoticeDAO.getMaxNotice");
	}
	
    // 다음글, 이전글을 불러오는 메소드
	public NoticeVO getPrevNext(NoticeVO vo) {
	    return mybatis.selectOne("NoticeDAO.getPrevNext", vo);
	}	
    // 글 삭제시, not_no를 초기화 하는 메소드
	public int updateNot_no1(NoticeVO vo) {
		return mybatis.update("NoticeDAO.updateNot_no1", vo);
	}
	public int updateNot_no2(NoticeVO vo) {
		return mybatis.update("NoticeDAO.updateNot_no2", vo);
	}
}
