<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
* {
	margin : 0;
	padding : 0;
	box-sizing : border-box;
}
h1.main{
	background-color: rgba(0,255,0,0.5);
	color:white;
	text-align: center;
	padding : 1rem;
}
nav#main {
	background-color: rgba(0,255,0,0.2);
	text-align: center;
	padding : 0px;
	}
nav#main li{
	display: inline-block;
	list-style: none;
	margin : 0px;
	padding : 5px;
	color: white;
}
</style>
<script>
document.addEventListener("DOMContentLoaded", function(){
	document.querySelector("nav#main")
	.addEventListener("click", function(ev){
		let text = ev.target.textContent
		alert(text + "을 누르셨습니다")
		
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
		<li><a href="${rootPath }"/>Home</a></li>
		
	</ul>
</nav>
