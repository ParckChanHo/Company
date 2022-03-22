<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="file.FileDAO" %>    
<%@ page import="java.io.File" %>    
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<!-- Application 내장 객체는 전체 프로젝트에 대한 자원을 관리하는 객체이다.
	서버의 실제 프로젝트 경로에서 자원을 찾을 때 가장 많이 사용합니다.  -->
	
	<%
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100; // 100MB 이하까지만
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequet 
		= new MultipartRequest(request,directory,maxSize,encoding,
				new DefaultFileRenamePolicy());
		
		// 사용자가 실제로 업로드한 파일 이름
		String fileName = multipartRequet.getOriginalFileName("file");
		// 실제로 서버에 업로드가 된 파일 이름
		String fileRealName = multipartRequet.getFilesystemName("file");
		
		new FileDAO().upload(fileName, fileRealName);
		out.println("파일명: "+fileName+"<br>");
		out.println("실제 파일명: "+fileRealName+"<br>");
	
	%>
	
	
</body>
</html>