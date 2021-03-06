<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team3_ebook</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<c:set var="review_no" value="${reviewVO.review_no}" />
<jsp:include page="/menu/top.jsp" />

  <DIV class='title_line'>
    ${reviewVO.review_no }
  </DIV>
  
  <ASIDE class="aside_right">
    <a href="./create.do">리뷰 등록</a>
    
    <span class='menu_divide' > | </span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?review_no=${review_no}'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?review_no=${review_no}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?review_no=${review_no}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>
 
   <FORM name='frm' method="get" action='./update.do' class="form_bs">
      <input type="hidden" name="review_no" value="${review_no}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${review_no}</span>
            (<span>${reviewVO.review_grade}</span>)
            <span>${reviewVO.review_rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV>${reviewVO.review_content}</DIV>
          </li>
          
        </ul>
      </fieldset>
  </FORM>
  
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 