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
        <script type="text/javascript">var contextPath="<c:url value='/'/>";</script>
        <script src="<c:url value="/resources/js/jquery-1.8.2.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/knowledgePoint/index.js"/>" type="text/javascript"></script>
        <div class="accordion" id="${parentSortCode}">
        <c:forEach items="${parents}" var="knowledge">
       
        <div class="accordion-group">
              <div class="accordion-heading">
              <input type="checkbox" id="${knowledge.id}" 
              onchange="selectPoint($(this))" value="${knowledge.content}" 
              name="pointList" style="float: left;margin:12px;"/>
        <a class="accordion-toggle" data-toggle="collapse" onclick="loadData('${knowledge.sortCode}')" 
        data-parent="#${parentSortCode}" href="#demo_${knowledge.sortCode}">
        <i class="icon-plus"></i>${knowledge.content}</a>
        </div>
        <div id="demo_${knowledge.sortCode}" class="accordion-body collapse">
        <div class="accordion-inner" id="child_${knowledge.sortCode}">234</div>
        </div>
        </div>
        </c:forEach>
        </div>
