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
<script src="<c:url value="/resources/js/jquery-1.8.2.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/exam/setting.js"/>" type="text/javascript"></script>
<r:layout title="ExamManager">
<ul class="breadcrumb">
  <li><a href="<c:url value='/'/>">首页</a> <span class="divider">/</span></li>
  <li class="active">试卷管理</li>
</ul>

    <form action="<c:url value='/exam' />" class="well form-search" method="post">
        <input type="text" class="span3" name="content"  placeholder="请输入试卷名称"/>
        <p>
        <div class="control-group">
            <div class="controls">
              <div class="input-append">
                <input type="text" class="span12" name="limitTime"  placeholder="请输入考试时间"/><span class="add-on">分钟</span>
              </div>
            </div>
          </div>
        
        <button type="submit" class="btn btn-primary">确定</button>
    </form>

</r:layout>