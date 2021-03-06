<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team3_ebook</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">

  $(function() {
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  });
 
</script>

</head> 
<body>

  <jsp:include page="/menu/top.jsp" flush='false' />
  
  <div class="title_line">
        공지사항
  </div>
  
  <ASIDE class="aside_left">
    <A href=''>공지사항</A> >신규 등록
  </ASIDE>
  <ASIDE  class="aside_right">
    <A href='./list.do'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
             enctype="multipart/form-data" >
             
  <input type="hidden" name="m_no" value="1">
  
  <div class="form-group">
     <label class="control-label col-md-2">공지사항 제목</label>
     <div class="col-md-9">
     <input type='text' name='title' value='' required="required" 
         autofocus="autofocus" class="form-control" style='width: 50%;'>
     </div>
  </div>
  
   <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control" name='content' id='content' rows='10' placeholder="내용">${content }</textarea>
        </div>
    </div>
    
    <div class="form-group">   
        <div class="col-md-12">
          <%-- 실제 컬럼명: nfile1, Spring File 객체 대응: nfile1MF --%>
          <input type='file' class="form-control" name='nfile1MF' id='nfile1MF' 
                    value='' placeholder="파일 선택">
        </div>
      </div>
      
  
  <div class="form-group">
     <label class="control-label col-md-2">작성자</label>
     <div class="col-md-10">
     <input type='text' name='writer' value='' required="required" 
         autofocus="autofocus" class="form-control" style='width: 50%;'>
     </div>
  </div>
  
  <div class="form-group">
     <label class="control-label col-md-2">패스워드</label>
     <div class="col-md-9">
     <input type='text' name='notice_pw' value='' required="required" 
         autofocus="autofocus" class="form-control" style='width: 50%;'>
     </div>
  </div>
  
  <div class="form-group">
     <label class="control-label col-md-2">출력 형식</label>
     <div class="col-md-9">
        <select name='visible' class="form-control" style='width: 20%;'>
          <option value='Y' selected="selected">Y</option>
          <option value='N'>N</option>
        </select>
     </div>
  </div>  

  <div class="content_bottom_menu" style="padding-right: 20%;">
    <button type="submit" class="btn btn-info">등록</button>
    <button type="button" class="btn btn-info" onclick="location.href='./list.do'" >목록</button>
  </div>

</FORM>
 
 
  <jsp:include page="/menu/bottom.jsp" flush='false' />

</body>

</html>

