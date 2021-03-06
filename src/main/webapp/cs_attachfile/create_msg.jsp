<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class='title_line'>
    <a href="../list.do">고객센터</a> > 첨부 파일
  </DIV>

  <div class="aside_left">
    등록
  </div>
  <div class="aside_right">
    <A href='../list.do?cs_no=${param.cs_no }'>고객센터 전체 문의</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </div> 
 
  <div class='menu_line'></div>

    <DIV class='message'>
      <fieldset class='fieldset_basic'>
        <UL>
          <c:choose>
            <c:when test="${param.upload_count > 0 }">
              <LI class='li_none'>
                <span class='span_success'>파일을 등록했습니다.</span>
              </LI>
              <LI class='li_none'>
                <span class='span_success'>정상 등록된 파일 ${param.upload_count} 건</span>
              </LI>
            </c:when>
            <c:otherwise>
              <LI class='li_none'>
                <span class='span_fail'>파일 등록에 실패했습니다.</span>
              </LI>
            </c:otherwise>
          </c:choose>
          <LI class='li_none'>
          <div class="bottom_menu">
            <button type='button' 
                        onclick="location.href='../customer/read.do?cs_no=${param.cs_no }'"
                        class="bottom_button">업로드된 파일 확인</button>
            <button type='button' 
                        onclick="location.href='../customer/list.do'"
                        class="bottom_button">고객센터 목록</button>       
            </div>            
          </LI>
         </UL>
      </fieldset>
     
    </DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />