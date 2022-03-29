<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize(); // boardType=a01&boardTitle=11&boardComment=111
			alert(param);
			
			$j.ajax({
			    url : "/board/boardWriteAction.do",
			    dataType: "json", // ���� url�� ���� return ��
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
		}); // end
		
		/* $j("#plus").on("click",function(){
		  var insertTr = "";
			  
		  insertTr += "<tr><td align='center'>Title</td><td><input name='boardTitle' type='text' size='50' value='${board.boardTitle}'></td></tr>";
		  insertTr += "<tr><td align='center'>Comment</td><td><textarea name='boardComment' rows='20' cols='55'>${board.boardComment}</textarea> </td></tr>";
		  
		  $j("#tablePlus").append(insertTr);
		}); // end
		*/
		
		
		
		
	});
	

</script>
<body>
<form class="boardWrite">
	<h2 style="text-align:center;">�� �ۼ��ϱ�</h2>
	<table align="center">
		<tr>
			<td align="right">
				<input id="submit" type="button" value="�ۼ�">
				<!-- <input id="plus" type="button" value="���߰�"> -->
			</td>
		</tr>
		
		<tr>
			<td>
				<table border ="1" id="tablePlus"> 
					<tr>
						<td width="120" align="center">Type</td>
						<td>
							<select name="boardType"><!-- BOARD_TYPE���� ���� �Ѵ�. -->
								<option value="a01">�Ϲ�</option>
								<option value="a02">Q&A</option>
								<option value="a03">�͸�</option>
								<option value="a04">����</option>
							</select>
						
						</td>		
					</tr>
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
			</td>
		</tr>
	</table>
</form>	
</body>
</html>