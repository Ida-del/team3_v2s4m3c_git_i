<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/adm/menu/left.jsp" />
<jsp:include page="/adm/menu/top.jsp" />

  <DIV class='title_line'>
    관리자 정보 목록
  </DIV>
  <DIV class="aside_left" style="margin-left: 5px; margin-top: -10px;">
   <A href="javascript:location.reload();">새로고침</A>
  </DIV> 
  <DIV class='menu_line'></DIV>
  
 
  <table class="table table-striped" style='width: 100%;'>
  <caption>관리자만 접근가능합니다.</caption>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 25%;'/>
    <col style='width: 25%;'/>
    <col style='width: 25%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>ID</TH>
    <TH class='th'>성명</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>기타</TH>
  </TR>
 
  <c:forEach var="adminVO" items="${list }">
    <c:set var="adm_no" value ="${adminVO.adm_no}" /> 
  <TR>
    <TD class='td'>${adm_no}</TD>
    <TD class='td'><A href="./read.do?adm_no=${adm_no}">${adminVO.adm_id}</A></TD>
    <TD class='td'><A href="./read.do?adm_no=${adm_no}">${adminVO.adm_name}</A></TD>
    <TD class='td'>${adminVO.adm_rdate.substring(0, 10)}</TD> <!-- 년월일 -->
    <TD class='td'>
      <A href="./passwd_update.do?adm_no=${adm_no}"><i class="fas fa-user-cog"title='패스워드 변경'></i></A>
      <A href="./delete.do?adm_no=${adm_no}"><i class="fas fa-user-slash" title='삭제'></i></A>
    </TD>
    
  </TR>
  </c:forEach>
  
</TABLE>
 
<DIV class='bottom_menu'>
  <%-- 
  <button type='button' onclick="location.href='./create.do'">관리자 등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
  --%>
</DIV>



 
<jsp:include page="/adm/menu/bottom.jsp" flush='false' />


