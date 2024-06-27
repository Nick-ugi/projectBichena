package com.drink.ko.impl.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drink.ko.vo.ProdVO;

@Repository
public class ProdDAO {
	@Autowired
	SqlSessionTemplate mybatis;

	public ProdVO prodOne(String p_no) {
		return mybatis.selectOne("ProdDAO.prodOne", p_no);
	}

	public List<ProdVO> prodList(ProdVO vo) {
		return mybatis.selectList("ProdDAO.prodList", vo);
	}

	public int prodTotalCnt(ProdVO vo) {
		return mybatis.selectOne("ProdDAO.prodTotalCnt", vo);
	}

	public int getPnoMaxNum() {
		return mybatis.selectOne("ProdDAO.getPnoMaxNum");
	}

	public int insertProduct(ProdVO vo) {
		return mybatis.insert("ProdDAO.insertProduct", vo);
	}

	public int updateProduct(ProdVO vo) { // 셀렉트 치고 수정버튼 누르면 올 것
		return mybatis.update("ProdDAO.updateProduct", vo);
	}

	public int deleteProduct(String p_no) {
		return mybatis.delete("ProdDAO.deleteProduct", p_no);
	}

	public ProdVO prodStock(int p_no) {
		return mybatis.selectOne("ProdDAO.prodStock", p_no);
	}

	public List<ProdVO> mainPageSlideListJeungryuju(ProdVO vo) {
		return mybatis.selectList("ProdDAO.mainPageSlideListJeungryuju", vo);
	}

	public List<ProdVO> mainPageSlideListTakju(ProdVO vo) {
		return mybatis.selectList("ProdDAO.mainPageSlideListTakju", vo);
	}

	public List<ProdVO> mainPageSlideListGwasilju(ProdVO vo) {
		return mybatis.selectList("ProdDAO.mainPageSlideListGwasilju", vo);
	}

	public List<ProdVO> mainPageSlideListChunju(ProdVO vo) {
		return mybatis.selectList("ProdDAO.mainPageSlideListChunju", vo);
	}
	
	public int stockUpdate(ProdVO vo) {
		return mybatis.update("ProdDAO.stockUpdate", vo);
		
	}

}
