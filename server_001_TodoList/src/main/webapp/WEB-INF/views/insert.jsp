<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath }" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert.jsp</title>
<style>
form.v1{
width: 50%;
margin: 10px auto;
}

form.v1 fieldset {
border : 1px solid blue;
border-radius : 10px;
padding :5px;
}
form.v1 label,
form.v1 input {
	display: inline-block;
	padding : 5px;
	margin: 5px;
}
form.v1 label {
	width: 150px;
	text-align: right;
}
</style>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		document.querySelector("button.btn_insert")
		.addEventListener("click", function(ev){
			
			let dom = document;
			let li_date = dom.querySelector("input[name='li_date']");
			let li_time = dom.querySelector("input[name='li_time']");
			let li_place = dom.querySelector("input[name='li_place']");
			let li_content = dom.querySelector("input[name='li_content']");
			
			if(li_date.value ==""){
				alert("날짜를 반드시 입력해주세요")
				li_date.focus();
				return false;
			}
			if(li_time.value ==""){
				alert("시간을 반드시 입력해주세요")
				li_time.focus();
				return false;
			}
			if(li_place.value ==""){
				alert("장소를 반드시 입력해주세요")
				li_place.focus();
				return false;
			}
			if(li_content.value ==""){
				alert("할일을 반드시 입력해주세요")
				li_content.focus();
				return false;
			}
			alert("저장내용" + "\n"
				+ li_date.value + "\n"
				+ li_time.value + "\n"
				+ li_place.value + "\n"
				+ li_content.value + "\n")
				dom.querySelector("form.v1").submit();
		})
	})
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include_title.jsp" %>
<form class="v1" method="POST">
	<fieldset>
		<legend>일정추가</legend>
		<div>
			<label>작성일자	: </label><input name="li_date" type="date"
				value="${Li.li_date}">
		</div>
		<div>
			<label>작성시간	: </label><input name="li_time" type="time"
				value="${Li.li_time}">
		</div>
		<div>
			<label>장소	: </label><input name="li_place" 
				value="${Li.li_place}">
		</div>
		
		<div>
			<label>내용	: </label><input name="li_content" 
				value="${Li.li_content}">
			
		</div>
		<label></label>
		<button class="btn_insert" type="button">추가</button>
	</fieldset>
</form>
</body>
</html>