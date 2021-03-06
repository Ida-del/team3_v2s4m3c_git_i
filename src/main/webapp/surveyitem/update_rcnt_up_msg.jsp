<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

<script>

</script>

<input type="hidden" name="user_id" id="user_id" value="${sessionScope.id}">
<input type="hidden" name="survey_no" id="survey_no" value="${param.suvey_no}">
<input type="hidden" name="item_no" id="item_no" value="${param.item_no}">

<DIV class="title_line">
  <i class="fas fa-home"></i><a href="../index.do"> 홈 </a> - <a href="../survey/list.do">설문조사</a> 
</DIV>
<DIV class="aside_left" style="padding-left: 6px;">
  <A href="javascript:location.reload();">새로고침</A>
</DIV> 
<DIV class='menu_line'></DIV>


<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.cnt == 1}">
          <LI class='li_none'>
            <span class="span_success">설문조사에 참여해 주셔서 감사합니다.</span>
            <TABLE class='table table-hover'  style='width: 96%; margin: 10px auto;'>
              <colgroup>
                  <col style='width: 50%; '/>
              </colgroup>
              <tbody>                
                <TR>
                  <td class="td_basic">
                    <button type="submit" class="btn_send" onclick="location.href='../surveychart/doc_result.do?survey_no=${param.survey_no}'" style="padding:8px 12px; color: #fff; background-color: #4CAF50; border-bottom: 1px solid #ccc; ">설문 결과 조회</button>
                    <button type="submit" class="btn_send" onclick="location.href='../surveychart/chart_result.do?survey_no=${param.survey_no}'" style="padding:8px 12px; color: #fff; background-color: #4CAF50;">차트 결과 조회</button>
                  </td>                        
                </TR>      
              </tbody>
            </TABLE>            
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none_left'>
            <span class="span_fail">결과 전송에 실패했습니다.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">다시 시도해주시기 바랍니다.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <c:if test="${param.cnt != 1 }">
          <button type="button" onclick="history.back()">다시 시도</button>
        </c:if>
        <button type="button" class="btn" style="border: 1px solid #4CAF50;" onclick="location.href='../survey/list.do'">목록</button>
      </LI>
    </UL>
  </fieldset>


</DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' /> 