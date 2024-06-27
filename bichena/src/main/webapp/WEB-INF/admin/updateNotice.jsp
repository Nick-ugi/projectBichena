<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
div.container {
	width:80%;
}

div.insert_container {
    border-radius: 10px;
    box-shadow: 0 0 10px #ccc;
}
div.insert_container, h3 {
	width: 800px;
	margin: 0 auto;
    margin-top: 30px;
}

button {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	cursor: pointer;
}
#conList {
	background-color: gray;
	border-color: gray;
}

  button:hover {
    background-color: #0056b3;
  }

  input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    resize: none;
    outline: none;
  }

  textarea {
	width: 100%;
    height: 200px;
    overflow-y: auto;
  }
/* 내가만든 쿠키 */
.insert_table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 10px 30px;
}
.insert_title {
	vertical-align:top;
	padding-top: 20px;
	text-align: center;
}
.buttons {
	float: right;
    margin-right: 20px;
    margin-top: 10px;
}

.se2_inputarea img {
	width: 100%;
}
/* 반응형 할때 */
@media screen and (max-width: 960px) {
	div.insert_container, h3 {
		width: 626px;
		}
	div.container {
		width: 100%;
	}
@media screen and (max-width: 720px) {
	div.insert_container, h3 {
		width: 512px;
		}
	td.insert_title {
		display: none;
	}
}
@media screen and (max-width: 564px) {
		div.insert_container, h3 {
		width: 418px;
		}
}
@media screen and (max-width: 470px) {
		body {
			padding: 0;
			margin: 0!important;
		}
		div.container {
			padding: 0;
		}	
}
@media screen and (max-width: 430px) {
		div.insert_container, h3 {
		width: 100%;
		}
</style>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div>
<%@ include file="../../updateNotice.jsp" %>  
</div>
<script>
	$("#conList").click(function(){
		location.href = "getNoticeList.ko";
	});
</script>
</body>
</html>
