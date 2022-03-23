<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 실행하기 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>
	<h2>Ajax 파싱하기</h2>
	<input type=button id="text" value="파싱하기">
	<script>
		// 테스트용 클릭
		$("#text").click(
				function() {
					var valueById = $('#id').val();
					if (valueById.length === 0 || valueById === null)
						return alert("아이디를 입력하세요");

					$.ajax({
						type : "GET",
						url : "http://localhost:8080/AjaxStudy/joinCheck",
						dataType : "xml",
						success : function(data) {
							$(data).find('user').each(
									function() {
										var us = "";
										us += "<tr class='userResult'>";
										us += "<td class='Admin-usid'>"
												+ $(this).find('email').text()
												+ "</td>";
										us += "<td>"
												+ $(this).find('join').text()
												+ "</td>";
										us += "</tr>";
										$('.resultTable-body').append(us);
									});
						},
						error : function(xhr, status, error) {
							alert(error);
						}
					});
				});
	</script>
	<!-- 
	   (1)  find() 함수 ==> 어떤 요소의 하위 요소 중 특정 요소를 찾을 때 사용한다. ex) $( 'h1' ).find( 'span' ) ==> h1 요소의 하위 요소 중 <span> 요소를 선택한다.
		 $( 'p.b' ).find( 'span.ip' ).css( 'font-size', '2em'); ===> 클래스가 b인 p 태그의 하위 요소 중 클래스가 ip이고 <span> 태그인 것을 찾는다. 
	
	   (2) text() ==> 선택한 요소 안의 내용을 가져오거나 다른 내용으로 바꾸는 함수이다.(선택한 요소 안의 내용을 가져오지만 태그(<h1>)는 가져오지 않는다.)
	   삽입하는 내용에 있는 HTML 태그는 태그로 인식하지 않고 텍스트로 인식한다.
	 -->

</body>
</html>
