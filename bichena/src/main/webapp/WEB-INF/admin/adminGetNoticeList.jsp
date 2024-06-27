<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("userID") == null) {%>
<script>
location.href="main.ko";
</script>
<%}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>공지사항</title>
<style>
/* 어드민 페이징처리 스타일 통일사항 */
.list-pagination {
	display: flex!important;
	justify-content: center;
	margin-bottom: 60px!important;
	margin-top: 20px!important;
}
page-link:hover {
    z-index: 2;
    color: #005930!important!important;
    text-decoration: none!important;
    background-color: #e9ecef!important;
    border-color: #dee2e6!important;
    border-radios: 5px!important;
}
.page-link:focus {
    box-shadow: 0 0 0 .2rem rgb(23 147 9 / 25%)!important;
    color: #005930!important;
    border-radius: 5px!important;
}

.page-link {
    padding: .5rem .75rem!important;
    margin-left: -1px;
    line-height: 1.25!important;
    color: #005930!important;
    background-color: #fff!important;
    border: none!important;
}

.page-item.active .page-link {
    background-color: #005930!important;
    border-color: #005930!important;
    border-radius: 5px!important;
    color:white!important;
}
.findMem{
	text-align: center;
	margin-top: 30px;
	display: right;
}
/* 검색바통일사항 */
.searchForm {
    margin-bottom: 20px;
    text-align: center;
    margin-top: 30px;
    display: flex;
    justify-content: center;
}

.searchForm select,
.searchForm input[type="text"],
.searchForm button {
    height: 40px;
    border: 1px solid #000;
    border-radius: 4px;
    margin: 10px 10px;;
}

.searchForm select {
    width: 105px;
}

.searchForm input[type="text"] {
    width: 230px;
}

.searchForm button {
    background-color: #005930;
    color: #fff;
    border: none;
    cursor: pointer;
}

.searchForm button:hover {
    background-color: #B8B388;
}

/* 테이블구조 CSS */
table.table {
    width: 100%;
    margin-bottom: 16px;
    border-collapse: collapse;
    table-layout: fixed;
}

 table.table th { 
     padding: 12px; 
     text-align: center; 
     border-bottom: 1.5px solid #000;
} 

.table>tbody>tr>td{
    padding: 15px 10px 15px 20px!important;
    vertical-align: middle;
    border-top: 1px solid #ddd;
}

 table.table tbody { 
     border-top: 2px solid #dee2e6; 
 } 
 
 .table>tbody>tr>td {
    padding: 15px 8px;
    line-height: 1.4;
    }
 
.responsiveTd {
	text-align: center;
	
}

.responsiveSpan {
	justify-content: right;
	display:none;
	font-size: 12px;
	color: gray;
}

.table_title {
	text-align: left;
	padding-left:30px;
}

.divTable{
   margin-top: 30px;
}
#footer {
    text-align: right;
    padding-right: 15px;
	display: none;
}
/* 반응형 할때 */
@media screen and (max-width: 720px) {
	.responsiveTd {
		display: none;
	}
	.responsiveSpan {
		display: flex!important;
		justify-content: right;
	}
	table.table thead {
		display: none;
	}
	.searchForm input[type="text"] {
    	width: 200px;
	}
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div class="container">
	<h2 style="margin-top:30px; font-weight:bold; font-size: 24px;">공지사항</h2>
	<div class="divTable" >
		<table class="table">
			<thead>
				<tr>
					<th class="responsiveTd" style="width: 15%;">번호</th>
					<th>제목</th>
					<th class="responsiveTd" style="width: 20%;">작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList}" var="notice">
					<tr onclick="selTr(${notice.not_no})" style="cursor: pointer; padding: 10px;">
						<td class="responsiveTd">${notice.not_no}</td>
						<td class="table_title">${notice.not_title}<br>
							<span class="responsiveSpan">
								<img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/sub_date_new.png" alt="시간">${notice.not_date}
							</span>
						</td>
						<td class="responsiveTd">${notice.not_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div id="footer" style="display: none">
			<button type="button" class="btn btn-primary btn-sm conWrite">글쓰기</button>
		</div>

		<!-- 검색 -->
	    <div class="searchDiv">
		    <form class="searchForm" action="getNoticeList.ko" method="post">
		        <select id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
		            <c:choose>
		                <c:when test="${condition == 'TITLE'}">
		                    <option value="${conditionMap['제목']}">제목</option>
		                    <option value="${conditionMap['내용']}">내용</option>
		                </c:when>
		                <c:when test="${condition == 'CONTENT'}">
		                    <option value="${conditionMap['내용']}">내용</option>
		                    <option value="${conditionMap['제목']}">제목</option>
		                </c:when>
		                <c:otherwise>
		                    <option value="${conditionMap['제목']}">제목</option>
		                    <option value="${conditionMap['내용']}">내용</option>
		                </c:otherwise>
		            </c:choose>
		        </select>
		        <c:choose>
		           <c:when test="${keyword == ''}">
		              <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
		           </c:when>
		           <c:otherwise>
		              <input type="text" name="searchKeyword" value ="${keyword}">
		           </c:otherwise>
		        </c:choose>
				<button type="submit" class="btn btn-primary btn-sm">검색</button>
			</form>
	    </div>

		<!-- 페이징 처리 -->
			<ul class="pagination list-pagination">
				<c:choose>
					<c:when test="${pagination.currPageNo == 1}">
						<!-- 현재 페이지가 첫 번째 페이지인 경우 -->
						<li class="page-item"><a class="page-link">이전</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
		           			 <a class="page-link" href="getNoticeList.ko?currPageNo=${pagination.currPageNo - 1}&searchKeyword=${keyword}&searchCondition=${condition}">이전</a>
		         		</li>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
					<c:choose>
						<c:when test="${page eq pagination.currPageNo}">
							<li class="page-item active"><a class="page-link">${page}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
		           			 	<a class="page-link" href="getNoticeList.ko?currPageNo=${page}&searchKeyword=${keyword}&searchCondition=${condition}">${page}</a>
		         			</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
		
				<c:choose>
					<c:when test="${pagination.currPageNo == pagination.pageCnt or pagination.pageCnt <= 1}">
						<!-- 현재 페이지가 마지막 페이지인 경우 -->
						<li class="page-item"><a class="page-link">다음</a></li>
					</c:when>
					<c:otherwise>
						<!-- 다음 페이지로 이동하는 링크 -->
							<li class="page-item">
		           			 	<a class="page-link" href="getNoticeList.ko?currPageNo=${pagination.currPageNo + 1}&searchKeyword=${keyword}&searchCondition=${condition}">다음</a>
		         			</li>
					</c:otherwise>
				</c:choose>
			</ul>


		<br> <br>
	</div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
       var userID = "${userID}";
       var userNO = "${userNO}";

       if (userID === 'admin') {
           document.getElementById("footer").style.display = "block";
       }
   });

function selTr(val){
	location.href = "adminGetNotice.ko?not_no="+val;
}

//글쓰기 버튼 클릭 시 동작할 코드
$(".conWrite").click(function(){
	location.href = "writeNotice.ko";
});
</script>
</body>
</html>
