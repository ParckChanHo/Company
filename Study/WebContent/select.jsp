<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width" , initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- href="css/bootstrap.min.css"도 동일하다!!-->
<link rel="stylesheet" href="css/custom.css">
<!-- 부트스트랩 참조 영역 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

<style>
/* footer */
footer {
	background-color: #555;
	color: white;
	padding: 5px;
	text-align: center;
}
</style>
<title>조회 페이지</title>
</head>
<body>
	<div class="container">

		<!-- Static navbar -->
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="main.jsp">IT&BIZ</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Home<span class="sr-only"></span></a></li>
						<li><a href="#">Input</a></li>
						<li class="active"><a href="#">Search</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</nav>

		<!-- Main component for a primary marketing message or call to action -->
		<div class="container">
			<h1>직원 리스트</h1>
			<form action="selectAction.jsp" method="post" class="form-horizontal">
				<div class="form-inline form-group">
					<label for="employee_num" class="col-sm-1 control-label">전화번호:</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" id="employee_num" name="phone_num">	
					</div>
					<label for="employee_num" class="col-sm-1 control-label">전화번호:</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" id="employee_num" name="phone_num">	
					</div>
					<label for="employee_num" class="col-sm-1 control-label">전화번호:</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" id="employee_num" name="phone_num">	
					</div>
					<label for="employee_num" class="col-sm-1 control-label">전화번호:</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" id="employee_num" name="phone_num">	
					</div>
					
				</div>

			</form>












			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="backgroud-color: #eeeeee; text-align: center;">번호</th>
							<th style="backgroud-color: #eeeeee; text-align: center;">제목</th>
							<th style="backgroud-color: #eeeeee; text-align: center;">작성자</th>
							<th style="backgroud-color: #eeeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>

	</div>
	<!-- /container -->
	<!-- footer -->
	<footer class="container-fluid navbar-fixed-bottom">
		<p>서울시 금천구 서부샛길 606 A 1306(가산동 대성디폴리스 지식산업센터) / Tel: 02-6049-1114
		</p>
		<p>/ Fax: 02-861-9883 Copyright@ 2015 IT&BIZ co. LTD. All rights
			reserved by ABC@naver.com</p>
	</footer>
	<!-- footer 끝 -->
</body>
</html>