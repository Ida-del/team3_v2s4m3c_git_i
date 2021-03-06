<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/adm/menu/left.jsp" flush='false' />
<jsp:include page="/adm/menu/top.jsp" flush='false' />


<DIV class='title_line'><a href="../survey/list.do">${survey_title} </a> -
  <a href="../surveyitem/list.do?survey_no=${param.survey_no}&item_no=${param.item_no}">${item_title} </a> > 항목 선지
</DIV>
  
<div> 
 <form name='frm' method='post' action='./update.do' class="form-horizontal">
  <input type="hidden" name="item_no" value="${param.item_no}">
  <input type="hidden" name="survey_no" value="${param.survey_no}">
  
  <input type="hidden" name="option_no" value="${itemoptionVO.option_no}">
  <div class="form-group col-md-2 float-left">
     <label class="control-label">설문 항목 번호</label>
       <input type='number' name='item_no' value='${param.item_no}' required="required" 
                 class="form-control">
  </div>
  <div class="form-group col-md-2 float-left">
     <label class="control-label">순서</label>
       <input type='number' name='seqno' value='${itemoptionVO.seqno}' required="required" 
                  autofocus="autofocus" class="form-control">
  </div>
  <div class="form-group col-md-6 float-left">
     <label class="control-label">선택지 내용</label>
       <input type='text' name='option_name' value='${itemoptionVO.option_name}' required="required" 
                  autofocus="autofocus" class="form-control">
  </div>

  <div class="col-md-2 float-left" style="line-height: 30px;">
    <label class="control-label"></label>
    <div>
      <button type="submit" class="btn btn-primary">수정</button>
      <button type="button" onclick="location.href='./list.do?item_no=${param.item_no}&survey_no=${param.survey_no}'" class="btn" style="border: 1px solid #ccc;">취소</button>
    </div>
  </div>
 </form>
</div>
  
<TABLE class='table table-striped'>
  <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 70%;'/>
      <col style="width: 20%;"/>
  </colgroup>
  <thead>
    <tr>
      <TH class="th_bs">번호</TH>     
      <TH class="th_bs">항목</TH>
      <TH class="th_bs">기타</TH>
    </tr>
  </thead>
  
  <tbody>
    <c:forEach var="itemoptionVO"  items="${list}" >  <!-- request 객체에 접근 -->
      <c:set var="item_no" value="${itemoptionVO.item_no}" />
      <c:set var="seqno" value="${itemoptionVO.seqno}" />
      <c:set var="option_no" value="${itemoptionVO.option_no}" />
      <c:set var="option_name" value="${itemoptionVO.option_name}" />
      <TR>
        <TD class="td_bs">${seqno}</TD>
        <TD class="td_bs_left" style="padding:6px 0 6px 0;">
        ${option_name}
        </TD>               
        <TD class="td_bs">
          <a href="./read_update.do?option_no=${option_no}&item_no=${param.item_no}&survey_no=${param.survey_no}">
            <i class="fas fa-pencil-alt" title="수정"></i>
          </a>
          <a href="./read_delete.do?option_no=${option_no}&item_no=${param.item_no}&survey_no=${param.survey_no}">
            <i class="fas fa-trash-alt" title="삭제"></i>
          </a> 
        </TD> 
      </TR>                              
    </c:forEach>                   
  </tbody>
</TABLE>
 
<jsp:include page="/adm/menu/bottom.jsp" flush='false' />