<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
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
 
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">리뷰를 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='review_no' id='review_no' value="${reviewVO.review_no }">
      
      <label>이북 번호</label>: ${reviewVO.eb_no } &nbsp;        
      <label>리뷰 번호</label>: ${reviewVO.review_no} &nbsp;  
      <label>리뷰내용</label> : ${reviewVO.review_content} &nbsp;  
      <label>리뷰이미지</label>: ${reviewVO.review_img} &nbsp;  
         
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
    </FORM>
  </DIV>
  
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
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 