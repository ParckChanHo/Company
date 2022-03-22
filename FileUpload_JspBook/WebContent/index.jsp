<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
	   파일: <input type="file" name="file"><br>
	   <input type="submit" value="업로드"><br>
	</form>
	
</body>
</html> 