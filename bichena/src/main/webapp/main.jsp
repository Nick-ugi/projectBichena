<%@ include file="common/navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<c:set var="result" value='<%=request.getParameter("result")%>' />
<c:choose>
	<c:when test="${result eq '2'}">
		<script>
			alert('미성년자는 가입이 불가합니다.');
		</script>
	</c:when>
</c:choose>
<%
response.setHeader("cache-control", "no-cache");
response.setHeader("expires", "0");
response.setHeader("pragma", "no-cache");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Swiper demo</title>
<%
if (request.getParameter("err") != null && request.getParameter("err").equals("1")) {
%>
<script>
alert('관리자만 접근 가능합니다.');
</script>
<%
}
%>
<script>
history.replaceState({}, null, location.pathname);
</script>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<style>
::-webkit-scrollbar {
	display: none;
}
body{
overflow-x:hidden
}

.main-container {
	display: flex;
	align-items: center;
	flex-direction: column;
	max-width: 1440px;
}

.swiper-box {
	width: 100%;
	max-width: 1244px;
	margin: 0 auto 60px;
	font-weight: bold;
	position: relative;
	margin-top: 10px;
	margin-bottom:60px;
}

[class*="mySwiper"] {
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
	transition-property: transform;
	box-sizing: content-box;
}
.reviewSwiper {
	max-width:1140px;
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
	transition-property: transform;
	box-sizing: content-box;
}

.swiper-slide {
	flex-shrink: 1;
	width: 100%;
	height: 100%;
	position: relative;
	transition-property: transform;
	text-align: center;
	font-size: 18px;
	background: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
}

.swiper-slide-imagewrapper {
	width: 100%;
	height: 100%;
	position: relative;
	overflow: hidden;
	border-radius: 10px;
}



.swiper-slide-imagewrapper img:hover {
	transform: scale(1.05);
	transition: transform 0.3s ease 0s;
}

.slide-image-span1 {
	box-sizing: border-box;
	display: block;
	overflow: hidden;
	width: initial;
	height: initial;
	background: none;
	opacity: 1;
	border: 0px;
	margin: 0px;
	padding: 0px;
	position: relative;
}

.slide-image-span2 {
	box-sizing: border-box;
	display: block;
	width: initial;
	height: initial;
	background: none;
	opacity: 1;
	border: 0px;
	margin: 0px;
	padding: 100% 0px 0px;
}

.slide-image {
	position: absolute;
	inset: 0px;
	box-sizing: border-box;
	padding: 0px;
	border: none;
	margin: auto;
	display: block;
	width: 0px;
	height: 0px;
	min-width: 100%;
	max-width: 100%;
	min-height: 100%;
	max-height: 100%;
	object-fit: cover;
	object-position: center bottom;
}

.swiper-link {
	color: #1890ff;
	text-decoration: none;
	background-color: transparent;
	outline: none;
	transition: color 0.3s;
}

.swiper-text {
	padding-top: 10px;
	flex-direction: column;
	justify-content: flex-start;
}

.button {
	margin: 0 10px;
	/* 좌우 여백 추가 */
}

.swiper-custom-button {
	cursor: pointer;
	border: none;
	outline: none;
	width: 50px;
	height: 50px;
	display: block;
	background-repeat: no-repeat;
	background-size: 100%;
	background-position: center center;
	background: transparent;
}

[class*="custom-prev"] {
	background-image: url(img/icon_prev_arrow_inactive.png);
}

[class*="custom-next"] {
	background-image: url(img/icon_next_arrow_inactive.png);
}

.slide-box {
	position: relative;
	max-width: 1240px;
}


.title {
	display: flex;
	padding-left: 20px
}

.title-box {
	display: flex;
	flex-direction: column;
	padding-top: 20;
}
.section{
	max-width: 1440px;
}
        

.section-title1 {
	max-width: 1440px;
    margin: 0;
	line-height: 0.5;
	display: flex;
    justify-content: space-between;
}
.moreproduct-box{
	display:flex;
	align-items:center;
	cursor:pointer;
}

.moreproduct{
    font-size:15px;
    font-weight:bold;
    color:#d4a035;

}

.moreproduct:hover {
	text-decoration: none;
	color:none;
}

.section-main-title, .section-sub-title, .swiper-productname,
	.swiper-productdesc, .swiper-reviewtext .moreproduct{
	font-family: 'Spoqa Han Sans Neo', 'sans-serif';
	font-optical-sizing: auto;
	font-weight: 700;
}
	
.section-main-title p {
	font-size: 22px;
}

.section-sub-title p {
	font-style: normal;
	font-size: 18px;
	color: #09814a;
}

