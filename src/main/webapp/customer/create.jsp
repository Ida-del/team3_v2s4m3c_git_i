<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/menu/prefix.jsp" flush='false' />
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV style='width: 100%; margin: 0px auto;'>
  <FORM name='frm' method='POST' action='./create.do' class="container_modal form-horizontal" enctype="multipart/form-data">
     <div class="modal_contentBox">   
       <h1 style="margin-left: 15px;">1:1 문의하기</h1>  
       <hr style="border-color: #ccc;">

        <%-- FK 전달 --%>
        <input type='hidden' name='m_no' id='m_no' value="${sessionScope.m_no}">
        
        <div class="inner_container">
         <label class="col-md-2 control-label" for="cs_type" style="text-align: center;">문의유형</label>
         <div class="col-md-10">
          <select id="cs_type" name='cs_type' class="form-control" style='width: 20%;' required="required">
           <c:forEach var="code" items="${type_list}" varStatus="info"> <!-- code:  -->
            <option value="${code.value}">${code.pay}</option>
           </c:forEach>
          </select>
         </div>
         <hr>
         <div style="padding: 30px 0 30px 0;">
           <label class="col-md-2 control-label" style="text-align: center;">제목</label>
           <div class="col-md-10">
             <input type='text' name='cs_title' value='' required="required" 
                       placeholder="" class="form-control" >
           </div>
                
           <label class="col-md-2 control-label" style="text-align: center;">내용</label>
           <div class="col-md-10">
             <textarea name='cs_contents' required="required" 
                       placeholder="" rows='10' class="form-control" ></textarea>
           </div>
           <br><br>
           <label class="col-md-2 control-label" style="text-align: center;">첨부파일</label>
           <div class="col-md-10">
                <input type='file' class="form-control" name='file1MF' id='file1MF' 
                          value='' placeholder="파일 선택">
           </div>
         </div>
         <div class=content_bottom_button> 
           <button type="submit" class="btn_send">등록</button>
         </div>
       </div>  <!--  // inner_container  --> 
     </div>  <!--  // modal_contentBox -->
  </FORM>
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
