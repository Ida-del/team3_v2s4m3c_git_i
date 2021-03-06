<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/adm/menu/left.jsp" flush='false' />
<jsp:include page="/adm/menu/top.jsp" flush='false' />


<DIV class='title_line'><a href="../survey/list.do">${survey_title} </a>-설문항목 > 삭제</DIV>
  
<div> 
 <form name='frm' method='post' action='./delete.do' class="form-horizontal">
  <div class="msg_warning">삭제하시면 복구 할 수 없습니다.</div>
  <input type='hidden' name='survey_no' id='survey_no' value="${param.survey_no }">
  <input type='hidden' name='item_no' id='item_no' value="${surveyitemVO.item_no }">
  <div style="width: 80%;margin: 10px auto;">
    <div class="form-group col-md-2 float-left">
       <label class="control-label">설문조사 번호</label>
       <div>${surveyitemVO.survey_no }</div>
    </div>
    <div class="form-group col-md-1 float-left">
       <label class="control-label">순서</label>
       <div>${surveyitemVO.seqno }</div>
    </div>  
    <div class="form-group col-md-7 float-left">
       <label class="control-label">설문 항목 이름</label>
       <div>${surveyitemVO.item_title }</div>
    </div>
  
    <div class="col-md-2 float-left" style="line-height: 30px;">
      <label class="control-label"></label>
      <div>
        <button type="submit" class="btn btn-primary">삭제</button>
        <button type="button" onclick="location.href='./list.do?survey_no=${param.survey_no}'" class="btn" style="border: 1px solid #ccc;">취소</button>
      </div>
    </div>
  </div>  
 </form>
</div>
  
  
<TABLE class='table table-striped'>
  <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 60%;'/>
      <col style="width: 10%;"/>
      <col style="width: 20%;"/>
  </colgroup>
  <thead>
    <tr>
      <TH class="th_bs">번호</TH>     
      <TH class="th_bs">항목</TH>
      <TH class="th_bs">집계</TH>
      <TH class="th_bs">기타</TH>
    </tr>
  </thead>
  
  <tbody>
    <c:forEach var="surveyitemVO"  items="${list}" >  <!-- request 객체에 접근 -->
      <c:set var="item_no" value="${surveyitemVO.item_no}" />
      <c:set var="seqno" value="${surveyitemVO.seqno}" />
      <c:set var="rcnt" value="${surveyitemVO.rcnt}" />
      <c:set var="survey_no" value="${surveyitemVO.survey_no}" />
      <c:set var="item_title" value="${surveyitemVO.item_title}" />
      <TR>
        <TD class="td_bs">${seqno}</TD>
        <TD class="td_bs_left" style="padding:6px 0 6px 0;">
          <A href="../itemoption/list.do?item_no=${item_no}&survey_no=${survey_no}">${item_title}</A>
        </TD>               
        <TD class="td_bs" style="padding:6px 0 6px 0;">
         ${rcnt}
        </TD>               
        <TD class="td_bs">
          <a href="./read_update.do?item_no=${item_no}&survey_no=${survey_no}">
            <i class="fas fa-pencil-alt" title="수정"></i>
          </a>
          <a href="./read_delete.do?item_no=${item_no}&survey_no=${survey_no}">
            <i class="fas fa-trash-alt" title="삭제"></i>
          </a> 
        </TD> 
      </TR>                              
    </c:forEach>                  
  </tbody>
</TABLE>
<jsp:include page="/adm/menu/bottom.jsp" flush='false' />