.swiper-text {
	line-height: 1.5;
}
	
.swiper-productname {
	display:flex;
	font-size: 18px;
	font-weight: 400;
	line-height: 160%;
}


.swiper-productdesc {
	font-size: 14px;
	color: #e6b655
}

.swiper-price {
	font-size: 16px;
	font-weight: 600;
	color: #707070;
}

.title-picture {
	display: flex;
	align-items: center;
}

.title-picture img {
	width: 45px;
	margin-right: 10px;
}

.types {
	display: flex;
	justify-content: flex-start;
}

.sw, .su, .sp, .dgr {
	display: flex;
	margin-right: 10px;
	justify-content: center;
	font-size: 14px;
}

.sw>p:first-child {
	color: #1eb974;
	margin-right: 5px;
}

.su>p:first-child {
	color: #f18842;
	margin-right: 5px;
}

.sp>p:first-child {
	color: #1890ff;
	margin-right: 5px;
}
.dgr>p:first-child {
	color: dimgray;
	margin-right: 5px;
}

[class*="slidebutton-prev"],
[class*="slidebutton-next"]  {
	position: absolute;
	bottom: 160;
}
[class*="slidebutton-prev"]{
	left: -60;
}
[class*="slidebutton-next"]{
	right: -60;
}
.swiper-reviewtext{
	display:flex;
	flex-direction:column;
	align-items: center;
}
.swiper-productscore{
	margin-top:30px;
	color:DarkOrange;
}
.swiper-productrecontent{
	font-size:12px;
	margin-top: 20px;
    text-align: center;
    color: dimgray;
    font-size: 14px;
}
.swiper-reuser{
color: dimgray;
    margin-top: 30px;
    font-size: 16px;
}
.section-reviewtitle1{
    display: flex;
    justify-content: center;
    text-align: center;
}


      [class*="main-slider"] {
        width: 100%;
        overflow: hidden;
        position: relative;
        margin:0 auto;
      }

      .main-slider div {
        width: 100%;
        display: flex;
        justify-content: center;
      }

      .main-slider img {
     	width: 100%;
        display:block;
        min-width: 100%;
    max-width: 100%;
    min-height: 100%;
    max-height: 100%;
    object-fit: cover;
      }
      
	 .main-prev,.main-next{
		width:100px;
		height: 100px;
	    position: absolute;
	    cursor: pointer;
	    border: none;
	    outline: none;
	    display: block;
	    z-index: 999;
	    opacity:0.8
	    
    }
    
    .main-bannerbox-pc , .main-bannerbox-mo{
      position:relative;
      margin-bottom:60px
     }
      
    
    .main-prev{	
	top: 60%;
    left: 10%;
    transform: translate(20%, -50%);
    }
    
    .main-next{
    	top: 60%;
    right: 10%;
    transform: translate(20%, -50%);
    }
    
    
    .main-bannerbox-mo {
    display: none; /* 기본적으로 숨김 */
}

.main-bannerbox-pc {
    display: block; /* 기본적으로 표시 */
}
    
    [class*="main-custom-"]
    {width: 60px;
    height: 60px;
    background-repeat: no-repeat;
    background-size: contain;
    border: none;
    background-color: unset;}
    
    
    
      .main-custom-prev{
	background-image: url(img/icon_prev_arrow_active.png);
	
      }
      .main-custom-next{
      background-image: url(img/icon_next_arrow_active.png);
      }
      
      .slick-slide{
      height:fit-content;
      }
      
      /* 768px 이하일 때 */
@media screen and (max-width: 768px) {
    /* main-bannerbox-pc는 숨김 */
    .main-bannerbox-pc {
        display: none;
    }
    
    /* main-bannerbox-mo는 표시 */
    .main-bannerbox-mo {
        display: block;
    }
}
      
 	@media (max-width:652px){
 		
 	
      .section-sub-title p {
        font-size: 12px
        }
		.title-picture img  {
		width:40px;
		height:40px;
		margin-right:4px;
		}
      }
      
       	@media (max-width:412px){
		.title-picture img  {
		width:30px;
		height:30px;
		margin-right:4px;
		}
		.moreproduct-box a {
		font-size:12px}
      }
      
      @media (max-width:500px){
        .section-sub-title p {
        display:none;
        }
      }
	


     @media screen and (min-width:768px) and (max-width: 1249px){
      .main-slider img {
      min-height:300px;
      }
     }
     
      @media screen  and (max-width: 767px){
           .main-slider img {
      min-height:300px;
      }
     }
      
      @media (max-width: 1250px) {
      	.main-prev , .main-next {
      		display:none;
      	}
      	      [class*="main-custom-"] {
      	display:none;
      }
      [class*="slidebutton-prev"],
[class*="slidebutton-next"] {
display:none;
}
      
      
      }
      @media screen and (min-width:653px) and  (max-width:1250px){

      
      .section-main-title P{
       font-size:16px
      }
      .section-sub-title p{
      font-size:14px
      }
      .moreproduct {
      font-size:12px
      } 
      }

