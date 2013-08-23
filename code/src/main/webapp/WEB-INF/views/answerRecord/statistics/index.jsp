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
<r:layout title="RecordStatistics">
<ul class="breadcrumb">
  <li><r:a href="<c:url value='/'/>">首页</r:a> <span class="divider">/</span></li>
  <li><r:a href="#">答题记录</r:a> <span class="divider">/</span></li>
  <li class="active">结果统计</li>
</ul>
    <div class="hero-unit">
    <p>本套试题共有题目：${statistics.total }题</p>
    <p>选择题：${statistics.choices }题</p>
    <p>判断题：${statistics.rightOrWrongs }题</p>
    <p>组合题：${statistics.combinations }题（包含${statistics.total-statistics.choices-statistics.rightOrWrongs}道单题）</p>
    <hr>
    <p>回答正确：${statistics.rights }题</p>
    <p>回答半对：${statistics.halfs }题</p>
    <p>回答错误：${statistics.wrongs }题</p>
    <p>未作答：${statistics.nulls }题</p>
    </div>
</r:layout>