<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath }" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view.jsp</title>
<style>
div.view_btn{
width:50%;
margin: 10px auto;
text-align: right;
}
div.view_btn button:nth-child(1) {
		background-color:  blue;
		color: white;
		padding : 10px;
		margin: 10px;
	}
	div.view_btn button:nth-child(2) {
		background-color:  gray;
		color: white;
		padding : 10px;
		margin: 10px;
	}
table{
	border-collapse: collapse;
	width: 50%;
	margin: 15px auto;
}
td, th {
	font-size : 25px;
	border:1px solid green;
	padding : 5px;
	text-align : center;
	
}

</style>
<script>
	document.addEventListener("DOMContentLoaded", function(ev){
		document.querySelector("div.view_btn")
		.addEventListener("click", function(ev){
			let className = ev.target.className;
			if(className == "btn_update"){
				document.location.href="${rootPath}/list/update?li_seq=" + ${Li.li_seq}
			} else if(className == "btn_delete"){
				if(confirm("일정을 삭제합니다")){
					document.location.href="${rootPath}/list/delete?li_seq=" + ${Li.li_seq}
				}
			}
				
		})
	})
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include_title.jsp" %>
<table>
	<tr><th>날짜</th><td>${Li.li_date}</td></tr>
	<tr><th>시간</th><td>${Li.li_time}</td></tr>
	<tr><th>장소</th><td>${Li.li_place}</td></tr>
	<tr><th>일정</th><td>${Li.li_content}</td></tr>
</table>

<div class="view_btn">
	<button class="btn_update">수정하기</button>
	<button class="btn_delete">삭제하기</button>
</div>
</body>
</html>