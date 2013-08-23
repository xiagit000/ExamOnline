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
    <script src="<c:url value="/resources/js/jquery-1.8.2.js"/>" type="text/javascript"></script>
    
   
        <c:forEach items="${similarQuestions}" var="question" varStatus="status"> 
        <c:if test="${question.type=='SINGLE_CHOICE' || question.type=='MULTIPLE_CHOICE' }">
        
        <div class="well" style="border:3px dashed silver;">
                <c:set value="${index+1}" var="index" scope="application" />
   <h4>${question.content}
   ${question.type=='MULTIPLE_CHOICE'?"<span class='label label-info'>多选</span>":"<span class='label label-info'>单选</span>"}
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
   <input type="hidden" name="questionIds"  value="${question.questions[0].id}" />
   <input type="hidden" name="answerIds" id="selected_${question.id}"/>
   <ul class="thumbnails">
   <c:forEach items="${question.questions[0].answers}" var="options" varStatus="s"> 
    <li class="span3">
     <div class="thumbnail">
   <c:choose>  
                <c:when test="${question.type=='MULTIPLE_CHOICE'}">  
                    <input type="checkbox" name="chk_list" id="${question.id}" value="${options.id}" /> 
                </c:when>  
                <c:otherwise>  
                    <input type="radio" name="chk_list_${question.id}" id="${question.id}" value="${options.id}" />   
                </c:otherwise>  
   </c:choose>
   <span id="${options.id}"></span>
  <script>document.getElementById("${options.id}").innerHTML=String.fromCharCode(${s.index+65});</script>
  .<span style="text-decoration: underline;">${options.content}</span>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </div>
   </li>
   </c:forEach>
   </ul>
    </div>
    </c:if>
    </c:forEach>
    
    
    <c:forEach items="${similarQuestions}" var="question" varStatus="status"> 
     <c:if test="${question.type=='RIGHT_OR_WRONG'}">
     <div class="well" style="border:3px dashed silver;">
    <c:set value="${index+1}" var="index" scope="application" />
   <h4> ${question.content}
   <span class='label label-info'>判断题</span>
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
   <input type="hidden" name="questionIds"  value="${question.questions[0].id}" />
   <input type="hidden" name="answerIds" id="selected_${question.id}"/>
   <c:forEach items="${question.questions[0].answers}" var="options" varStatus="s"> 
  
   <input type="radio" name="chk_list_${question.id}" id="${question.id}" value="${options.id}" />   
  
  <span style="text-decoration: underline;">${options.content==true?"正确":"错误"}</span>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </c:forEach>
    </div>
    </c:if>
    </c:forEach>
    
        
        <c:forEach items="${similarQuestions}" var="question" varStatus="status"> 
        <c:if test="${question.type=='COMBINATION_QUESTION'}">
        <div class="well" style="border:3px dashed silver;">
                <c:set value="${index+1}" var="index" scope="application" />
   <h4> ${question.content}
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
   <p>
   <c:forEach items="${question.questions}" var="subQuestion" varStatus="status2"> 
   <input type="hidden" name="questionIds"  value="${subQuestion.id}" />
   <input type="hidden" name="answerIds" id="selected_${subQuestion.id}"/>
   <b>(${status2.index+1}):${subQuestion.content}
    ${question.type=='MULTIPLE_CHOICE'?"<span class='label label-info'>多选</span>":"<span class='label label-info'>单选</span>"}
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
   <c:if test="${subQuestion.type=='SINGLE_CHOICE' || subQuestion.type=='MULTIPLE_CHOICE' }">
   <ul class="thumbnails">
   <c:forEach items="${subQuestion.answers}" var="options" varStatus="status3">
   <li class="span3">
     <div class="thumbnail">
   <c:choose>  
                <c:when test="${subQuestion.type=='MULTIPLE_CHOICE'}">  
                    <input type="checkbox" name="chk_list" id="${subQuestion.id}" value="${options.id}" /> 
                </c:when>  
                <c:otherwise>  
                    <input type="radio" name="chk_list_${subQuestion.id}" id="${subQuestion.id}" value="${options.id}" />   
                </c:otherwise>  
   </c:choose>
  <span id="${options.id}"></span>
  <script>document.getElementById("${options.id}").innerHTML=String.fromCharCode(${status3.index+65});</script>
  .<span style="text-decoration: underline;">${options.content}</span>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </div>
   </li>
    </c:forEach> 
    </ul>
   </c:if>
  
   
   <c:if test="${subQuestion.type=='RIGHT_OR_WRONG'}">
   <c:forEach items="${subQuestion.answers}" var="options" varStatus="s"> 
  
   <input type="radio" name="chk_list_${subQuestion.id}" id="${subQuestion.id}" value="${options.id}" />   
  
  <span style="text-decoration: underline;">${options.content==true?"正确":"错误"}</span>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     </c:forEach> 
    </c:if>
   </c:forEach>
    </div>
    </c:if>
    </c:forEach>
