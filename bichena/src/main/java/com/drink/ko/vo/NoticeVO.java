package com.drink.ko.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int not_no;
	private String not_title;
	private String not_content; //db에 저장되는 html형식의 데이터 넣기
	private String not_date;	// 자동으로 sysdate
	private String filename;
	
	//파일 업로드를 위한 변수
//	private MultipartFile uploadFile;
	
	//검색을 위한 변수
	private String searchCondition;
	private String searchKeyword;
	
	//페이징 처리를 위한 변수
	private int currPageNo;   // 현재 페이지 번호
    private int sizePerPage = 10; // 한 페이지당 보여질 리스트 개수
    private int totalCnt; // 전체 목록 개수
    private int pageCnt; // 전체 페이지 개수

    private int startList; // 게시판 시작 번호
    private int range = 1; // 페이지 범위.    1 : 1~5     2: 6~10   ...
    private int pageSize = 5; // 한 페이지 범위에 보여질 페이지 개수
    private int startPage; // 각 페이지 범위의 시작 번호
    private int endPage; // 각 페이지 범위 끝 번호

    private boolean prev; // 이전 페이지 여부
    private boolean next; // 다음 페이지 여부

    private int prevNum; //이전글의 글번호
	private int nextNum; //다음글의 글번호
	
	private String prevTitle; //이전글의 제목
	private String nextTitle; //다음글의 제목
	
	private String prevDate;
	private String nextDate;
	
	
	public int getNot_no() {
		return not_no;
	}
	public void setNot_no(int not_no) {
		this.not_no = not_no;
	}
	public String getNot_title() {
		return not_title;
	}
	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}
	public String getNot_content() {
		return not_content;
	}
	public void setNot_content(String not_content) {
		this.not_content = not_content;
	}
	public String getNot_date() {
		return not_date;
	}
	public void setNot_date(String not_date) {
		this.not_date = not_date;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
//	@Override
//	public String toString() {
//		return "NoticeVO [not_no=" + not_no + ", not_title=" + not_title + ", not_content=" + not_content
//				+ ", not_date=" + not_date + ", filename" + filename
//				+ "]";
//	}
	
//	public MultipartFile getUploadFile() {
//		return uploadFile;
//	}
//	public void setUploadFile(MultipartFile uploadFile) {
//		this.uploadFile = uploadFile;
//	}
	@Override
	public String toString() {
		return "NoticeVO [not_no=" + not_no + ", not_title=" + not_title + ", not_date=" + not_date + ", prevNum="
				+ prevNum + ", nextNum=" + nextNum + ", prevTitle=" + prevTitle + ", nextTitle=" + nextTitle + "]";
	}
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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
	
    public int getPrevNum() {
		return prevNum;
	}
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	public int getNextNum() {
		return nextNum;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
	public String getPrevTitle() {
		return prevTitle;
	}
	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	public String getPrevDate() {
		return prevDate;
	}
	public void setPrevDate(String prevDate) {
		this.prevDate = prevDate;
	}
	public String getNextDate() {
		return nextDate;
	}
	public void setNextDate(String nextDate) {
		this.nextDate = nextDate;
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
	
	
	
	
}
