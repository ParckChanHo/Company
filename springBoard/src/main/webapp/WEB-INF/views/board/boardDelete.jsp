<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardDelete</title>
</head>
<!-- boardWrite.jsp�� ������ ���̴�. 
	�����ϱ� ���ؼ��� boardType�� boardNum�� �ʿ��ϴ�
	1)
	2)
-->
<script type="text/javascript">

	$j(document).ready(function(){
		var Msg = $j('#Msg').val();
		if(Msg === 'Y'){
			alert(Msg);
			alert("�����ϼ̽��ϴ�.");
			location.href = "/board/boardList.do?pageNo=1";
		}
		else{
			alert(Msg);
			alert("�����߽��ϴ�..");
			location.href = "/board/boardList.do?pageNo=1";
		}
		
	});
	

</script>
<body>
<form class="boardWrite">
	<input type="hidden" id="Msg" value="${ callbackMsg}"/>
</form>	
</body>
</html>