<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <!-- 최외각 container  -->
 <DIV id="wrapper">
  <div class="container-fluid">
  <header>
    <div class="top_logo">
      <h1><a href="${pageContext.request.contextPath}/index.do">TEAM3 E-books</a></h1>
    </div>  
     
    <div class="btn_menu">
     <a href="#" class="btnopen">Menu</a>
     <a href="#" class="btnClose">Close</a>
    </div>
    
    <!-- MobileMenu -->
    <nav id="gnb" class="mb_gnb" style="display:none;">
      <div class="login">
       <c:choose>
         <c:when test="${sessionScope.id == null}">          
            <a href='${pageContext.request.contextPath}/member/login.do' >LOGIN</a> <span>I</span> 
            <a href='${pageContext.request.contextPath}/member/create.do'>JOIN</a>
         </c:when>
         <c:otherwise>
            <a href='${pageContext.request.contextPath}/cart/list.do' >
              <i class="fa fa-shopping-cart" style="font-size:23px; color: orange;" title="go to cart"></i> 
            </a> 
            <span>I</span> 
            <a href='${pageContext.request.contextPath}/orderreq/list.do' >
              Orders
            </a> 
            <span>I</span> 
            <a href='${pageContext.request.contextPath}/member/logout.do'>Logout</a>             
         </c:otherwise>
        </c:choose>       
      </div>
      <ul>   
        <li><a href="javascript:alert('Categories');">Categories</a></li>
        <li id="has-sub01"><a href="#">Books</a>
         <ul id="sub-bar01">
           <li><a href="javascript:alert('Bestsellers');">Bestsellers</a></li>
           <li><a href="javascript:alert('Editors' Picks');">Editors' Picks</a></li>
           <li><a href="${pageContext.request.contextPath}/ebook/list.do">All books</a></li>
         </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/survey/list.do">Online Survey</a></li>
        <li><a href="${pageContext.request.contextPath}/notice/list.do">Notice</a></li>
        <li id="has-sub02"><a href="#">Get help</a>
         <ul id="sub-bar02">
           <li><a href="${pageContext.request.contextPath}/customer/list_all.do">Inquiry Details</a></li>
         </ul>      
        </li>        
      </ul>
    </nav>   <!-- //MobileMenu -->
  
    <!-- PC Menu -->
    <nav id="gnb pc" class="pc_gnb">
     <ul class="depth1">
       <li class="gnb01"><a href="javascript:alert('Categories');" class="menu">Categories</a></li>
       <li class="gnb02 has-sub"><a href="#" class="menu">Books</a>
         <ul class="gnb02 depth2">
          <li><a href="javascript:alert('Bestsellers');">Bestsellers</a></li>
          <li><a href="javascript:alert('Editors' Picks');">Editors' Picks</a></li>  
          <li><a href="${pageContext.request.contextPath}/ebook/list.do">All books</a></li>  
         </ul>
       </li>
       <li class="gnb03"><a href="${pageContext.request.contextPath}/event/list.do" class="menu">Event</a></li>
       <li class="gnb04"><a href="${pageContext.request.contextPath}/notice/list.do" class="menu">Notice</a></li>
       <li class="gnb05 has-sub"><a href="#" class="menu">Get help</a>
         <ul class="gnb05 depth2">
           <li><a href="${pageContext.request.contextPath}/customer/list_all.do">Inquiry Details</a></li>
         </ul>  
       </li>
       <li class="gnb07 has-sub"><a href="#" class="menu">OpenSpace</a>
         <ul class="gnb07 depth2">
           <li><a href="${pageContext.request.contextPath}/survey/list.do">Online Survey</a></li>
         </ul>  
       </li>
       <li class="gnb06"></li>
       <c:choose>
         <c:when test="${sessionScope.id == null}">             
          <li class="gnb98 has-sub"><a href="${pageContext.request.contextPath}/member/login.do" class="menu">SIGN IN</a>
            <ul class="gnb98 depth2">
              <li><a href="${pageContext.request.contextPath}/member/login.do" >Login</a></li>
              <li><a href="${pageContext.request.contextPath}/member/create.do" >Registration</a></li>
            </ul>
          </li>
         </c:when>
         <c:otherwise> 
          <li class="gnb97 has-sub"><a href="#" class="menu">Hello, ${sessionScope.id}!</a>
           <ul class="gnb97 depth2">
             <li><a href="${pageContext.request.contextPath}/orderreq/list.do" class="menu">Orders</a></li>
             <li><a href="${pageContext.request.contextPath}/member/logout.do" class="menu">
                   <i class="fas fa-sign-out-alt" title="LOGOUT" style="font-size:23px; color: lime;"></i>
                  </a>
             </li>
           </ul>                      
          </li>
          <li class="gnb97-1">
            <a href="${pageContext.request.contextPath}/cart/list.do" class="menu">
            <i class="fa fa-shopping-cart" style="font-size:23px; color: orange;" title="장바구니"></i>
            </a>
          </li>
          
         </c:otherwise> 
       </c:choose> 
     </ul>

    </nav>
   <!-- // PC Menu -->  
  </header>
 
  <div id="bg"></div>
  
  <section>
   <div class="main_area col-sm-9 col-md-10 cont" > 
      <div class="container">