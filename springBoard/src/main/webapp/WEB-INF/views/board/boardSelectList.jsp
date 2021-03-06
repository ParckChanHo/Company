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
	// [jQuery] checkbox 선택된 값 가져오기 ===> https://ittudev.tistory.com/3
	// 출처 ===> https://emessell.tistory.com/149
	// ajax controller에서 값 받기 ==> https://yulfsong.tistory.com/76
	$j(document).ready(function(){
	
		$j(".checkbox_group").on("click", "#checkbox_total", function () {
		    $j(this).parents(".checkbox_group").find('input').prop("checked", $j(this).is(":checked"));
		});
		// 체크박스 개별 선택
		$j(".checkbox_group").on("click", ".normal", function() {
		    var is_checked = true;
		    $j(".checkbox_group .normal").each(function(){
		        is_checked = is_checked && $j(this).is(":checked");
		    });
		    $j("#checkbox_total").prop("checked", is_checked);
		});
	 
	}); // end document
	
	
	
	
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
								       일반
								   </c:when>
								
								   <c:when test="${select_boardType eq 'a02'}">
								       Q&A
								   </c:when>
								
									<c:when test="${select_boardType eq 'a03'}">
								       익명
								   </c:when>
								   
								   <c:otherwise>
								       자유
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
				<a href ="/board/boardWrite.do">글쓰기</a><br><br>
			</td>
		</tr>
	</table>	
	
	<!-- CheckBox 시작 -->
	<form action="/board/boardListAction.do"> 
		<div align="center" class="checkbox_group">
			<input type="hidden" name="pageNo" value="${pageNo}"/>
			
			<input type="checkbox" id="checkbox_total" name="parameter" value="checkboxAll"><label for="checkbox_total">전체</label>&nbsp;&nbsp;
			<input type="checkbox" class="normal" name="parameter" id="checkbox1" value="a01"><label for="checkbox1">일반</label>&nbsp;&nbsp;
			<input type="checkbox" class="normal" name="parameter" id="checkbox2" value="a02"><label for="checkbox2">Q&A</label>&nbsp;&nbsp;
			<input type="checkbox" class="normal" name="parameter" id="checkbox3" value="a03"><label for="checkbox3">익명</label>&nbsp;&nbsp;
			<input type="checkbox" class="normal" name="parameter" id="checkbox4" value="a04"><label for="checkbox4">자유</label>&nbsp;&nbsp;
			<input type="submit" value="조회" id="submit">
		</div>
	</form>


</body>
</html>