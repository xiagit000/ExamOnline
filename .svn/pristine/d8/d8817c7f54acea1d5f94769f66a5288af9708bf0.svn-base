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
        <script src="<c:url value="/resources/js/knowledgePoint/edit.js"/>" type="text/javascript"></script>
        <div class="accordion" id="${parentSortCode}">
        <c:forEach items="${parents}" var="knowledge">
        <div class="accordion-group">
              <div class="accordion-heading">
              <input type="hidden" />
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#${parentSortCode}"
         onclick="loadData('${knowledge.sortCode}',false)"  href="#demo_${knowledge.sortCode}">
         <i class="icon-plus"></i>${knowledge.content}</a>
        </div>
        <div id="demo_${knowledge.sortCode}" class="accordion-body collapse">
        <div class="accordion-inner" id="child_${knowledge.sortCode}">

        </div>
        </div>
        </div>
        </c:forEach>
        </div>
        
        <div class="accordion-group">
        <div class="accordion-heading">
        <a class="accordion-toggle" data-toggle="collapse"  onclick="addPoint('${parentSortCode}')"><center>添加</center></a>
        </div>
        </div>