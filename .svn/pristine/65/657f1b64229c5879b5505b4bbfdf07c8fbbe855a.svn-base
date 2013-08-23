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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="r" uri="r-tag"%>
<script type="text/javascript">var contextPath="<c:url value='/'/>"</script>
<script src="<c:url value="/resources/js/jquery-1.8.2.js"/>" type="text/javascript"></script>
<r:layout title="RecordStatistics">
<ul class="breadcrumb">
  <li><r:a href="<c:url value='/'/>">首页</r:a> <span class="divider">/</span></li>
  <li><r:a href="#">答题记录</r:a> <span class="divider">/</span></li>
  <li class="active">结果分析</li>
</ul>
    <div class="hero-unit">
    <c:forEach items="${analysis.countPercents}" var="map">
      <c:forEach items="${analysis.rightPercents}" var="map2">
      <c:if test="${map.key==map2.key}">
    <p>知识点<code>${map.key }</code>所占比重:<fmt:formatNumber  value="${map.value }" type="percent" />,
     答题正确率为:<fmt:formatNumber  value="${map2.value }" type="percent" /></p>
    </c:if>
    </c:forEach>
    </c:forEach>

    </div>
</r:layout>