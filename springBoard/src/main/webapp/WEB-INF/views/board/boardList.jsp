<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">
	// [jQuery] checkbox ���õ� �� �������� ===> https://ittudev.tistory.com/3
	// ��ó ===> https://emessell.tistory.com/149
	$j(document).ready(function(){
		// üũ�ڽ� ��ü ����
		$j(".checkbox_group").on("click", "#checkbox_total", function () {
		    $j(this).parents(".checkbox_group").find('input').prop("checked", $j(this).is(":checked"));
		});

		// üũ�ڽ� ���� ����
		$j(".checkbox_group").on("click", ".normal", function() {
		    var is_checked = true;

		    $j(".checkbox_group .normal").each(function(){
		        is_checked = is_checked && $j(this).is(":checked");
		    });

		    $j("#checkbox_total").prop("checked", is_checked);
		});
		
		$j("#submit").on("click",function(){
			$j('input:checkbox[name=checkList]').each(function (index) {
				if($j(this).is(":checked")){
					// ��ü ���� ==> http://localhost:8080/board/boardList.do?checkList=checkbox_total&checkList=a01&checkList=a02&checkList=a03&checkList=a04
					// �κ� ���� ==> http: localhost:8080/board/boardList.do?checkList=a02&checkList=a03&checkList=a04		 
			    	console.log($j(this).val());
			    }
			})
			
		
		}); // end #submit
	}); // end document
	

	/* var $frm = $j('.boardWrite :input');
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
	}); end ajax*/
	
	
</script>
<body>
	<table align="center">
		<tr>
			<td align="right">
				total : ${totalCnt}
			</td>
		</tr>
		<tr>
			<td>
				<table id="boardTable" border = "1">
					<tr>
						<td width="80" align="center">
							Type
						</td>
						<td width="40" align="center">
							No
						</td>
						<td width="300" align="center">
							Title
						</td>
					</tr>
					<c:forEach items="${boardList}" var="list">
						<c:set var="select_boardType" value="${list.boardType}" />
	
						<tr>
							<td align="center">
								<c:choose>
								   <c:when test="${select_boardType eq 'a01'}">
								       �Ϲ�
								   </c:when>
								
								   <c:when test="${select_boardType eq 'a02'}">
								       Q&A
								   </c:when>
								
									<c:when test="${select_boardType eq 'a03'}">
								       �͸�
								   </c:when>
								   
								   <c:otherwise>
								       ����
								   </c:otherwise>
								</c:choose>							
							</td>
							<td align="center">
								${list.boardNum}
							</td>
							<td align="center">
								<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
							</td>
						</tr>	
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href ="/board/boardWrite.do">�۾���</a><br><br>
			</td>
		</tr>
	</table>	
	
	<!-- CheckBox ���� -->
	<form class="boardList">
		<div align="center" class="checkbox_group">
			<input type="checkbox" id="checkbox_total" value="checkbox_total" name="checkList"><label for="checkbox_total">��ü</label>&nbsp;&nbsp;
			<input type="checkbox" class="normal" id="checkbox1" value="a01" name="checkList"><label for="checkbox1">�Ϲ�</label>&nbsp;&nbsp;
			<input type="checkbox" class="normal" id="checkbox2" value="a02" name="checkList"><label for="checkbox2">Q&A</label>&nbsp;&nbsp;
			<input type="checkbox" class="normal" id="checkbox3" value="a03" name="checkList"><label for="checkbox3">�͸�</label>&nbsp;&nbsp;
			<input type="checkbox" class="normal" id="checkbox4" value="a04" name="checkList"><label for="checkbox4">����</label>&nbsp;&nbsp;
			<input type="submit" value="��ȸ" id="submit">
		</div>
	</form>







<!-- [JS] üũ�ڽ� ��ü����,���� ���� ����� (ȸ������,������ ������� ��)
	(1) https://emessell.tistory.com/149    ===> ����
	(2) https://chobopark.tistory.com/134
    (3) https://hianna.tistory.com/433
 -->


</body>
</html>