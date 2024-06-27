<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>상세보기</title>
<style>
div.container{
	width: 80%;
	margin: 0 auto;
}
.container_header {
	height: 50px;
	
}
.content_container {
	width: 876px;
	margin: 0 auto;
}

.content_title_wrapper {
	width: 100%;
	line-height: 1.3;
	border-top: 1px solid #7e7e7e;
	color: #333;
	font-size: 24px;
	background-color: #f9f9f9;
	word-break: break-all;
	font-weight: bold;
	padding: 25px 20px;
	margin-top: 0 !important;
}

.content_date_wrapper {
	width: 100%;
	height: 55px;
	line-height: 55px;
	border-top: 1px solid #e3e3e3;
	border-bottom: 1px solid #e3e3e3;
	text-align: right;
}

.content_date {
	padding-right: 25px;
}

.content_content_wrapper {
	margin: 25px;
    width: 100%;
    margin: 30px auto;
}

.back_btn {
	display: inline-block;
	font-size: 13px;
	color: #666;
	padding: 13px 11px;
	line-height: 1;
	border: 1px solid #e6e6e6;
	text-align: center;
	float: right;
	margin: 0 10px;
	background-color: white;
	width: 60px;
	cursor: pointer;
	border-radius: 10px;
}

.back_btn:hover {
	background-color: #d9ccbb;
	color: #ffffff;
}
/* 이전 다음글 */
.pn {
	text-align: center;
	padding: 15px 0;
}

table.preNext {
	width: 100%;
	margin: 100px auto;
	border-collapse: collapse;
}

td {
	border-top: 1px solid #777;
	border-bottom: 1px solid #777;
}

.preNextTitle {
	width: 70%;
}

.preNextDate {
	width: 15%;
	text-align: center;
	font-size: 15;
	color: #999;
}

.preNextLink {
	color: #666;
	text-decoration: none;
}

.preNextArrow {
	vertical-align: middle;
	padding-right: 3px;
}

.preNext_link:hover {
	cursor: pointer;
}

div.content_content img {
	max-width: 100%!important;
}

/* 반응형 할때 */
@media screen and (max-width: 1140px) {
	div.content_content img {
		max-width: 100%;
	} 
	.content_container {
		width: 800px;
	}
}
@media screen and (max-width: 960px) {
	div.container {
	    width: 100%;
	    margin: 0 auto;
	}
	.content_container {
		width: 680px;
	}
}
@media screen and (max-width: 720px) {
	.content_container {
		width: 500px;
	}
	.content_title_wrapper {
		font-size: large;
	}
	.preNext_link {
		display: none;
	}
	.preNextDate {
		display: none;
	}
	.preNextTitle {
		width: 90%;
	}
	h2 {
		font-size: x-large!important;

	}
	
}
@media screen and (max-width: 540px) {
	.content_container {
		width: 95%;
	}
	.btn_top {
		display: none;
	}
}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
	<div class="content_container">
		<div class="container_header">
			<h2>
				공지 사항
				<button id="conList" class="back_btn" type="button">목록</button>
			</h2>
		</div>

		<div class="content_title_wrapper">
			<span class="content_title">${notice.not_title}</span>
		</div>
		<div class="content_date_wrapper">
			<span class="content_date">${notice.not_date}</span>
		</div>
		<div class="content_content_wrapper">
			<div class="content_content" style="clear: both;">${notice.not_content }</div>
		</div>
		
		<!-- 이전 다음글 -->
		<table class="preNext">
			<tr>
				<td class="pn" onclick="goToPrevPage()">
					<img class="preNextArrow" src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/page_up.png" alt="이전글">
					<span class="preNext_link"> 이전글</span></td>
				<td class="preNextTitle"><c:choose>
						<c:when test="${prevNextNotice.prevNum == 0}">
							<span style="color: gray;">이전글이 없습니다.</span>
						</c:when>
						<c:otherwise>
							<a class="preNextLink" id="prevLink"
								href="getNotice.ko?not_no=${prevNextNotice.prevNum}">${prevNextNotice.prevTitle}</a>
						</c:otherwise>
					</c:choose></td>
				<td class="preNextDate"><c:choose>
						<c:when test="${prevNextNotice.prevNum != 0}">
							<span>
								<img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/sub_date_new.png" alt="시간">${prevNextNotice.prevDate}
							</span>
						</c:when>
						<c:otherwise>
							<span style="color: gray;">-</span>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr class="preNextContent">
				<td class="pn" onclick="goToNextPage()">
					<img class="preNextArrow" src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/page_down.png" alt="다음글">
					<span class="preNext_link"> 다음글</span>
				</td>
				<td class="preNextTitle"><c:choose>
						<c:when test="${prevNextNotice.nextNum == 0}">
							<span style="color: gray;">다음글이 없습니다.</span>
						</c:when>
						<c:otherwise>
							<a class="preNextLink" id="nextLink"
								href="getNotice.ko?not_no=${prevNextNotice.nextNum}">${prevNextNotice.nextTitle}</a>
						</c:otherwise>
					</c:choose>
				</td>
				<td class="preNextDate"><c:choose>
						<c:when test="${prevNextNotice.nextNum != 0}">
							<span><img
								src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/sub_date_new.png"
								alt="시간">${prevNextNotice.nextDate}</span>
						</c:when>
						<c:otherwise>
							<span style="color: gray;">-</span>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</div>
</div>
<%@ include file="../../common/footer.jsp"%>
<script>
$("#conList").click(function(){
	location.href = "getNoticeList.ko";
});

function goToPrevPage() {
	// 이전글 링크로 이동합니다.
	if ('${prevNextNotice.prevNum}' != 0) {
		window.location.href = "getNotice.ko?not_no=${prevNextNotice.prevNum}";
	}
}

function goToNextPage() {
	// 다음글 링크로 이동합니다.
	if ('${prevNextNotice.nextNum}' != 0) {
		window.location.href = "getNotice.ko?not_no=${prevNextNotice.nextNum}";
	}
}
</script>
</body>
</html>
