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
<%@ taglib prefix="r" uri="r-tag"%>
<script type="text/javascript">
	var contextPath = "<c:url value='/'/>";
</script>
<script src="<c:url value="/resources/js/jquery-1.8.2.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/knowledgePoint/application.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/knowledgePoint/edit.js"  />" type="text/javascript"></script>
<r:layout title="KnowledgePoint">
	<ul class="breadcrumb">
		<li><r:a href="/">首页</r:a> <span class="divider">/</span></li>
		<li><r:a href="/knowledgePoint">知识点</r:a> <span class="divider">/</span></li>
		<li class="active">编辑</li>
	</ul>
	<fieldset>
		<legend>编辑知识点</legend>


         <!-- 加载知识点 -->
        <div class="accordion" id="child_0"></div>

        
		<button class="btn btn-primary">返回</button>
	</fieldset>
</r:layout>