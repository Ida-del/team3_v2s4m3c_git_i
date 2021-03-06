<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

<script>

</script>

<input type="hidden" name="user_id" id="user_id" value="${sessionScope.id}">

<DIV class="title_line">
  <a href="../survey/list.do">설문조사</a> - 결과보기
</DIV>
<DIV class="aside_left" style="padding-left: 6px;">
  <A href="javascript:location.reload();">새로고침</A>
</DIV> 
<DIV class='menu_line'></DIV>

<form name='frm_surveychart' id='frm_surveychart' method="get" action="">
<input type="hidden" name="survey_no" id="survey_no" value="${param.survey_no}">
<TABLE class='table'  style='width: 96%; margin: 10px auto;'>
  <colgroup>
      <col style='width: 98%;'/>
  </colgroup>
  <thead style="margin: 30px auto;">
    <tr>  
      <TH class="th_bs" style="margin: 10px auto; background-color: #f0f0f5; padding: 10px 12px;">${survey_title}</TH>
    </tr>
  </thead>

  <tbody>
    <c:forEach var="surveychartVO"  items="${list}" >  <!-- request 객체에 접근 -->
      <c:set var="item_no" value="${surveychartVO.item_no}" />
      <c:set var="item" value="${surveychartVO.item}" />
      <c:set var="cnt" value="${surveychartVO.cnt}" />
      <c:set var="seqno" value="${surveychartVO.seqno}" />
      <TR>             
        <TD class="td_bs" style="padding:6px 0 6px 0;">
          ${item}(${cnt} 명)
        </TD>                                    
      </TR>                                                        
    </c:forEach>                        
  </tbody>
</TABLE>
</form>


<jsp:include page="/menu/bottom.jsp" flush='false' />

