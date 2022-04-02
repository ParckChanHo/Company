<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ page import ="java.util.*" %>
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
	 	
		$j("#submit").on("click",function(){
			 /*
	        	체크한 CheckBox의 value 값을 배열에 넣기
	            $j("input[name=checkBox]:checked").each(function() {
	            	alert($j(this).val());
	            	checkBoxArray.push($j(this).val());
	            }) 
        	*/
			
			var ch = $j('input:checked').val();
			if(ch==null){
				alert("체크 하세요");
				return false;
			}
			var pageVo = $j('input[type=hidden]').val();
			alert(pageVo);
			
			var $frm = $j("input[name=checkBoxSelect]:checked");
			var param = $frm.serialize(); // checkBoxSelect=a01&checkBoxSelect=a02+"&pageNo="+pageVo
			param+="&pageNo="+pageVo;
			alert(param);
			
			var table = document.getElementById('boardTable');
			
    
            /*	
            	Json을 파싱하는 방법
            	success: function(data) 이므로 항상 앞에 data를 붙여야 한다.
            	1) {} 객체는 ex) data.codeMap.a01 이런식으로 파싱을 하면 된다. ==> "codeMap":{"a02":"Q&A","a01":"일반","a04":"자유","a03":"익명"}
            		값이 1개만 있을 경우 : data.totalCnt
            	2) [] 배열은 ex) data.list[i].boardNum 이런식으로 파싱을 하면 된다.
            	
			 	{"totalCnt":10,
			 	 "pageNo":1,
			 	"boardList":[{"boardType":"a01","boardNum":3,"boardTitle":"333","boardComment":"3333","creator":null,"modifier":null,"totalCnt":0,"codeName":"??"}
			 	,{"boardType":"a01","boardNum":2,"boardTitle":"222","boardComment":"2222","creator":null,"modifier":null,"totalCnt":0,"codeName":"??"},
			 	{"boardType":"a01","boardNum":1,"boardTitle":"111","boardComment":"1111","creator":null,"modifier":null,"totalCnt":0,"codeName":"??"}
			 	]}
		 
			*/
			
			$j.ajax({
			    url : "/board/boardList.do",
			    dataType: "json", // 위의 url에 대한 return 값
			    type: "POST",
			    contentType: "application/x-www-form-urlencoded; charset=EUC-KR",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
			    	//  삽입하는 내용에 있는 HTML 태그는 텍스트가 아니라 태그로 인식합니다.
			    	$j('#cntbox').html("total : " + data.totalCnt);
			    	//데이터를 새로 뿌리기 위해 이전 표를 지움 
			    	var trlength = $j('#boardTable tr').length;
			    	for(var t=trlength-1;t>0;t--){
			    		table.deleteRow(t);
			    	}
			    	//데이터 뿌리기 
			    	// <a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
			    	for(var i=0;i<data.boardList.length;i++){
						$j('#boardTable').append("<tr><td align='center'>" + data.boardList[i].codeName + "</td>" +
													"<td align='center'>" + data.boardList[i].boardNum + "</td>" +
													"<td align='center'><a href= /board/" + data.boardList[i].boardType 
															+ "/" + data.boardList[i].boardNum 
															+ "/boardView.do?pageNo="+data.pageNo+">"+ data.boardList[i].boardTitle +"</a></tr>");
			    	}
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
			
			
			/*$j.ajax({
			    url : 'https://jsonplaceholder.typicode.com/posts',
			    dataType: "json", // 위의 url에 대한 return 값
			    type: "GET",
			    success: function(data, textStatus, jqXHR)
			    {
			    	console.log(data); 
			    	$j.each(data, function (i, item)
	    			{ 	//each(매개변수, 함수) 
			    		$j('#result').append(`<h3>$j{item.title}</h3><p>$j{item.body}</p>`) 
		    		});
			    	
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			    
			    
			});
			
			HTML
			<div id="container">
				<div id="result">
					<ul id="users"></ul>
				</div>  
			</div>
			*/ 
			
		}); // end #submit
		
		
		
	}); // end document
</script>
<body>	
	
	<table align="center">
		<tr>
			<td align="right" id="cntbox">
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
								 ${list.codeName}	<!-- 자유 익명 Q&A 등등 -->			
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
	<!-- <form action="/board/boardList.do">  -->
	
	<form method="post"> 
		<div align="center" class="checkbox_group">
			<input type="hidden" name="pageNo" value="${pageNo}"/>
			<input type="checkbox" id="checkbox_total" name="all" value="checkboxAll"><label for="checkbox_total">전체</label>&nbsp;&nbsp;
			
			<c:forEach items="${codeName}" var="code" varStatus="status"> 
            	<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox${status.count}" value="${code.codeId}">
                        <label for="checkbox${status.count}">${code.codeName}</label>&nbsp;&nbsp;
         	</c:forEach>
			
			<!-- 
				아래의 것을 이상하게 구현하면 이렇게 된다.
				<c:forEach items="${BOARD_TYPE}" var="type"> 
            		<c:forEach items="${boardList}" var="list">
               		<c:set var="select_boardType" value="${list.boardType}" />  BOARD_TYPE이다. ex) a01
                  		<c:when test="${select_boardType eq '${type}'}">
                     	<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox1" value="${list}">
                       	 	<label for="checkbox1">${list.codeName}</label>&nbsp;&nbsp;
                  		</c:when>         
            		</c:forEach>
         		</c:forEach>
				
				<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox1" value="${CODE_ID}"><label for="checkbox1">${CODE_NAME}</label>&nbsp;&nbsp;
				<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox2" value="a02"><label for="checkbox2">Q&A</label>&nbsp;&nbsp;
				<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox3" value="a03"><label for="checkbox3">익명</label>&nbsp;&nbsp;
				<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox4" value="a04"><label for="checkbox4">자유</label>&nbsp;&nbsp;
			-->
			
			<!-- 반드시 type="button"으로 해야 한다. submit으로 하면 form에 action을 지정해 주지 않아도 
			다른 곳으로 이동을 한다.  참고 : https://ejfrmjava.tistory.com/37-->
			<input type="button" value="조회" id="submit">
		</div>
	</form>
	
	

</body>
</html>