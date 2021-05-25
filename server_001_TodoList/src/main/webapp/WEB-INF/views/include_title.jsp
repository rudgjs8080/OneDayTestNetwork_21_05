<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
* {
	padding : 0;
	box-sizing : border-box;
}
h1.main{
	margin-top: 0px;
	margin-left : 20%;
	margin-right: 20%;
	background-color: rgba(0,255,0,0.5);
	color:white;
	text-align: center;
	padding : 1rem;
	font-size: 50px;
	letter-spacing: 10px;
}
nav#main {
	width: 60%;
	text-align: center;
	padding : 5px;
	}
nav#main li{
	
	display: inline-block;
	list-style: none;
	margin : 0px;
	padding : 5px;
	color: black;
	font-size: 20px;
}
</style>
<script>
document.addEventListener("DOMContentLoaded", function(){
	document.querySelector("nav#main")
	.addEventListener("click", function(ev){
		let text = ev.target.textContent
		// alert(text + "을 누르셨습니다")
		
		if(text == "home"){
			url += "/"
		}
		document.location.herf = url;
	})
})
</script>
<h1 class="main">일정계획표</h1>
<nav id="main">
	<ul>
		<li><a href="${rootPath }"/>Home으로 바로가기</a></li>
		
	</ul>
</nav>
