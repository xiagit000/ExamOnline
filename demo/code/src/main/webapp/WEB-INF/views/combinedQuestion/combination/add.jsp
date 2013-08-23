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
<script src="<c:url value="/resources/js/combinedQuestion/add.js"/>" type="text/javascript"></script>
<r:layout title="ChoiceQuestion">
<ul class="breadcrumb">
  <li><a href="<c:url value='/'/>">首页</a> <span class="divider">/</span></li>
  <li><a href="#">试题管理</a> <span class="divider">/</span></li>
  <li class="active">录入试题</li>
</ul>   
<div class="container">
<form name="choiceForm" action="<c:url value='/combinedQuestion'/>" method="post">

    <fieldset>
        <legend>添加组合题</legend>
        <label class="label label-info">题型</label>组合题<br />
       
        <label class="label label-info" >题干</label><br />
        <textarea rows="3" name="content" id="content" style="width:500;overflow-x:visible;">${content}</textarea><span id="contentLog"></span>
        <c:import url="/plugin/combinedQuestion/addMedia.jsp"></c:import>
        <p>
  </fieldset>
    <label  class="label label-info">子题</label>&nbsp;&nbsp;
    <a href="javascript:validateContent()">添加子题+</a><br>
    <c:forEach items="${sesseionScope.questions}" var="question" varStatus="status">
    <label  class="label">题目${status.index+1}：${question.content}
    <c:if test="${question.type=='SINGLE_CHOICE'}">
    （单选题）
    </c:if>
    <c:if test="${question.type=='MULTIPLE_CHOICE'}">
    （多选题）
    </c:if>
    <c:if test="${question.type=='RIGHT_OR_WRONG'}">
    （判断题）
    </c:if>
    </label><br>
    </c:forEach>
  
  <input type="hidden" name="type" id="type"/>
  
  
  <br />
  <r:a class="btn" href="javascript:history.go(-1);">返回</r:a>
  <input type="button" onclick="onSubmit()" class="btn btn-primary"  value="提交"/>

</form>
</div>
</r:layout>