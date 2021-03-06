<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/adm/menu/left.jsp" flush='false' />
<jsp:include page="/adm/menu/top.jsp" flush='false' />

<DIV class='title_line'><a href="../survey/list.do">${survey_title} </a> -
  <a href="../survey_item/list.do?survey_no=${param.survey_no}">${item_title} </a> - ${title} 생성
</DIV>
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
  <input type="hidden" name="item_no" value="${param.item_no}">
  <input type="hidden" name="survey_no" value="${param.survey_no}">
  <div class="form-group col-md-2 float-left">
     <label class="control-label">설문 항목 번호</label>
       <input type='number' name='item_no' value='${param.item_no}' required="required" 
                 class="form-control">
  </div>
  <div class="form-group col-md-2 float-left">
     <label class="control-label">순서</label>
       <input type='number' name='seqno' value='' required="required" 
                  autofocus="autofocus" class="form-control">
  </div>
  <div class="form-group col-md-6 float-left">
     <label class="control-label">선택지(보기) 내용</label>
       <input type='text' name='option_name' value='' required="required" 
                  autofocus="autofocus" class="form-control">
  </div>

  <div class="col-md-2 float-left" style="line-height: 30px;">
    <label class="control-label"></label>
    <div>
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn" style="border: 1px solid #ccc;">취소</button>
    </div>
  </div>
</FORM>
 
<jsp:include page="/adm/menu/bottom.jsp" flush='false' />