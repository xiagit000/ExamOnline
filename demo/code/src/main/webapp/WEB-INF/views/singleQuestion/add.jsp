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
<script src="<c:url value="/resources/js/singleQuestion/add.js"/>" type="text/javascript"></script>
<r:layout title="ChoiceQuestion">
<ul class="breadcrumb">
  <li><a href="<c:url value='/'/>">首页</a> <span class="divider">/</span></li>
  <li><a href="#">试题管理</a> <span class="divider">/</span></li>
  <li><a href="#">录入试题</a> <span class="divider">/</span></li>
  <li class="active">录入子题</li>
</ul>	

<form name="choiceForm" action="<c:url value='/singleQuestion'/>" method="post">
	<fieldset>
    	<legend>子题</legend>
    	<label class="label label-info">题型</label><br />
    	<select id="questionType" onchange="switchQuestion($(this))">
  			<option value="choice">选择题</option>
  			<option value="rightOrWrong">判断题</option>
  		</select><br />
    	<label class="label label-info" >题干</label><br />
    	<textarea rows="3" name="content" style="width:500;overflow-x:visible;"></textarea><br />
    	<label class="label label-info">难易度</label><br />
    	<input name="difficulty" type="text"/><small style="color: red;">*数值越大难度越高</small><br />
  </fieldset>


<label class="label label-info">知识点</label>&nbsp;&nbsp;<a
                data-toggle="modal" href="#myModal">选择知识点</a>

            <!-- 显示选择的知识点-->
            <div id="showPoints"></div>

            <hr>

            <!-- 动态加载对话框内容-->
            <div id="modalContent"></div>
  	
  <!-- 动态加载题目选项 -->	
  <div id="options"></div>
  
  <input type="hidden" name="type" id="type"/>
  <input type="hidden" name="pid" value="${id }"/>
  
  <br />
  <input type="button" onclick="onSubmit()" class="btn btn-primary"  value="提交"/>

</form>
</r:layout>