<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>TEAM3 PROJECT</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
<DIV class='title_line'>주문 내역 생성</DIV>
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal" enctype="multipart/form-data">
    <h4>등록된 파일 변경</h4>
    <!-- 이미지가 존재하는 경우 새로운 이미지 등록 폼 출력 -->            
      <!-- FK memberno 지정 -->
      <input type='hidden' name='memberno' id='memberno' value='1'>

      <div class="form-group">   
        <div class="col-md-12">
          <%-- 실제 컬럼명: fiel1, Spring File 객체 대응: fiel1MF --%>
          <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택">
        </div>
      </div>


    <div class="form-group">
       <label class="control-label col-md-3">상품 번호</label>
       <div class="col-md-9">
         <input type='number' name='p_number' value='1' required="required" 
                   placeholder="" min="1" max="1000" step="1" 
                   style='width: 30%;' class="form-control" >
       </div>
    </div>
    
    <div class="form-group">
       <label class="control-label col-md-3">상품 정보</label>
       <div class="col-md-9">
         <input type='text' name='p_infor' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 30%;'>
       </div>
    </div>  
  
    <div class="form-group">
       <label class="control-label col-md-3">상품 수량</label>
       <div class="col-md-9">
         <input type='number' name='p_amount' value='1' required="required" 
                   placeholder="" min="1" max="1000" step="1" 
                   style='width: 30%;' class="form-control" >
       </div>
    </div>   
    
    <div class="form-group">
       <label class="control-label col-md-3">상품 상태</label>
       <div class="col-md-9">
         <input type='text' name='p_state' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 30%;'>
       </div>
    </div> 
  
    <div class="content_bottom_menu" style="padding-right: 20%;">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn btn-primary">목록</button>
    </div>
  
</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

