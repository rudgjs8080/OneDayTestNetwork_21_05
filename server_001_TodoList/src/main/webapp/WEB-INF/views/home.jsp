<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		document.querySelector("table#list")
		.addEventListener("click", function(ev){
			let tag_name = ev.target.tagName;
			// alert(tag_name)
			if(tag_name == "TD"){
				let li_seq = ev.target.closest("TR").dataset.seq;
				
				document.location.href="${rootPath}/list/view?li_seq=" + li_seq
			}
		})
	})
</script>
<style>

table{
	border-collapse: collapse;
	width: 50%;
	margin: 15px auto;
}
td, th {
	border:1px solid green;
	padding : 5px;
	text-align : center;
	
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include_title.jsp" %>
	<a href="${rootPath }/list/insert">일정추가</a>
	
<section>
	<table id="list">
		<tr>
			<th>번호</th>
			<th>날짜</th>
			<th>시간</th>
			<th>장소</th>
			<th>할 일</th>
		</tr>
		<c:forEach items="${LiList}" var="Li" varStatus="index">
			<tr data-seq="${Li.li_seq}">
				<td>${index.count}</td>
				<td>${Li.li_date}</td>
				<td>${Li.li_time}</td>
				<td>${Li.li_place}</td>
				<td>${Li.li_content}</td>
			</tr>
		</c:forEach>
	</table>
</section>
</body>
</html>