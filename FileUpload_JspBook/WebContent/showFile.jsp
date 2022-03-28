<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="file.FileDTO" %>
<%@ page import="file.FileDAO" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>파일 보여주기</title>
</head>
<body>
	<%	
		String fileName = (String)request.getParameter("fileName");
		FileDAO dao = new FileDAO();
		FileDTO dto = dao.show(fileName);
	%>
	<img src="<%= dto.getM_fileFullPath()%>" style="width:100%">
</body>
</html>