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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="r" uri="r-tag"%>
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/daterangepicker.css"/>"/>
<script type="text/javascript">var contextPath="<c:url value='/'/>"</script> 
<script src="<c:url value="/resources/js/jquery-1.8.2.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/answerRecord/index.js"/>" type="text/javascript"></script>
<r:layout title="AnswerRecord | Index">
<script src="<c:url value="/resources/js/date.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/daterangepicker.js"/>" type="text/javascript"></script>

<ul class="breadcrumb">
  <li><r:a href="<c:url value='/'/>">首页</r:a> <span class="divider">/</span></li>
  <li><r:a href="#">在线测试</r:a> <span class="divider">/</span></li>
  <li class="active">答题记录</li>
</ul>
<form action="<c:url value='answerRecord' />" class="well form-search">

<input type="hidden" name="date" id="createDate" value="${date }"/>
<div class="input-prepend">
<span class="add-on"><i class="icon-calendar"></i></span><input value="${date }" type="text" class="span2" style="width: 200px;" id="reservation"
placeholder="请选择日期时间" />
</div>

<input type="text" class="span3" name="content" value="${content }"  placeholder="请输入试卷名称"/>
<button type="submit" class="btn btn-primary">搜索</button>
</form>
    
<c:if test="${!empty answerRecords }">
    <table class="table table-striped">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>试卷名称</th>
                    <th>答题人</th>
                    <th>正确率</th>
                    <th>答题时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            
            <tbody>
                <c:forEach var="record" items="${answerRecords}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${record.exam.content }  </td>
                        <td>administrator</td>
                        <td><fmt:formatNumber  value="${record.accuracy}" type="percent" /></td>
                        <td>${record.createDate}</td>
                        <td>
                        <div class="btn-group">
                            <r:a  class="btn btn-info" href="/answerRecord/${record.id}"><font color="white">查看</font></r:a>
                            <button class="btn btn-info dropdown-toggle" data-toggle="dropdown" onclick="showStatistics('${record.id}')">&nbsp;<span class="caret"></span></button>
                            <ul class="dropdown-menu">
                            <li> <r:a href="/answerRecord/${record.id}/statistics">结果统计</r:a></li>
                            <li> <r:a href="/answerRecord/${record.id}/analysis">结果分析</r:a></li>
                            </ul>
                        </div><!-- /btn-group -->
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
            <tr><td colspan="6">
            <div class="toolbar">
            <div class="pagination pagination-centered">
            <r:paginate data="${answerRecords}" />
            </div>
            </div>
            </td></tr>
            </tfoot>
        </table>
    </c:if>
    <div id="modalContent"></div>
</r:layout>