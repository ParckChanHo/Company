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
	   var i=0;
	   
      $j("#submit").on("click",function(){
         
          var inputCheck = true;
          $j(".boardWrite").find(".inputCheck").each(function(index, item){
                   // 아무값없이 띄어쓰기만 있을 때도 빈 값으로 체크되도록 trim() 함수 호출
                   if ($j(this).val().trim() == '') {
                       alert($j(this).attr("data-name")+" 항목을 입력하세요.");
                       inputCheck = false;
                   }
               });
         if(!inputCheck)
            return false;
         
         /*var $frm = $j('.boardWrite :input');  
         var param = $frm.serialize();  // boardType=1&boardNum=13&boardTitle=nnn&boardComment=nnnn
         alert(param);
         
         var beforeArr = param.split("&","=");
         for(var i=0; i< beforeArr.length;i++){
            alert(beforeArr[i]);
         }*/
         
         // Ajax로 배열 또는 값을 넘기는 예제
         //https://huskdoll.tistory.com/902
         /*var Title = [];
            var Comment = [];
         var SelectBox = [];
         
            $j('input[name="boardTitle"]').each(function(i){//체크된 리스트 저장
               Title.push($j(this).val());
               alert($j(this).val());
            });
         
            $j('textarea').each(function(i){//체크된 리스트 저장
               Comment.push($j(this).val());
               console.log($j(this).val());
            });
         
            $j('.selectBox').each(function(i){//체크된 리스트 저장
               SelectBox.push($j(this).val());
               console.log($j(this).val());
            });
            
            var objParams = {
              "typeList"  : SelectBox,  // boardType 리스트
              "titleList" : Title,        // boardTitle 리스트
              "commentList" : Comment     // boardComment 리스트
            };
         
         console.log(board);*/
         
         
         //alert(param);
         
         // var param = $frm.serializeArray();
         //alert(JSON.stringify(param)); //JSON.stringify() ==> Json 객체를 String 객체로 변환시킨다.
         /* 
            [{"name":"boardType","value":"a01"},{"name":"boardTitle","value":"11"},
               {"name":"boardComment","value":"11"},{"name":"boardType","value":"a01"},
               {"name":"boardTitle","value":"22"},{"name":"boardComment","value":"222"}]
         */
         
         var $frm = $j('.boardWrite :input');  
         var list = $frm.serialize();  // boardType=1&boardNum=13&boardTitle=nnn&boardComment=nnnn
         console.log(list);
         
         
         $j.ajax({
             url : "/board/boardWriteAction.do",
             dataType: "json", // 위의 url에 대한 return 값
             type: "POST",
             data : list,
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
      }); // end
   
      
      // 2개를 추가했는데 마지막 것을 삭제했더니 오류가 발생한다.
     
      $j("#plus").on("click",function(){
    	  i++;
         //i = ($j("#tablePlusOrDelete >tbody tr").length-1)/3; // 배열의 인덱스 1,2,3,4,..
         alert(i);
         var insertTr = "";
         
        insertTr +="<tr><td width='120' align='center'>Type</td>"+
        "<td><select name='boardVoList["+i+"].boardType'"+">"+
        "<c:forEach items='${codeName}' var='code'>"+
           "<option value='${code.codeId}'>${code.codeName}</option>" +
         "</c:forEach>"+  
        "</select><input type='button' onclick='deleteRow(this)' value='행삭제' style='float: right;'> </td></tr>"
        
        insertTr += "<tr><td align='center' >Title</td><td><input name='boardVoList["+i+"].boardTitle' type='text' size='50' class='inputCheck' data-name='제목'></td></tr>";
        insertTr += "<tr><td align='center' >Comment</td><td><textarea name='boardVoList["+i+"].boardComment' id='comment' rows='20' cols='55' class='inputCheck' data-name='내용'></textarea></td></tr>";
        
        $j("#tablePlusOrDelete tr:last-of-type").before(insertTr);
        //  $j("#tablePlusOrDelete tr").eq(2).after(insertTr);
      }); // end      
   });
   
   // 행 삭제하기
   function deleteRow(obj){
	 
       // this == <td> 를 의미하며 parent()는 <tr>를 의미한다.
       var tr =  $j(obj).parent().parent();
       console.log(tr);
       tr.next().remove();
       tr.next().remove();
       
       tr.remove();
   }

</script>
<body>
<form class="boardWrite">
   <h2 style="text-align:center;">글 작성하기</h2>
   <table align="center">
      <tr>
         <td align="right">
            <input id="submit" type="button" value="작성">
            <input id="plus" type="button" value="행추가">
            <!-- <input id="delete" type="button" value="행삭제"> -->  
         </td>
      </tr>
      
      <tr>
         <td>
            <table border ="1" id="tablePlusOrDelete"> 
               <tr>
                  <td width="120" align="center">Type</td>
                  <td>
                     <select name="boardVoList[0].boardType" class="selectBox"><!-- BOARD_TYPE으로 들어가야 한다. -->
                        <c:forEach items="${codeName}" var="code">
                           <option value="${code.codeId}">${code.codeName}</option>
                        </c:forEach>
                     </select>
                     <!-- 행 삭제 -->
                     <!-- <input type="button" id="delete" value="행삭제" style="float: right;" onclick='deleteRow(this)'> -->
                  </td>   
               </tr>
               
               <tr>
                  <td width="120" align="center">
                  Title
                  </td>
                  <td width="400">
                  <input name="boardVoList[0].boardTitle" type="text" size="50" class="inputCheck" data-name="제목"> 
                  </td>
               </tr>
               <tr>
                  <td height="300" align="center">
                  Comment
                  </td>
                  <td valign="top">
                  <textarea name="boardVoList[0].boardComment" id="comment" rows="20" cols="55" class="inputCheck" data-name="내용">${board.boardComment}</textarea>
                  </td>
               </tr>
               <tr>
                  <td align="center">
                  Writer
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