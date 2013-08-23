<%-- 
    Copyright 2010. 
    This document may not be reproduced, distributed or used 
    in any manner whatsoever without the expressed written 
    permission of Boventech Corp.
    
    $Rev: Rev $
    $Author: Author $
    $LastChangedDate: LastChangedDate $
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="r-tag"%>
<script type="text/javascript">var contextPath="<c:url value='/'/>"</script>
<script src="<c:url value="/resources/js/jquery-1.8.2.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/knowledgePoint/application.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/knowledgePoint/index.js"/>" type="text/javascript"></script>
 
<fieldset>
        
  <div class="modal hide fade" id="myModal">
  <div class="modal-header">
    <a class="close" data-dismiss="modal">×</a>
    <h3>
    <legend><span class="label">已选择的知识点:</span><span id="choices"></span></legend>
        </h3>
  </div>
   <div class="modal-body">
   
         <!-- 加载知识点 -->
        <div class="accordion" id="child_0"></div>
        
        </div>
        <div class="modal-footer">
 <a class="btn" href="<c:url value="/knowledgePoint/edit"/>">编辑</a>
 <a class="btn btn-primary" data-dismiss="modal" onclick="submitPoints()">确定</a>
 </div>
 </div>
  </fieldset>
