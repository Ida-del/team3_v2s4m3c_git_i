<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/adm/menu/left.jsp" flush='false' />
<jsp:include page="/adm/menu/top.jsp" flush='false' />

<DIV class='title_line'><a href="./list.do?survey_no=${param.survey_no}">설문항목</a> 알림</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${cnt == 1}">
          <LI class='li_none'>
            <span class="span_success">수정되었습니다.</span>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none_left'>
            <span class="span_fail">수정에 실패했습니다.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <c:if test="${cnt != 1 }">
          <button type='button' onclick="history.back()">다시 시도</button>
        </c:if>
        <button type='button' onclick="location.href='./list.do?item_no=${param.item_no}&survey_no=${param.survey_no}'">목록</button>
      </LI>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="/adm/menu/bottom.jsp" flush='false' /> 