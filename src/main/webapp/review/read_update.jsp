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
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>리뷰 > ${reviewVO.review_no} 조회(수정)</DIV>

  <TABLE class='table_basic table-striped' style='width: 90%;'>
      <colgroup>
        <col style='width: 5%;'/>
        <col style="width: 5%;"/>
        <col style='width: 45%;'/>
        <col style='width: 5%;'/>
        <col style='width: 15%;'/>
        <col style='width: 10%;'/>        
        <col style='width: 15%;'/>
      </colgroup>
     
      <thead>  
      <TR>
        <TH class="th_bs">그룹</TH>
        <TH class="th_bs">순서</TH>
        <TH class="th_bs">리뷰내용</TH>
        <TH class="th_bs">평점</TH>
        <TH class="th_bs">작성일</TH>
        <TH class="th_bs">추천수</TH>
        <TH class="th_bs">기타</TH>
      </TR>
      </thead>
      
      <tbody>
      <c:forEach var="reviewVO" items="${list}">  <!-- request 객체에 접근 -->
        <c:set var="review_no" value="${reviewVO.review_no}" />
        <TR>
          <TD class="td_bs">${reviewVO.eb_no}-${reviewVO.memberno} </TD>
          <TD class="td_bs_left"><A href="./read_update.do?review_no=${review_no}">${reviewVO.review_no}</A></TD>
          <TD class="td_bs">${reviewVO.review_content}</TD>
          <TD class="td_bs">${reviewVO.review_grade}</TD>
          <TD class="td_bs">${reviewVO.review_rdate.substring(0, 10) }</TD>
          <TD class="td_bs">${reviewVO.review_good}</TD>
          <TD class="td_bs">
            <A href="./read_update.do?review_no=${review_no }"><span class="glyphicon glyphicon-pencil"></span></A>
            <A href="./read_delete.do?review_no=${review_no }"><span class="glyphicon glyphicon-trash"></span></A>
          </TD>             
        </TR>
      </c:forEach>
      </tbody>
     
    </TABLE>
    <hr>
    
    <DIV id='panel_update' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 90%; margin-left: 35px; text-align: center;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='review_no' id='review_no' value="${reviewVO.review_no }">
      
      <label>이북 번호</label>
      <input type='number' name='eb_no' value="${reviewVO.eb_no }" required="required" 
                min="1" max="99999" step="1" style='width: 10%;'>
                
      <label>리뷰 번호</label>
      <input type='number' name='eb_no' value="${reviewVO.review_no }" required="required" 
                min="1" max="99999" step="1" style='width: 10%;'><br>
        
      <label>리뷰내용</label>
      <textarea id="text" name="review_content" rows="5" cols="70">${reviewVO.review_content}</textarea><br>
      <br>
      
      <label>리뷰이미지</label>
      <input type='text' name='review_img' value="${reviewVO.review_img}" required="required" style='width: 15%;'>
 
      <label>평점</label>
      <input type='number' name='review_grade' value="${reviewVO.review_grade}" required="required" 
                min='1' max='10' step='1' style='width: 5%;'>
                
      <label>추천수</label>
      <input type='number' name='review_good' value="${reviewVO.review_good}" required="required" 
                min='1' max='99999' step='1' style='width: 5%;'>          
  
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="location.href='./list.do'">수정 취소</button>
    </FORM>
  </DIV>
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 