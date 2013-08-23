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
<script src="<c:url value="/resources/js/exam/index.js"/>" type="text/javascript"></script>
<r:layout title="ExamManager">
<ul class="breadcrumb">
  <li><a href="<c:url value='/'/>">首页</a> <span class="divider">/</span></li>
  <li class="active">试卷管理</li>
</ul>

    <!-- 搜索 -->
    <form action="<c:url value='/exam' />" class="well form-search">
        <input type="text" class="span3" name="content" value="${testQuestion.content}" placeholder="请输入试卷名称"/>
        <button type="submit" class="btn btn-primary">搜索</button>
    </form>

    <r:a class="btn btn-primary"  href="/exam/new"><i class="icon-pencil icon-white"></i> 添加试卷</r:a>
    
    <c:if test="${!empty examList }">
    <table class="table table-striped">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>试卷名称</th>
                    <th>考试时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            
            <tbody>
                <c:forEach var="exam" items="${examList}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${exam.content}</td>
                        <td>${exam.limitTime}分钟</td>
                        <td>
                        
                        <div class="btn-group">
                            <r:a class="btn btn-info" href="/exam/${exam.id}"><i class=" icon-eye-open icon-white"></i><font color="white">预览</font></r:a>
                            <button class="btn btn-info dropdown-toggle" data-toggle="dropdown">&nbsp;<span class="caret"></span></button>
                            <ul class="dropdown-menu">
                            <li> <r:a href="/exam/${exam.id}/edit">管理</r:a></li>
                            <li><a href="javascript:" onclick="deleteExam('${exam.id}')" >删除</a></li>
                            </ul>
                        </div><!-- /btn-group -->
                        
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
            <tr><td colspan="4">
            <div class="toolbar">
            <div class="pagination pagination-centered">
            <r:paginate data="${examList}" />
            </div>
            </div>
            </td></tr>
            </tfoot>
        </table>
    </c:if>
       
</r:layout>