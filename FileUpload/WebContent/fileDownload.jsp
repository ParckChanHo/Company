<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.File" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<%
		String directory = application.getRealPath("/upload/");
		String files[] = new File(directory).list();
		
		for(String file : files){
			out.println("<a href=\""+request.getContextPath() + "/downloadAction?file="
					+ java.net.URLEncoder.encode(file,"UTF-8") + "\">" + file + "</a><br>");
		}
	%>
</body>
</html>