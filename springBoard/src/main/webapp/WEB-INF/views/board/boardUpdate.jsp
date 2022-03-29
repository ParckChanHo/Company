<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardUpdate</title>
</head>
<!-- boardWrite.jsp를 복사한 것이다. 
	수정하기 위해서는 boardType과 boardNum이 필요하다
	1)
	2)
-->
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.boardUpdate :input');
			var param = $frm.serialize();  // boardType=1&boardNum=13&boardTitle=nnn&boardComment=nnnn
			alert(param);
			
			$j.ajax({
			    url : "/board/boardUpdateAction.do",
			    dataType: "json", // 위의 url에 대한 return 값
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("작성완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
	});
	

</script>
<body>
<form class="boardUpdate">
	<h2 style="text-align:center;">게시글 수정하기</h2>
	<table align="center">
		<tr>
			<td align="right">
				<input id="submit" type="button" value="수정하기">
				<!-- 수정하기 위해서는 boardType과 boardNum이 필요하다 -->
				<input type = "hidden" name = "boardType" value = "${board.boardType}" >
				<input type = "hidden" name = "boardNum" value = "${board.boardNum}" >
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1"> 
				
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
						</td>
					</tr>
					

				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
         		<a href="/board/boardList.do">List</a>
         		<!--  <a href ="/board/boardUpdate.do">수정하기</a>
         		<a href ="/board/boardDelete.do">삭제하기</a>-->
      		</td>
		</tr>
	</table>
</form>	
</body>
</html>