<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/xml" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="json.JsonDTO" %>
<%@ page import="json.JsonDAO" %>
<%@ page import="java.util.ArrayList" %>
	
	<contents>
<%
	JsonDAO dao = new JsonDAO();
	ArrayList<JsonDTO> list = dao.select();	
	
	for(int i=0; i<list.size(); i++){
		JsonDTO dto = list.get(i);
%>
			<user><%=dto.getUserId() %></user>
			<join><%=dto.getPassWord() %></join>
<%
	}
%>
	</contents>		