<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>

<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.boardDelete :input');
			var param = $frm.serialize();  // boardType=1&boardNum=13
			alert(param);
			
			$j.ajax({
			    url : "/board/boardDeleteAction.do",
			    dataType: "json", // 위의 url에 대한 return 값
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
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
<h2 style="text-align:center;">게시글 상세보기</h2>
<form class="boardDelete">
	<table align="center">
		<tr>
			<td>
				<input type = "hidden" name = "boardType" value = "${board.boardType}" >
				<input type = "hidden" name = "boardNum" value = "${board.boardNum}" >
				<table border ="1">
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						${board.boardTitle}
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td>
						${board.boardComment}
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
				<a href = "/board/${board.boardType}/${board.boardNum}/boardUpdate.do">수정하기</a>
				<a id="submit" href ="#">삭제하기</a>
			</td>
			<!-- <a href = "/board/${board.boardType}/${board.boardNum}/boardDelete.do">삭제하기</a> -->
		</tr>
	</table>	

</form>

</body>
</html>