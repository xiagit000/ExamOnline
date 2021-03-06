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
<r:layout title="ExamManager | ShowExam">
<c:import url="/plugin/playMedia.jsp"></c:import>

<ul class="breadcrumb">
  <li><r:a href="<c:url value='/'/>">首页</r:a> <span class="divider">/</span></li>
  <li><r:a href="/exam">试卷管理</r:a> <span class="divider">/</span></li>
  <li class="active">预览</li>
</ul>
<c:if test="${!empty exam.combinedQuestions }">
<c:set value="0" var="index" scope="application" />

<c:if test="${choices!=0}">
    <h4>选择题（共${choices}题）</h4>
        <c:forEach items="${exam.combinedQuestions}" var="question" varStatus="status"> 
        <c:if test="${question.type=='SINGLE_CHOICE' || question.type=='MULTIPLE_CHOICE' }">
        <div class="well" style="border:3px dashed silver;">
                <c:set value="${index+1}" var="index" scope="application" />
   <h4> 第${index}题:${question.content}
     <c:if test="${question.type=='MULTIPLE_CHOICE'}"><span class="label label-info">多选</span></c:if>
   </h4>
   
    <!-- 多媒体内容 -->
     <ul class="thumbnails" id="showMedia">
   <c:if test="${!empty question.imagePath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${question.imagePath}') class='thumbnail'>
                   <img src="<c:url value="/${question.imagePath}"/>" />
                   <center><h5>点击查看大图</h5></center>
                </a>
                </li>
                </c:if>
                
                <c:if test="${!empty question.videoPath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${question.videoPath}') class='thumbnail'>
                   <img src="<c:url value="/resources/img/play.jpg"/>" />
                   <center><h5>点击播放视频</h5></center>
                </a>
                </li>
                </c:if>
                
                <c:if test="${!empty question.audioPath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${question.audioPath}') class='thumbnail'>
                   <img src="<c:url value="/resources/img/play.jpg"/>" />
                   <center><h5>点击播放音频</h5></center>
                </a>
                </li>
                </c:if>
                </ul>
                
 
   <input type="hidden" name="id"  value="${question.id}" />
   <input type="hidden" name="answers" id="selected_${index}"/>
   <c:forEach items="${question.questions[0].answers}" var="options" varStatus="s"> 
   <c:choose>  
                <c:when test="${question.type=='MULTIPLE_CHOICE'}">  
                    <input type="checkbox" name="chk_list" id="${index}" value="${options.id}" /> 
                </c:when>  
                <c:otherwise>  
                    <input type="radio" name="chk_list_${index}" id="${index}" value="${options.id}" />   
                </c:otherwise>  
   </c:choose>
  <script>document.write(String.fromCharCode(${s.index+65}));</script>
  .<span style="text-decoration: underline;">${options.content}</span>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </c:forEach>
    </div>
    </c:if>
    </c:forEach>
    </c:if>
    
    <c:if test="${rightOrWrongs!=0}">
    <h4>判断题（共${rightOrWrongs}题）</h4>
    <c:forEach items="${exam.combinedQuestions}" var="question" varStatus="status"> 
     <c:if test="${question.type=='RIGHT_OR_WRONG'}">
      <div class="well" style="border:3px dashed silver;">
    <c:set value="${index+1}" var="index" scope="application" />
   <h4> 第${index}题:${question.content}
   </h4>
   
    <!-- 多媒体内容 -->
     <ul class="thumbnails" id="showMedia">
   <c:if test="${!empty question.imagePath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${question.imagePath}') class='thumbnail'>
                   <img src="<c:url value="/${question.imagePath}"/>" />
                   <center><h5>点击查看大图</h5></center>
                </a>
                </li>
                </c:if>
                
                <c:if test="${!empty question.videoPath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${question.videoPath}') class='thumbnail'>
                   <img src="<c:url value="/resources/img/play.jpg"/>" />
                   <center><h5>点击播放视频</h5></center>
                </a>
                </li>
                </c:if>
                
                <c:if test="${!empty question.audioPath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${question.audioPath}') class='thumbnail'>
                   <img src="<c:url value="/resources/img/play.jpg"/>" />
                   <center><h5>点击播放音频</h5></center>
                </a>
                </li>
                </c:if>
                </ul>
                
   <input type="hidden" name="id"  value="${question.id}" />
   <input type="hidden" name="answers" id="selected_${index}"/>
   <input type="radio" name="chk_list_${index}" id="${index}" value="true" />
   &nbsp;&nbsp;<font size="4" >&radic;</font>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="radio" name="chk_list_${index}" id="${index}" value="false" />
   &nbsp;&nbsp;<font size="5">&times;</font>
     </div>
    </c:if>
    </c:forEach>
    </c:if>
    
      <c:if test="${rightOrWrongs!=0}">
        <h4>组合题（共${combinations}题）</h4>
        <c:forEach items="${exam.combinedQuestions}" var="question" varStatus="status"> 
        <c:if test="${question.type=='COMBINATION_QUESTION'}">
        <div class="well" style="border:3px dashed silver;">
                <c:set value="${index+1}" var="index" scope="application" />
   <h4> 第${index}题:${question.content}
   <c:if test="${question.type=='MULTIPLE_CHOICE'}"><span class="label label-info">多选</span></c:if>
   </h4>
    <!-- 多媒体内容 -->
     <ul class="thumbnails" id="showMedia">
   <c:if test="${!empty question.imagePath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${question.imagePath}') class='thumbnail'>
                   <img src="<c:url value="/${question.imagePath}"/>" />
                   <center><h5>点击查看大图</h5></center>
                </a>
                </li>
                </c:if>
                
                <c:if test="${!empty question.videoPath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${question.videoPath}') class='thumbnail'>
                   <img src="<c:url value="/resources/img/play.jpg"/>" />
                   <center><h5>点击播放视频</h5></center>
                </a>
                </li>
                </c:if>
                
                <c:if test="${!empty question.audioPath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${question.audioPath}') class='thumbnail'>
                   <img src="<c:url value="/resources/img/play.jpg"/>" />
                   <center><h5>点击播放音频</h5></center>
                </a>
                </li>
                </c:if>
                </ul>
   <input type="hidden" name="id"  value="${question.id}" />
   <input type="hidden" name="answers" id="selected_${index}"/>
   <c:forEach items="${question.questions}" var="subQuestion" varStatus="status2"> 
   <b>(${status2.index+1}):${subQuestion.content}
    <c:if test="${question.type=='MULTIPLE_CHOICE'}"><span class="label label-info">多选</span></c:if>
   </b>
   
   <!-- 多媒体内容 -->
     <ul class="thumbnails" id="showMedia">
   <c:if test="${!empty subQuestion.imagePath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${subQuestion.imagePath}') class='thumbnail'>
                   <img src="<c:url value="/${subQuestion.imagePath}"/>" />
                   <center><h5>点击查看大图</h5></center>
                </a>
                </li>
                </c:if>
                
                <c:if test="${!empty subQuestion.videoPath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${subQuestion.videoPath}') class='thumbnail'>
                   <img src="<c:url value="/resources/img/play.jpg"/>" />
                   <center><h5>点击播放视频</h5></center>
                </a>
                </li>
                </c:if>
                
                <c:if test="${!empty subQuestion.audioPath}" >
                <li class='span2'>
                <a data-toggle='modal' href='#playModal' onclick=play('${subQuestion.audioPath}') class='thumbnail'>
                   <img src="<c:url value="/resources/img/play.jpg"/>" />
                   <center><h5>点击播放音频</h5></center>
                </a>
                </li>
                </c:if>
                </ul>
   
   <br>
   
   <c:if test="${subQuestion.type=='SINGLE_CHOICE' || subQuestion.type=='MULTIPLE_CHOICE' }">
   <c:forEach items="${subQuestion.answers}" var="options" varStatus="status3">
   <c:choose>  
                <c:when test="${subQuestion.type=='MULTIPLE_CHOICE'}">  
                    <input type="checkbox" name="chk_list" id="${index}" value="${options.id}" /> 
                </c:when>  
                <c:otherwise>  
                    <input type="radio" name="chk_list_${index}" id="${index}" value="${options.id}" />   
                </c:otherwise>  
   </c:choose>
  <script>document.write(String.fromCharCode(${status3.index+65}));</script>
  .<span style="text-decoration: underline;">${options.content}</span>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </c:forEach>
   </c:if>
  
   
   <c:if test="${subQuestion.type=='RIGHT_OR_WRONG'}">
   <input type="hidden" name="id"  value="${question.id}" />
   <input type="hidden" name="answers" id="selected_${index}"/>
   <input type="radio" name="chk_list_${index}" id="${index}" value="true" />
   &nbsp;&nbsp;<font size="4" >&radic;</font>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="radio" name="chk_list_${index}" id="${index}" value="false" />
   &nbsp;&nbsp;<font size="5">&times;</font>
    </c:if>
    <br>
    <br>
   </c:forEach>
   </div>
    </c:if>
    </c:forEach>
    </c:if>
    
    
    </c:if>
    <c:if test="${empty exam.combinedQuestions }">
    <center>没有设置试题</center>
    </c:if>
    <a class="btn" href="javascript:history.go(-1);">返回</a>
</r:layout>