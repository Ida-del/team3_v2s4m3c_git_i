<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
  src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  // window.onload=function(){
  //  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  // };

  $(function() {
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  });
</script> 

</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />
   <DIV class='title_line'>
      카테고리 이름
   </DIV>

  <ASIDE class="aside_left">
    <A href=''>공지사항</A> > ${noticeVO.noticeno} 번 글 수정
  </ASIDE>
  <ASIDE  class="aside_right">
    <A href='./list.do'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>

  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do'
      class="form-horizontal form_bs">
      <!-- FK memberno 지정 -->
      <input type='hidden' name='m_no' id='m_no' value='${noticeVO.m_no }'>

      <input type='hidden' name='noticeno' id='noticeno' value='${noticeVO.noticeno}'>

      <div class="form-group">
        <div class="col-md-12">
          <input type='text' class="form-control" name='title'
            value="${noticeVO.title }" placeholder="제목"
            required="required" style='width: 80%;'
            autofocus="autofocus">
        </div>
      </div>

      <div class="form-group">
        <div class="col-md-12">
          <textarea class="form-control" name='content' id='content'
            rows='10' placeholder="내용">${noticeVO.content }</textarea>
        </div>
      </div>
      
      <div class="form-group">
        <div class="col-md-12">
          <input type='text' class="form-control" name='writer'
            value="${noticeVO.writer }" placeholder="제목"
            required="required" style='width: 50%;'
            autofocus="autofocus">
        </div>
      </div>
      
		  <div class="form-group">
		     <div class="col-md-12">
		        <select name='visible' class="form-control" style='width: 20%;'>
		          <option value='Y' selected="selected">Y</option>
		          <option value='N'>N</option>
		        </select>
		     </div>
		  </div>  

      <div class="form-group">
        <div class="col-md-12">
          <input type='password' class="form-control" name='notice_pw'
            value='' placeholder="패스워드" style='width: 20%;'>
        </div>
      </div>

      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button"
          onclick="location.href='./list.do?categrpno=${param.noticeno}'"
          class="btn btn-info">취소[목록]</button>
      </DIV>

    </FORM>
  </DIV>


  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>