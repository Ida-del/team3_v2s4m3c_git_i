<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class='title_line'>
    <a href="../list.do">고객센터</a> > <a href="./list.do" >전체 파일 목록</a>
  </DIV>

  <div class="aside_left">
    등록
  </div>
  <div class="aside_right">
    <A href='../customer/list.do?cs_no=${param.cs_no }'>고객센터 전체 문의</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </div> 
 
  <div class='menu_line'></div>

  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' 
                enctype="multipart/form-data" class="form-horizontal">
               
      <!-- FK cateno 지정 -->
      <input type='hidden' name='m_no' id=',_no' value="${sessionScope.m_no }">
      <input type='hidden' name='cs_no' id='cs_no' value="${param.cs_no }">
      
      <div class="form-group"> 
        <label class="control-label col-md-2">파일 등록</label>  
        <div class="col-md-10 display-rightside">
          <input type='file' class="form-control" name='fnamesMF'  
                     value='' placeholder="파일 선택" multiple="multiple">
        </div>
      </div>

      <DIV class='bottom_menu'>
        <button type="submit" class="bottom_button">파일 전송</button>
        <button type="button" 
                    onclick="location.href='../customer/read.do?cs_no=${param.cs_no}'" 
                    class="bottom_button">취소</button>
      </DIV>
       
    </FORM>
  </DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />