<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class="title_line">
    고객센터
  </DIV>
  
  <div class="aside_left">
    <A href="../index.do">Home</A> >
    <A href="./list_all.do"> 모든 1:1 문의</A>
  </div>
  <div class="aside_right">
    <A href="./create.do">문의 등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <%--     <span class='menu_divide' >│</span>
    <A href="./list_by_mno_grid1.do?m_no=${param.m_no}">GRID GALLERY</A>   --%>  
  </div>
  
  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 30%;"></col>
        <col style="width: 25%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>문의유형</th>          
          <th style='text-align: center;'>파일</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>회원번호</th>
          <th style='text-align: center;'>조회수</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="customerVO" items="${list}">
          <c:set var="cs_no" value="${customerVO.cs_no}" />
          <c:set var="cs_thumb1" value="${customerVO.cs_thumb1}" />
          <tr> 
            <td style='vertical-align: middle; text-align: center;'>${customerVO.cs_rdate.substring(0, 10)}</td>
            <td style='vertical-align: middle; text-align: center;'>${customerVO.cs_type}</td>
            <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${cs_thumb1.endsWith('jpg') || cs_thumb1.endsWith('png') || cs_thumb1.endsWith('gif')}">
                  <IMG src="../adm/customer/storage/main_images/${cs_thumb1}" style="width: 120px height:80px;"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${customerVO.cs_file1}
                </c:otherwise>
              </c:choose>
            </td>  
            <td style='vertical-align: middle; text-align: center;'>
              <a href="./read.do?cs_no=${cs_no}">${customerVO.cs_title}</a> 
            </td> 
            <td style='vertical-align: middle; text-align: center;'>${customerVO.m_no}</td>
            <td style='vertical-align: middle; text-align: center;'>${customerVO.cs_cnt}</td>  
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
