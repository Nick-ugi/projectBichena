package com.drink.ko.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.ProdService;
import com.drink.ko.impl.dao.ProdDAO;
import com.drink.ko.vo.ProdVO;

@Service
public class ProdServiceImpl implements ProdService {
	@Autowired
	private ProdDAO dao;

	@Override
	public ProdVO prodOne(String p_no) {
		return dao.prodOne(p_no);
	}

	@Override
	public List<ProdVO> prodList(ProdVO vo) {
		return dao.prodList(vo);
	}

	@Override
	public int prodTotalCnt(ProdVO vo) {
		return dao.prodTotalCnt(vo);
	}

	@Override
	public int getPnoMaxNum() {
		return dao.getPnoMaxNum();
	}

	@Override
	public int insertProduct(ProdVO vo) {
		return dao.insertProduct(vo);
	}

	@Override
	public int updateProduct(ProdVO vo) { // 셀렉트 치고 수정버튼 누르면 올 것
		return dao.updateProduct(vo);
	}

	@Override
	public int deleteProduct(String p_no) {
		return dao.deleteProduct(p_no);
	}

	@Override
	public ProdVO prodStock(int p_no) {
		return dao.prodStock(p_no);
	}

	@Override
	public List<ProdVO> mainPageSlideListTakju(ProdVO vo) {
		return dao.mainPageSlideListTakju(vo);
	}

	@Override
	public List<ProdVO> mainPageSlideListGwasilju(ProdVO vo) {
		return dao.mainPageSlideListGwasilju(vo);
	}

	@Override
	public List<ProdVO> mainPageSlideListChunju(ProdVO vo) {
		return dao.mainPageSlideListChunju(vo);
	}

	@Override
	public List<ProdVO> mainPageSlideListJeungryuju(ProdVO vo) {
		return dao.mainPageSlideListJeungryuju(vo);
	}

	@Override
	public int stockUpdate(ProdVO vo) {
		return dao.stockUpdate(vo);
	}

}