</style>
</head>

<body>

<div class="main-bannerbox-pc">
   <div class="main-prev">
	<button class="main-custom-prev"></button>
   </div>
	   <div class="slider main-slider">
	      <div>
	      <img src="img/banner1.png" alt="Image 1" />
	      </div>
	      <div>
	        <img src="img/banner2.png" alt="Image 2" />
	      </div>
	      <div>
	        <img src="img/banner3.png" alt="Image 3" />
	      </div>
     	  <div>
	        <img src="img/banner4.png" alt="Image 4" />
	      </div>
	      <div>
     	    <img src="img/banner5.png" alt="Image 5" />
	      </div>
	      <div>
	        <img src="img/banner6.png" alt="Image 6" />
	      </div>
	    </div>
	<div class="main-next">
	  <button class="main-custom-next"></button>
   	</div>
</div>

<div class="main-bannerbox-mo">
   <div class="main-prev">
	<button class="main-custom-prev"></button>
   </div>
	   <div class="slider main-slider">
	      <div>
	      <img src="img/mo1.png" alt="Image 1" />
	      </div>
	      <div>
	        <img src="img/mo2.png" alt="Image 2" />
	      </div>
	      <div>
	        <img src="img/mo3.png" alt="Image 3" />
	      </div>
    	  <div>
	      	<img src="img/mo4.png" alt="Image 4" />
	      </div>
	      <div>
	        <img src="img/mo5.png" alt="Image 5" />
	      </div>
	      <div>
	        <img src="img/mo6.png" alt="Image 6" />
	      </div>
	    </div>
	<div class="main-next">
	  <button class="main-custom-next"></button>
   	</div>
