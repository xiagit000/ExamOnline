<%-- 
    Copyright 2010. 
    This document may not be reproduced, distributed or used 
    in any manner whatsoever without the expressed written 
    permission of Boventech Corp.
    
    $Rev: Rev $
    $Author: Author $
    $LastChangedDate: LastChangedDate $
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">var contextPath="<c:url value='/'/>"</script>
<script src="<c:url value="/resources/js/plugin/playMedia.js"/>" type="text/javascript"></script> 

  
  <div class="modal hide fade" id="playModal">
  <div class="modal-header">
    <a class="close" data-dismiss="modal">×</a>
   <div id="message"><i class="icon-play"></i>Play</div>
  </div>
  <p>
  <div  class="modal-body">
  <center id="play"></center>
  </div>
  <div class="modal-footer">
  <a class="btn" data-dismiss="modal">退出</a>
  </div>
  </div>
