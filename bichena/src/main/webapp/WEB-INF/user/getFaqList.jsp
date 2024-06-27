<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>FAQ</title>
<style>
table.table>tbody>tr>td, table.table>tbody>tr>th, table th {
    text-align: center;
    vertical-align: middle;
}
table {
    text-align: center;
}
.accordionFaq {
	max-width: 100%;
	margin: auto;
}
.accordionFaq-item {
	border-bottom: 1px solid #ddd;
}
.accordionFaq-header {
	padding: 10px;
	cursor: pointer;
}
.accordionFaq-body {
	display: none;
	padding: 10px;
}
/* 페이징처리 스타일 통일사항 */
.list-pagination {
	display: flex;
	justify-content: center;
	margin-bottom: 60px;
	margin-top: 20px;
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
    margin: 10px 5px;;
}

.searchForm select {
    width: 60px;
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
@media screen and (max-width: 767px) {
	.responsiveTd {
		display: none;
	}
	.searchForm input[type="text"] {
    	width: 200px;
	}
}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
		<h2 style="margin-top:30px; font-weight:bold; font-size: 24px;">FAQ</h2>

	
<table class="table table">
	<thead>
		<tr>
			<th class="responsiveTd" style="width: 10%;">번호</th>
			<th style="width: 90%; text-align: center;">제목</th>
		</tr>
	</thead>
</table>    
	<!-- 아코디언 시작 부분 -->
<div class="accordionFaq">
	<c:forEach items="${faqList}" var="faq">
		<div class="accordionFaq-item">
			<div class="accordionFaq-header">
				<table style="width: 100%">
					<tbody>
					<tr>
						<td class="responsiveTd" style="width: 10%;">${faq.faq_no}</td>
						<th style="width: 90%; text-align: left; padding:5px 30px;">${faq.faq_title}</th>
					</tr>
					</tbody>
				</table>   
			</div>
			<div class="accordionFaq-body" style="padding: 20px 50px; line-height:200%;">
			${faq.faq_content}
			</div>
		</div>
	</c:forEach> 
</div><!-- 아코디언 종료 -->  

    <div class="searchDiv">
		    <form class="searchForm" action="getFaqList.ko" method="post">
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
           			 <a class="page-link" href="getFaqList.ko?currPageNo=${pagination.currPageNo - 1}&searchKeyword=${keyword}&searchCondition=${condition}">이전</a>
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
           			 	<a class="page-link" href="getFaqList.ko?currPageNo=${page}&searchKeyword=${keyword}&searchCondition=${condition}">${page}</a>
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
           			 	<a class="page-link" href="getFaqList.ko?currPageNo=${pagination.currPageNo + 1}&searchKeyword=${keyword}&searchCondition=${condition}">다음</a>
         			</li>
			</c:otherwise>
		</c:choose>
	</ul>	
	
	
	
	
	<br>
	<br>
</div>	
<%@ include file="../../common/footer.jsp"%>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const accordionItems = document.querySelectorAll('.accordionFaq-item');

    accordionItems.forEach(item => {
      const header = item.querySelector('.accordionFaq-header');

      header.addEventListener('click', function() {
        const body = this.nextElementSibling;

        // Close all other accordion bodies
        accordionItems.forEach(otherItem => {
          const otherBody = otherItem.querySelector('.accordionFaq-body');
          if (otherBody !== body) {
            otherBody.style.display = 'none';
            otherItem.querySelector('.accordionFaq-header').style.backgroundColor = ''; 
          }
        });

        if (body.style.display === 'block') {
          body.style.display = 'none';
          this.style.backgroundColor = ''; 
        } else {
          body.style.display = 'block';
          this.style.backgroundColor = '#d9ccbb'; 
        }
      });
    });
  });
</script>
</body>
</html>
