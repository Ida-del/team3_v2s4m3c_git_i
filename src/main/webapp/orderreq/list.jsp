<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.payway.PaywayCode" %>
<%@ page import="dev.mvc.payway.CodeTable" %>

<%
ArrayList<PaywayCode> payway_list = CodeTable.getPaywayCode();
request.setAttribute("payway_list", payway_list);
%>

<jsp:include page="/menu/prefix.jsp" flush='false' />
<script>
    $(function(){ 
      $('.btn_delete_this').on('click', delete_one_record_proc);         //  레코드 하나 삭제
    }); 

     /*  레코드 하나 삭제   */
    function delete_one_record_proc(){
       var double_check = confirm("선택하신 상품을 주문 취소하시겠습니까?");
       if(double_check) {
            var orderno_list = [];
            orderno_list.push($(this).attr("data-orderno"));  
            var param = { 
                 "orderno_list" : orderno_list
            }; 
             
            $.ajax({
                url: "./delete_ajax.do",
                dataType: "json",
                type: "post",
                data: param,
                success: function(rdata){
                     if(rdata.result != 0) {
                       location.href="./list.do";
                     } else {
                       alert("삭제 X");
                     }
                   }, 
                   error: function(request, status, error) {
                     var msg = 'ERROR request.status: '+request.status + '/ ' + error;
                     console.log(msg); // Chrome console 출력
                   }  // Ajax 통신 error, 응답 코드가 200이 아닌경우, dataType이 다른경우 
  
             });  //   ajax 호출
       } 
    }  // end
    

</script>
<jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class="title_line"><i class="fas fa-home"></i><a href="../index.do"> 홈</a> - 주문요청 목록</DIV>
  <DIV class="aside_left">  
    <A href="javascript:location.reload();">새로고침</A>
  </DIV> 
  <DIV class='menu_line'>
  <div class="topnav">
   <form name="frm_search" id='frm_search' method='get' action='./list.do'>
   <input type="hidden" name="user_id" id="user_id" value="${sessionScope.id}">
      <c:choose>
        <c:when test="${param.eb_title != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='eb_title' id='eb_title' value='${param.eb_title }' 
                     style='width: 50%;'>
        </c:when>
        <c:otherwise> <%-- 기본상태--%>
          <input type='text' name='eb_title' id='eb_title' value='' style='width: 50%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit' style="background-color: #999966;">검색</button>
      <c:if test="${param.eb_title.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list.do'" style="background-color: orange;">검색 취소</button>  
      </c:if>      
   </form>
  </div>  
  
  </DIV>
     
  <div class="container">
    <div class="row text-center"> 
      <fmt:setLocale value = "ko_KR"/>
        <c:forEach var="orderreqVO" items="${list }" varStatus="status">
          <c:set var="order_no" value="${orderreqVO.order_no}" />
          <c:set var="payid" value="${orderreqVO.payid}" />
          <c:set var="eb_no" value="${orderreqVO.eb_no}" />
          <c:set var="eb_title" value="${orderreqVO.eb_title}" />        
          <c:set var="payway" value="${orderreqVO.payway}" />        
          <c:set var="price" value="${orderreqVO.price}" />
          <c:set var="rdate" value="${orderreqVO.rdate}" />
          <c:set var="eb_thumb" value="${orderreqVO.eb_thumb}" />
          
          <%-- 하나의 행에 이미지를 4개씩 출력 후 행 변경 --%>
          <c:if test="${status.index % 4 == 0 && status.index != 0 }"></c:if>
          <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
            <div class="card h-100">
              <c:set var="thumb" value="${eb_thumb}"/>
              <c:choose>
                  <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                    <img class="card-img-top" src="../ebook/storage/main_images/${thumb }" alt="">
                  </c:when>
                  <c:otherwise>
                    <img class="card-img-top" src="http://placehold.it/300x400" alt="">              
                  </c:otherwise>
              </c:choose>
              <div class="card-body">
                <h5 class="card-title" style="text-align: left;">
                  <a href="./read.do?order_no=${order_no}">
                  <span style="color: #3333cc; font-size: 1em;">결제번호</span><br>
                  <span style="font-weight: bolder;">${payid}</span></a>
                </h5>
                  <ul class="ebinfo card-text" style="text-align: left;list-style: none;">
                    <li class="author"><span style="font-size: 1em;">
                    <c:choose>
                      <c:when test="${eb_title.length() > 9}">
                        ${eb_title.substring(0, 9) } ...
                      </c:when>
                      <c:otherwise>
                        ${eb_title}
                      </c:otherwise>
                    </c:choose>
                    </span>
                    </li>
                    <li class="publisher">
                      <span style="color: #3333cc; font-size: 1em;">
                        ${payway }
                      </span>
                    </li>
                    <li>${rdate.substring(0, 10)}</li>
                    <li style="font-size: 1em;;">
                      <fmt:formatNumber value="${price}" pattern="#,### 원"/>
                    </li>
                  </ul>
                  <div class="product-count">
                    <button type="button" class="round-red-btn btn_delete_this"  data-orderno="${order_no}">주문취소</button>
                  </div>
              </div>
            </div>
          </div>
        </c:forEach>
    </div>
    <!-- /.row -->
    <div class='ebook_paging my-4'>${paging }</div>
  </div>
  <!-- /.container -->

<jsp:include page="/menu/bottom.jsp" flush='false' />