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
	// [jQuery] checkbox ���õ� �� �������� ===> https://ittudev.tistory.com/3
	// ��ó ===> https://emessell.tistory.com/149
	// ajax controller���� �� �ޱ� ==> https://yulfsong.tistory.com/76
	$j(document).ready(function(){
	
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
			 /*
	        	üũ�� CheckBox�� value ���� �迭�� �ֱ�
	            $j("input[name=checkBox]:checked").each(function() {
	            	alert($j(this).val());
	            	checkBoxArray.push($j(this).val());
	            }) 
        	*/
			
			var ch = $j('input:checked').val();
			if(ch==null){
				alert("üũ �ϼ���");
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
            	Json�� �Ľ��ϴ� ���
            	success: function(data) �̹Ƿ� �׻� �տ� data�� �ٿ��� �Ѵ�.
            	1) {} ��ü�� ex) data.codeMap.a01 �̷������� �Ľ��� �ϸ� �ȴ�. ==> "codeMap":{"a02":"Q&A","a01":"�Ϲ�","a04":"����","a03":"�͸�"}
            		���� 1���� ���� ��� : data.totalCnt
            	2) [] �迭�� ex) data.list[i].boardNum �̷������� �Ľ��� �ϸ� �ȴ�.
            	
			 	{"totalCnt":10,
			 	 "pageNo":1,
			 	"boardList":[{"boardType":"a01","boardNum":3,"boardTitle":"333","boardComment":"3333","creator":null,"modifier":null,"totalCnt":0,"codeName":"??"}
			 	,{"boardType":"a01","boardNum":2,"boardTitle":"222","boardComment":"2222","creator":null,"modifier":null,"totalCnt":0,"codeName":"??"},
			 	{"boardType":"a01","boardNum":1,"boardTitle":"111","boardComment":"1111","creator":null,"modifier":null,"totalCnt":0,"codeName":"??"}
			 	]}
		 
			*/
			
			$j.ajax({
			    url : "/board/boardList.do",
			    dataType: "json", // ���� url�� ���� return ��
			    type: "POST",
			    contentType: "application/x-www-form-urlencoded; charset=EUC-KR",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
			    	//  �����ϴ� ���뿡 �ִ� HTML �±״� �ؽ�Ʈ�� �ƴ϶� �±׷� �ν��մϴ�.
			    	$j('#cntbox').html("total : " + data.totalCnt);
			    	//�����͸� ���� �Ѹ��� ���� ���� ǥ�� ���� 
			    	var trlength = $j('#boardTable tr').length;
			    	for(var t=trlength-1;t>0;t--){
			    		table.deleteRow(t);
			    	}
			    	//������ �Ѹ��� 
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
			    	alert("����");
			    }
			});
			
			
			/*$j.ajax({
			    url : 'https://jsonplaceholder.typicode.com/posts',
			    dataType: "json", // ���� url�� ���� return ��
			    type: "GET",
			    success: function(data, textStatus, jqXHR)
			    {
			    	console.log(data); 
			    	$j.each(data, function (i, item)
	    			{ 	//each(�Ű�����, �Լ�) 
			    		$j('#result').append(`<h3>$j{item.title}</h3><p>$j{item.body}</p>`) 
		    		});
			    	
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
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
								 ${list.codeName}	<!-- ���� �͸� Q&A ��� -->			
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
	<!-- <form action="/board/boardList.do">  -->
	
	<form method="post"> 
		<div align="center" class="checkbox_group">
			<input type="hidden" name="pageNo" value="${pageNo}"/>
			<input type="checkbox" id="checkbox_total" name="all" value="checkboxAll"><label for="checkbox_total">��ü</label>&nbsp;&nbsp;
			
			<c:forEach items="${codeName}" var="code" varStatus="status"> 
            	<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox${status.count}" value="${code.codeId}">
                        <label for="checkbox${status.count}">${code.codeName}</label>&nbsp;&nbsp;
         	</c:forEach>
			
			<!-- 
				�Ʒ��� ���� �̻��ϰ� �����ϸ� �̷��� �ȴ�.
				<c:forEach items="${BOARD_TYPE}" var="type"> 
            		<c:forEach items="${boardList}" var="list">
               		<c:set var="select_boardType" value="${list.boardType}" />  BOARD_TYPE�̴�. ex) a01
                  		<c:when test="${select_boardType eq '${type}'}">
                     	<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox1" value="${list}">
                       	 	<label for="checkbox1">${list.codeName}</label>&nbsp;&nbsp;
                  		</c:when>         
            		</c:forEach>
         		</c:forEach>
				
				<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox1" value="${CODE_ID}"><label for="checkbox1">${CODE_NAME}</label>&nbsp;&nbsp;
				<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox2" value="a02"><label for="checkbox2">Q&A</label>&nbsp;&nbsp;
				<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox3" value="a03"><label for="checkbox3">�͸�</label>&nbsp;&nbsp;
				<input type="checkbox" class="normal" name="checkBoxSelect" id="checkbox4" value="a04"><label for="checkbox4">����</label>&nbsp;&nbsp;
			-->
			
			<!-- �ݵ�� type="button"���� �ؾ� �Ѵ�. submit���� �ϸ� form�� action�� ������ ���� �ʾƵ� 
			�ٸ� ������ �̵��� �Ѵ�.  ���� : https://ejfrmjava.tistory.com/37-->
			<input type="button" value="��ȸ" id="submit">
		</div>
	</form>
	
	

</body>
</html>