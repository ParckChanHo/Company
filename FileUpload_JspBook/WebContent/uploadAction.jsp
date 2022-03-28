<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="file.FileDAO" %>    
<%@ page import="java.util.*" %>
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
		String savePath = "C:\\upload";
		// 파일 크기 100MB로 제한
		int sizeLimit = 1024*1024*100;
		
		MultipartRequest multi = new MultipartRequest(request,savePath,sizeLimit,"utf-8", new DefaultFileRenamePolicy()); 
		
		Enumeration files = multi.getFileNames(); // 폼 페이지에 input 태그 내 type 속성 값이 file로 설정된 요청 파라미터의 이름을 반환합니다.
		String fileName = null;
		while(files.hasMoreElements()){
			FileDAO dao = new FileDAO();
			String name = (String) files.nextElement();
			fileName = multi.getFilesystemName("file"); // 사용자가 설정하여 서버에 실제로 업로드된 파일명을 반환합니다.파일명이 중복되면 변경된 파일명을 반환합니다.
			// 업로드한 파일의 전체 경로를 DB에 저장하기 위함
			String m_fileFullPath = savePath + "/" + fileName;
			dao.upload(m_fileFullPath);
			
			System.out.println("파일의 전체 경로: "+m_fileFullPath);
			File file = multi.getFile(name);
			
			if(file != null){
				out.println("파일 크기 : "+file.length());
				out.println("<br>");
			}
			
		}
		
		response.sendRedirect("showFile.jsp?fileName="+fileName);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		/* String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100; // 100MB 이하까지만
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequet 
		= new MultipartRequest(request,directory,maxSize,encoding,
				new DefaultFileRenamePolicy()); */
		
		// 사용자가 실제로 업로드한 파일 이름
		//String fileName = multipartRequet.getOriginalFileName("file");
		// 실제로 서버에 업로드가 된 파일 이름
		//String fileRealName = multipartRequet.getFilesystemName("file");
		
		/* new FileDAO().upload(fileName, fileRealName);
		out.println("파일명: "+fileName+"<br>");
		out.println("실제 파일명: "+fileRealName+"<br>"); */
	
	%>


</body>
</html> 