</div>


	<div class="container main-container">

		<!--과실주 섹션  -->
		<div class="container section">
			<div class="container section-title1">
				<div class="title">
					<div class="title-picture">
						<img src="img/navbar/icon_gwashilju.png">
					</div>
					<div class="title-box">
						<div class="section-main-title">
							<p>과실주</p>
						</div>
						<div class="section-sub-title">
							<p>"봄을 담다","과일을 담다","향기를 담다"</p>
						</div>
					</div>
				
				</div>
					<div class="moreproduct-box">
					<a class="moreproduct" href="prodList.ko?type=과실주">더보기 ></a>
					</div>
		
			</div>

			<div class="container slide-box">
				<div class="button slidebutton-prev">
					<button class="swiper-custom-button custom-prev"></button>
				</div>
				<div class="swiper-box">
					<swiper-container class="mySwiper" init="false">
					<c:forEach items="${mainPageSlideListGwasilju}" var="list">
						<swiper-slide>
						<div class="swiper-content">
							<a class="swiper-link" href="prodOne.ko?p_no=${list.p_no}">
								<div class="swiper-slide-imagewrapper">
									<span class="slide-image-span1"> <span
										class="slide-image-span2"></span> <img class="slide-image"
										src="img/${list.p_img}" />
									</span>
								</div>
							</a>
							<div class="swiper-text">
								<div class="swiper-productname">${list.p_name}</div>
								<div class="swiper-productdesc">${list.p_desc}</div>
								<div class="swiper-price p-price-comma">${list.p_price}</div>
								<div class="types">
										<div class="sw">
											<p>단맛</p>
											<p>${list.p_sw}</p>
										</div>
										<div class="su">
											<p>신맛</p>
											<p>${list.p_su}</p>
										</div>
										<div class="sp">
											<p>탄산</p>
											<p>${list.p_sp}</p>
										</div>
										<div class="dgr">
											<p>도수</p>
											<p>${list.p_dgr}도</p>
										</div>
									</div>
							</div>
						</div>
						</swiper-slide>
					</c:forEach>
					</swiper-container>
				</div>
				<div class="button slidebutton-next">
					<button class="swiper-custom-button custom-next"></button>
				</div>
			</div>
		</div>
		
		<!--청주 섹션  -->
		<div class="container section">
			<div class="container section-title1">
				<div class="title">
					<div class="title-picture">
						<img src="img/navbar/icon_cheongju.png">
					</div>
					<div class="title-box">
						<div class="section-main-title">
							<p>약·청 주</p>
						</div>
						<div class="section-sub-title">
							<p>"좋은사람, 좋은음식, 좋은자리에 더 좋은술과 함께"</p>
						</div>
					</div>
				</div>
				<div class="moreproduct-box">
				<a class="moreproduct" href="prodList.ko?type=약·청주">더보기 ></a>
				</div>
			</div>

			<div class="container slide-box">
				<div class="button slidebutton-prev2">
					<button class="swiper-custom-button custom-prev2"></button>
				</div>
				<div class="swiper-box">
					<swiper-container class="mySwiper2" init="false">
					<c:forEach items="${mainPageSlideListChunju}" var="list">
						<swiper-slide>
						<div class="swiper-content">
							<a class="swiper-link" href="prodOne.ko?p_no=${list.p_no}">
								<div class="swiper-slide-imagewrapper">
									<span class="slide-image-span1"> <span
										class="slide-image-span2"></span> <img class="slide-image"
										src="img/${list.p_img}" />
									</span>
								</div>
							</a>
							<div class="swiper-text">
								<div class="swiper-productname">${list.p_name}</div>
								<div class="swiper-productdesc">${list.p_desc }</div>
								<div class="swiper-price p-price-comma">${list.p_price}</div>
								<div class="types">
									<div class="sw">
										<p>단맛</p>
										<p>${list.p_sw}</p>
									</div>
									<div class="su">
										<p>신맛</p>
										<p>${list.p_su}</p>
									</div>
									<div class="sp">
										<p>탄산</p>
										<p>${list.p_sp}</p>
									</div>
									<div class="dgr">
										<p>도수</p>
										<p>${list.p_dgr}도</p>
									</div>
								</div>
							</div>
						</div>
						</swiper-slide>
					</c:forEach> </swiper-container>
				</div>
				<div class="button slidebutton-next2">
					<button class="swiper-custom-button custom-next2"></button>
				</div>
			</div>
		</div>
		
		<!--증류주 섹션  -->
		<div class="container section">
			<div class="container section-title1">
				<div class="title">
					<div class="title-picture">
						<img src="img/navbar/icon_jeungryuju.png">
					</div>
					<div class="title-box">
						<div class="section-main-title">
							<p>증류주</p>
						</div>
						<div class="section-sub-title">
							<p>"청아하고 깔끔하게", "오늘 하루도 수고하셨어요"</p>
						</div>
					</div>
				</div>
				<div class="moreproduct-box">
				<a class="moreproduct" href="prodList.ko?type=증류주">더보기 ></a>
				</div>
			</div>

			<div class="container slide-box">
				<div class="button slidebutton-prev3">
					<button class="swiper-custom-button custom-prev3"></button>
				</div>
				<div class="swiper-box">
					<swiper-container class="mySwiper3" init="false">
					<c:forEach items="${mainPageSlideListJeungryuju}" var="list">
						<swiper-slide>
						<div class="swiper-content">
							<a class="swiper-link" href="prodOne.ko?p_no=${list.p_no}">
								<div class="swiper-slide-imagewrapper">
									<span class="slide-image-span1"> <span
										class="slide-image-span2"></span> <img class="slide-image"
										src="img/${list.p_img}" />
									</span>
								</div>
							</a>
							<div class="swiper-text">
								<div class="swiper-productname">${list.p_name}</div>
								<div class="swiper-productdesc">${list.p_desc }</div>
								<div class="swiper-price p-price-comma">${list.p_price}</div>
								<div class="types">
									<div class="sw">
										<p>단맛</p>
										<p>${list.p_sw}</p>
									</div>
									<div class="su">
										<p>신맛</p>
										<p>${list.p_su}</p>
									</div>
									<div class="sp">
										<p>탄산</p>
										<p>${list.p_sp}</p>
									</div>
									<div class="dgr">
										<p>도수</p>
										<p>${list.p_dgr}도</p>
									</div>
								</div>
							</div>
						</div>
						</swiper-slide>
					</c:forEach> </swiper-container>
				</div>
				<div class="button slidebutton-next3">
					<button class="swiper-custom-button custom-next3"></button>
				</div>
			</div>
		</div>
		
		<!--탁주 섹션  -->
		<div class="container section">
			<div class="container section-title1">
				<div class="title">
					<div class="title-picture">
						<img src="img/navbar/icon_takju.png">
					</div>
					<div class="title-box">
						<div class="section-main-title">
							<p>탁주</p>
						</div>
						<div class="section-sub-title tak">
							<p>"지친 마음까지 어루만져 주는, 투박해서 따뜻한 위로."</p>
						</div>
					</div>
				</div>
				<div class="moreproduct-box">
				<a class="moreproduct" href="prodList.ko?type=탁주">더보기 ></a>
				</div>
			</div>

			<div class="container slide-box">
				<div class="button slidebutton-prev4">
					<button class="swiper-custom-button custom-prev4"></button>
				</div>
				<div class="swiper-box">
					<swiper-container class="mySwiper4" init="false">
					<c:forEach items="${mainPageSlideListTakju}" var="list">
						<swiper-slide>
						<div class="swiper-content">
							<a class="swiper-link" href="prodOne.ko?p_no=${list.p_no}">
								<div class="swiper-slide-imagewrapper">
									<span class="slide-image-span1"> <span
										class="slide-image-span2"></span> <img class="slide-image"
										src="img/${list.p_img}" />
									</span>
								</div>
							</a>
							<div class="swiper-text">
								<div class="swiper-productname">${list.p_name}</div>
								<div class="swiper-productdesc">${list.p_desc }</div>
								<div class="swiper-price p-price-comma">${list.p_price}</div>
								<div class="types">
									<div class="sw">
										<p>단맛</p>
										<p>${list.p_sw}</p>
									</div>
									<div class="su">
										<p>신맛</p>
										<p>${list.p_su}</p>
									</div>
									<div class="sp">
										<p>탄산</p>
										<p>${list.p_sp}</p>
									</div>
									<div class="dgr">
										<p>도수</p>
										<p>${list.p_dgr}도</p>
									</div>
								</div>
							</div>
						</div>
						</swiper-slide>
					</c:forEach> </swiper-container>
				</div>
				<div class="button slidebutton-next4">
					<button class="swiper-custom-button custom-next4"></button>
				</div>
			</div>
		</div>

		<!-- 리뷰 섹션  -->
		<div class="container section">
			<div class="container section-reviewtitle1">
				<div class="review-title">
					<div class="review-title-box">
						<div class="section-main-title">
							<p>베스트 리뷰</p>
						</div>
						<div class="section-sub-title">	
							<p>"고객분들은 어떤 술들을 드셨을까요?"</p>
						</div>
					</div>
				</div>
			</div>
			<div class="container slide-box">
				<div class="button slidebutton-prev4">
					<button class="swiper-custom-button custom-prevre"></button>
				</div>
				<div class="swiper-box">
					<swiper-container class="reviewSwiper" init="false" loop="true">
						<c:forEach items="${mainRevList}" var="list">
							<swiper-slide>
							<div class="swiper-content">
								<div class="swiper-link">
									<div class="swiper-slide-imagewrapper">
										<span class="slide-image-span1"> <span
											class="slide-image-span2"></span> <img class="slide-image"
											src="img/imgRev/${list.pr_img}" />
										</span>
									</div>
								</div>
								<div class="swiper-reviewtext">
									<div class="swiper-productscore" >
						            	<c:choose>
							            	<c:when test="${rev.pr_star eq '1' }">
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
												</svg>
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
												</svg>
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
												</svg>
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
												</svg>
							            	</c:when>
							            	<c:when test="${rev.pr_star eq '2' }">
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
												</svg>
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
												</svg>
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
												</svg>
							            	</c:when>
							            	<c:when test="${rev.pr_star eq '3' }">
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
												</svg>
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
												</svg>
							            	</c:when>
							            	<c:when test="${rev.pr_star eq '4' }">
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
							            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
												</svg>
							            	</c:when>
						            	<c:otherwise>
						            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
											  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
											  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
											  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
											  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
											  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
						            	</c:otherwise>
						            	</c:choose>
									</div>
									<div class="swiper-productrecontent">${list.pr_content}</div>
									<div class="swiper-reuser">${list.u_nick}</div>
								</div>
							</div>
							</swiper-slide>
						</c:forEach> 
					</swiper-container>
				</div>
				<div class="button slidebutton-next4">
					<button class="swiper-custom-button custom-nextre"></button>
				</div>
			</div>
		</div>
		
	

	
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
	<script src="resources/js/slide.js"></script>
</div>
<%@ include file="common/footer.jsp"%>
<script>

function priceCommaA(price) {
    let val = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return val;
}

window.onload = function(){ //쿼리스트링 지워주는 친구
	history.replaceState({}, null, location.pathname);
	let priceComma = document.getElementsByClassName("p-price-comma");
	for (let i = 0; i < priceComma.length; i++) {
		priceComma[i].innerText = priceCommaA(priceComma[i].innerText) + '원';
	}
};
</script>
</body>
</html>
