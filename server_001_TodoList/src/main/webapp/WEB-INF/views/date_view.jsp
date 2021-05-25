<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>date_view</title>
<%@ include file="/WEB-INF/views/include_title.jsp" %>
</head>
<body>
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