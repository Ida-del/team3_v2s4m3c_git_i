<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>ebook</title>
 
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
 
  <DIV class='title_line'> ${ncateVO.ncate_name } 카테고리 수정</DIV>
    <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'> 
      <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
        <input type='hidden' name='ncate_no' id='ncate_no' value="${ncateVO.ncate_no }">
        <input type='hidden' name='nseqno' id='nseqno' value="${ncateVO.nseqno }">
        
        <label>카테고리</label>
        <input type='text' name='ncate_name' value="${ncateVO.ncate_name}" required="required" style='width: 25%;'>
   
        <label>순서</label>
        <input type='number' name='nseqno' value="${ncateVO.nseqno}" required="required" 
                  min='1' max='1000' step='1' style='width: 5%;'>
    
        <label>형식</label>
        <select name='nvisible'>
          <option value='Y' ${ncateVO.nvisible == 'Y' ? "selected='selected'":"" }>Y</option>
          <option value='N' ${ncateVO.nvisible == 'N' ? "selected='selected'":""}>N</option>
        </select>
       
        <button type="submit" id='submit'>수정</button>
        <button type="button" onclick="location.href='./list_all.do'">취소</button>
      </FORM>
    </DIV>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style="width: 15%;"/>
      <col style='width: 30%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 5%;'/>        
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">카테고리</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">출력</TH>
      <TH class="th_bs">글수</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="ncateVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="ncate_no" value="${ncateVO.ncate_no}" />
      <TR>
        <TD class="td_bs">${ncateVO.nseqno }</TD>
        <TD class="td_bs_left"><A href="./read_update.do?ncate_no=${ncate_no }">${ncateVO.ncate_name }</A></TD>
        <TD class="td_bs">${ncateVO.ncate_rdate.substring(0, 10) }</TD>
        <TD class="td_bs">
          <c:choose>
            <c:when test="${ncateVO.nvisible == 'Y'}">
              <A href="./update_nvisible.do?ncate_no=${ncate_no }&nvisible=${ncateVO.nvisible }"><IMG src="./images/open.png"></A>
            </c:when>
            <c:otherwise>
              <A href="./update_nvisible.do?ncate_no=${ncate_no }&nvisible=${ncateVO.nvisible }"><IMG src="./images/close.png"></A>
            </c:otherwise>
          </c:choose>
        </TD>
        <TD class="td_bs">${ncateVO.ncate_cnt }</TD>
        <TD class="td_bs">
          <A href="./read_update.do?ncate_no=${ncate_no }"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?ncate_no=${ncate_no }"><span class="glyphicon glyphicon-trash"></span></A>
          <A href="./update_nseqno_up.do?ncate_no=${ncate_no }"><span class="glyphicon glyphicon-arrow-up"></span></A>
          <A href="./update_nseqno_down.do?ncate_no=${ncate_no }"><span class="glyphicon glyphicon-arrow-down"></span></A>         
        </TD>             
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 