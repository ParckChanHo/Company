<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="json.JsonDTO" %>
<%@ page import="json.JsonDAO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON 만들기</title>
</head>
<body>
	<%	
		JsonDAO dao = new JsonDAO();
		ArrayList<JsonDTO> list = dao.select();	
	
		JSONObject jsonMain = new JSONObject();
		JSONArray jArray = new JSONArray();
		
		for(int i=0; i<list.size(); i++){
			JsonDTO dto = list.get(i);
			String userId = dto.getUserId();
			String passWord = dto.getPassWord();
			System.out.println("userId: "+userId+" "+"passWord: "+passWord+"\n");
			
			JSONObject jObject = new JSONObject();	
			jObject.put("userId",userId);
			jObject.put("passWord",passWord);
			
			jArray.add(jObject);
		}
		jsonMain.put("list",jArray);
		out.print(jsonMain.toJSONString());
		
		//jsonMain.put("List", jArray);
		
		
	%>
</body>
</html>