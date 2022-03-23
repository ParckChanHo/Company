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

table, td, th {
    border : solid 1px;
    text-align: center;
};
table {
	margin-left:auto; 
    margin-right:auto;
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

						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
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
			</div>
		</nav>
		<!-- end navbar -->

		<h2>직원 리스트</h2>
		<form>
			<table>
				<tr>
					<td style="width: 100px;">사번</td>
					<td style="width: 135px;"><input name="sabun" type="text" placeholder="사번을 입력해주세요"/></td>
					<td style="width: 100px;">성명</td>
					<td style="width: 135px;"><input name="name" type="text" placeholder="성명을 입력해주세요"/></td>
					<td style="width: 100px;">입사구분</td>
					<td style="width: 135px;">
						<select name="join_type" style="width:100%">
							 <option>(선택)</option>
						     <option value="Y">Y</option>
						     <option value="N">N</option>
						 </select>    
					</td>
					<td style="width: 100px;">투입여부</td>
					<td style="width: 135px;">
						<select name="put_yn" style="width:100%">
							 <option>(선택)</option>
						     <option value="Y">Y</option>
						     <option value="N">N</option>
						 </select>   
					</td>
				</tr>
				<tr>
					<td style="width: 100px;">직위</td>
					<td style="width: 135px;">
						<select name="pos_gbn_code" style="width:100%">
							 <option>(선택)</option>
						     <option value="pos1">사원</option>
						     <option value="pos2">대리</option>
						     <option value="pos3">팀장</option>
						 </select>
					</td>
					<td style="width: 100px;">입사일자</td>
					<td style="width: 135px;"><input name="join_day" type="date"/></td>
					<td style="width: 100px;">퇴사일자</td>
					<td style="width: 135px;">
						<input name="retire_day" type="date"/>
					</td>
					<td style="width: 100px;">직종분류</td>
					<td style="width: 135px;">
						<select name="join_gbn_code_" style="width:100%">
							 <option>(선택)</option>
						     <option value="join1">인사</option>
						     <option value="join2">영업</option>
						     <option value="join3">개발</option>
						 </select>   
					</td>
				</tr>
			</table>
			<button type="button" style="position:relative; left:850px;" class="btn btn-primary">검색</button>
			<button type="button" style="position:relative; left:855px;" class="btn btn-danger">초기화</button>
			<button type="button" style="position:relative; left:860px;" class="btn btn-info">이전</button>
		</form>

		<!-- end container -->
		<hr><hr>
		<table>
			<tr>
				<td style="width: 84px;">사번</td><!-- 사번 -->
				<td style="width: 84px;">성명</td><!-- 성명 -->
				<td style="width: 128px;">주민번호</td><!-- 주민번호 -->
				<td style="width: 124px;">휴대폰번호</td><!-- 휴대폰번호 -->
				<td style="width: 104px;">직위</td><!-- 직위 -->
				<td style="width: 104px;">입사일자</td><!-- 입사일자 -->
				<td style="width: 104px;">퇴사일자</td><!-- 퇴사일자 -->
				<td style="width: 104px;">투입여부</td><!-- 투입여부 -->
				<td style="width: 104px;">연봉</td><!-- 연봉 -->
			</tr>
		</table>
		<br><br>
		<table>
			<tr>
				<td style="width: 84px;">1234</td><!-- 사번 -->
				<td style="width: 84px;">박찬호</td><!-- 성명 -->
				<td style="width: 128px;">980416-*******</td><!-- 주민번호 -->
				<td style="width: 124px;">010-****-****</td><!-- 휴대폰번호 -->
				<td style="width: 104px;">사원</td><!-- 직위 -->
				<td style="width: 104px;">2022-03-23</td><!-- 입사일자 -->
				<td style="width: 104px;">2022-12-23</td><!-- 퇴사일자 -->
				<td style="width: 104px;">N</td><!-- 투입여부 -->
				<td style="width: 104px;">연봉</td><!-- 연봉 -->
			</tr>
		</table>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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