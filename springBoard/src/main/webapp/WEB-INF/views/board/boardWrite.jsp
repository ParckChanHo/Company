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
                   // �ƹ������� ���⸸ ���� ���� �� ������ üũ�ǵ��� trim() �Լ� ȣ��
                   if ($j(this).val().trim() == '') {
                       alert($j(this).attr("data-name")+" �׸��� �Է��ϼ���.");
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
         
         // Ajax�� �迭 �Ǵ� ���� �ѱ�� ����
         //https://huskdoll.tistory.com/902
         /*var Title = [];
            var Comment = [];
         var SelectBox = [];
         
            $j('input[name="boardTitle"]').each(function(i){//üũ�� ����Ʈ ����
               Title.push($j(this).val());
               alert($j(this).val());
            });
         
            $j('textarea').each(function(i){//üũ�� ����Ʈ ����
               Comment.push($j(this).val());
               console.log($j(this).val());
            });
         
            $j('.selectBox').each(function(i){//üũ�� ����Ʈ ����
               SelectBox.push($j(this).val());
               console.log($j(this).val());
            });
            
            var objParams = {
              "typeList"  : SelectBox,  // boardType ����Ʈ
              "titleList" : Title,        // boardTitle ����Ʈ
              "commentList" : Comment     // boardComment ����Ʈ
            };
         
         console.log(board);*/
         
         
         //alert(param);
         
         // var param = $frm.serializeArray();
         //alert(JSON.stringify(param)); //JSON.stringify() ==> Json ��ü�� String ��ü�� ��ȯ��Ų��.
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
             dataType: "json", // ���� url�� ���� return ��
             type: "POST",
             data : list,
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
   
      
      // 2���� �߰��ߴµ� ������ ���� �����ߴ��� ������ �߻��Ѵ�.
     
      $j("#plus").on("click",function(){
    	  i++;
         //i = ($j("#tablePlusOrDelete >tbody tr").length-1)/3; // �迭�� �ε��� 1,2,3,4,..
         alert(i);
         var insertTr = "";
         
        insertTr +="<tr><td width='120' align='center'>Type</td>"+
        "<td><select name='boardVoList["+i+"].boardType'"+">"+
        "<c:forEach items='${codeName}' var='code'>"+
           "<option value='${code.codeId}'>${code.codeName}</option>" +
         "</c:forEach>"+  
        "</select><input type='button' onclick='deleteRow(this)' value='�����' style='float: right;'> </td></tr>"
        
        insertTr += "<tr><td align='center' >Title</td><td><input name='boardVoList["+i+"].boardTitle' type='text' size='50' class='inputCheck' data-name='����'></td></tr>";
        insertTr += "<tr><td align='center' >Comment</td><td><textarea name='boardVoList["+i+"].boardComment' id='comment' rows='20' cols='55' class='inputCheck' data-name='����'></textarea></td></tr>";
        
        $j("#tablePlusOrDelete tr:last-of-type").before(insertTr);
        //  $j("#tablePlusOrDelete tr").eq(2).after(insertTr);
      }); // end      
   });
   
   // �� �����ϱ�
   function deleteRow(obj){
	 
       // this == <td> �� �ǹ��ϸ� parent()�� <tr>�� �ǹ��Ѵ�.
       var tr =  $j(obj).parent().parent();
       console.log(tr);
       tr.next().remove();
       tr.next().remove();
       
       tr.remove();
   }

</script>
<body>
<form class="boardWrite">
   <h2 style="text-align:center;">�� �ۼ��ϱ�</h2>
   <table align="center">
      <tr>
         <td align="right">
            <input id="submit" type="button" value="�ۼ�">
            <input id="plus" type="button" value="���߰�">
            <!-- <input id="delete" type="button" value="�����"> -->  
         </td>
      </tr>
      
      <tr>
         <td>
            <table border ="1" id="tablePlusOrDelete"> 
               <tr>
                  <td width="120" align="center">Type</td>
                  <td>
                     <select name="boardVoList[0].boardType" class="selectBox"><!-- BOARD_TYPE���� ���� �Ѵ�. -->
                        <c:forEach items="${codeName}" var="code">
                           <option value="${code.codeId}">${code.codeName}</option>
                        </c:forEach>
                     </select>
                     <!-- �� ���� -->
                     <!-- <input type="button" id="delete" value="�����" style="float: right;" onclick='deleteRow(this)'> -->
                  </td>   
               </tr>
               
               <tr>
                  <td width="120" align="center">
                  Title
                  </td>
                  <td width="400">
                  <input name="boardVoList[0].boardTitle" type="text" size="50" class="inputCheck" data-name="����"> 
                  </td>
               </tr>
               <tr>
                  <td height="300" align="center">
                  Comment
                  </td>
                  <td valign="top">
                  <textarea name="boardVoList[0].boardComment" id="comment" rows="20" cols="55" class="inputCheck" data-name="����">${board.boardComment}</textarea>
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