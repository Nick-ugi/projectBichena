package com.drink.ko.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProdVO {
	private int p_no;
	private String p_name;
	private String p_desc;
	private int p_price;
	private String p_made;
	private String p_type;
	private int p_dgr;
	private String p_sw;
	private String p_su;
	private String p_sp;
	private String p_mat;
	private String p_cap;
	private int p_stock;
	private int p_maxstock;
	private String p_img; // pthumbnail
	private String editfile; // pfilename // 에디터로 생성된 jsp파일이름
	private String edithtml; // pdetail // 에디터로 쓴 내용의 html형식 문자열
	
	private String o_stock; //개별주문수량
	
	private int rnum;

	private MultipartFile uploadFile; // pthumbnailimg
	
	// 페이징 처리를 위한 변수
	private int currPageNo; // 현재 페이지 번호
	private int sizePerPage = 16; // 한 페이지당 보여질 리스트 개수
	private int totalCnt; // 전체 목록 개수
	private int pageCnt; // 전체 페이지 개수
	private int startList; // 게시판 시작 번호
	private int range = 1; // 페이지 범위. 1 : 1~5 2: 6~10 ...
	private int pageSize = 5; // 한 페이지 범위에 보여질 페이지 개수
	private int startPage; // 각 페이지 범위의 시작 번호
	private int endPage; // 각 페이지 범위 끝 번호
	private boolean prev; // 이전 페이지 여부
	private boolean next; // 다음 페이지 여부
	
	// 필터처리한 변수들
	private String type;
	private String sweet;
	private String acidity;
	private String carbonic;
	private String ingredient;
	
	// 검색을 위한 변수
	private String searchKeyword;
	private String searchCondition;

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_desc() {
		return p_desc;
	}

	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_made() {
		return p_made;
	}

	public void setP_made(String p_made) {
		this.p_made = p_made;
	}

	public String getP_type() {
		return p_type;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}

	public int getP_dgr() {
		return p_dgr;
	}

	public void setP_dgr(int p_dgr) {
		this.p_dgr = p_dgr;
	}

	public String getP_sw() {
		return p_sw;
	}

	public void setP_sw(String p_sw) {
		this.p_sw = p_sw;
	}

	public String getP_su() {
		return p_su;
	}

	public void setP_su(String p_su) {
		this.p_su = p_su;
	}

	public String getP_sp() {
		return p_sp;
	}

	public void setP_sp(String p_sp) {
		this.p_sp = p_sp;
	}

	public String getP_mat() {
		return p_mat;
	}

	public void setP_mat(String p_mat) {
		this.p_mat = p_mat;
	}

	public String getP_cap() {
		return p_cap;
	}

	public void setP_cap(String p_cap) {
		this.p_cap = p_cap;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getEditfile() {
		return editfile;
	}

	public void setEditfile(String editfile) {
		this.editfile = editfile;
	}

	public String getEdithtml() {
		return edithtml;
	}

	public void setEdithtml(String edithtml) {
		this.edithtml = edithtml;
	}
	
	public String getO_stock() {
		return o_stock;
	}

	public void setO_stock(String o_stock) {
		this.o_stock = o_stock;
	}

	public int getP_maxstock() {
		return p_maxstock;
	}

	public void setP_maxstock(int p_maxstock) {
		this.p_maxstock = p_maxstock;
	}

	@Override
	public String toString() {
		return "ProdVO [p_no=" + p_no + ", p_name=" + p_name + ", p_price=" + p_price + ", p_img=" + p_img
				+ ", editfile=" + editfile + ", p_desc=" + p_desc + ", p_made=" + p_made + ", p_type=" + p_type
				+ ", p_dgr=" + p_dgr + ", p_sw=" + p_sw + ", p_su=" + p_su + ", p_sp=" + p_sp + ", p_mat=" + p_mat
				+ ", p_cap=" + p_cap + ", p_maxstock=" + p_maxstock + ", p_stock=" + p_stock + ", uploadFile=" + uploadFile + "]";
	}
	
	public int getRnum() {
		return rnum;
	}
	
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public int getCurrPageNo() {
		return currPageNo;
	}

	public void setCurrPageNo(int currPageNo) {
		this.currPageNo = currPageNo;
	}

	public int getSizePerPage() {
		return sizePerPage;
	}

	public void setSizePerPage(int sizePerPage) {
		this.sizePerPage = sizePerPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	// 페이지 정보 설정 메서드
	public void pageInfo(int currPageNo, int range, int totalCnt) { // 2, 1, 52
		this.currPageNo = currPageNo;
		this.range = range;
		this.totalCnt = totalCnt;

		// 전체 페이지 수
		if (totalCnt % sizePerPage == 0) {
			this.pageCnt = totalCnt / sizePerPage;
		} else {
			this.pageCnt = totalCnt / sizePerPage + 1;
		}
		// 시작 페이지
		this.startPage = (range - 1) * pageSize + 1;
		// 끝 페이지
		this.endPage = range * pageSize;
		// 게시판 시작 번호
		this.startList = (currPageNo - 1) * sizePerPage;
		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;
		// 다음 버튼 상태
		this.next = endPage >= pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSweet() {
		return sweet;
	}

	public void setSweet(String sweet) {
		this.sweet = sweet;
	}

	public String getAcidity() {
		return acidity;
	}

	public void setAcidity(String acidity) {
		this.acidity = acidity;
	}

	public String getCarbonic() {
		return carbonic;
	}

	public void setCarbonic(String carbonic) {
		this.carbonic = carbonic;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	
	
}
