<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jQuery 실행하기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>
	<h2>회원가입 하기</h2>
	<p>아이디: <input type="text" id="id" required><span id="Available">아이디 중복체크를 하세요</span></p>
 	<input type=button id="text" value="제출하기"> 
<script>
 
    // 테스트용 클릭
    $("#text").click(function(){
    	var valueById = $('#id').val();
    	if(valueById.length === 0 || valueById === null) return alert("아이디를 입력하세요");

    	$.ajax({
            type:"GET",
            url:"http://localhost:8080/AjaxStudy/joinCheck",
            data : {id:valueById},
            dataType : "text",
            success: function(data, textStatus){
            	
            	if(data === 'useable') {
            	
            		$("#Available").html('이용할 수 있는 아이디 입니다.');
            		$("#Available").css('color','red');
                   
                } else {
                   // $('#message').text('이미 사용 중인 아이디입니다.')
                    $('#checkBtn').prop('disabled', true) // 사용할 수 있는 ID면 버튼을 비활성화 시킨다.
                }
            },
            error: function(xhr, status, error) {
                alert(error);
            }  
        });
    });
</script>


</body>
</html>
