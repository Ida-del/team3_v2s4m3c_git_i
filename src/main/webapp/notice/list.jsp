<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class="title_line">
    NOTICE
  </DIV>
  <div class="aside_left">
    전체 보기 
  </div>
  <div class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <!--  <span class='menu_divide' >│</span> -->
  </div> 
  <DIV class='menu_line'></DIV>
    
  <div style='width: 100%;'>
    <TABLE class='table_basic table-striped' style='width: 95%;'>
      <colgroup>
        <col style='width: 5%;'/>
        <col style='width: 15%;'/>
        <col style="width: 35%;"/>
        <col style='width: 10%;'/>
        <col style='width: 15%;'/>
        <col style='width: 10%;'/>
        <col style='width: 5%;'/>        
      </colgroup>
     
      <thead>  
      <TR>
        <TH class="th_bs">번호</TH>
        <TH class="th_bs">이미지</TH>
        <TH class="th_bs">제목</TH>
        <TH class="th_bs">작성자</TH>
        <TH class="th_bs">작성일</TH>
        <TH class="th_bs">출력모드</TH>
        <TH class="th_bs">기타</TH>
      </TR>
      </thead>
      
      <tbody>
      <c:forEach var="noticeVO" items="${list}">  <!-- request 객체에 접근 -->
        <c:set var="noticeno" value="${noticeVO.noticeno}" />
        <c:set var="nthumb1" value="${noticeVO.nthumb1}" />
             
        <TR>
          <TD class="td_bs"><A href="./read.do?noticeno=${noticeno}">${noticeVO.noticeno}</A></TD>       
          <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${nthumb1.endsWith('jpg') || nthumb1.endsWith('png') || nthumb1.endsWith('gif')}">
                  <IMG src="./storage/main_images/${nthumb1}" style="width: 200px; height: 150px;"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${noticeVO.nfile1}
                </c:otherwise>
              </c:choose>
            </td>
          
          <TD class="td_bs">${noticeVO.title}</TD>
          <TD class="td_bs">${noticeVO.writer}</TD>
          <TD class="td_bs">${noticeVO.rdate.substring(0, 10)}</TD>
          
          <TD class="td_bs">
		        <c:choose>
		          <c:when test="${noticeVO.visible == 'Y'}">
		            <A href="./update_visible.do?noticeno=${noticeno }&visible=${noticeVO.visible }"><IMG src="./images/open.png" style='width: 26px;'></A>
		          </c:when>
		          <c:otherwise>
		            <A href="./update_visible.do?noticeno=${noticeno }&visible=${noticeVO.visible }"><IMG src="./images/close.png" style='width: 26px;'></A>
		          </c:otherwise>
		        </c:choose>
        </TD> 
      
          <TD class="td_bs">
            <A href="./update.do?noticeno=${noticeno }"><span class="glyphicon glyphicon-pencil"></span></A>
            <A href="./delete.do?noticeno=${noticeno }"><span class="glyphicon glyphicon-trash"></span></A>
          </TD>             
        </TR>
      </c:forEach>
      </tbody>
     
    </TABLE>
  </div>
 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />

