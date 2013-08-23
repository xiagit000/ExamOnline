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
<script type="text/javascript">var id="${question.id}";</script>
<script src="<c:url value="/resources/js/jquery-1.8.2.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/combinedQuestion/review/index.js"/>" type="text/javascript"></script>
<r:layout title="Review">
<c:import url="/plugin/playMedia.jsp"></c:import>
<ul class="breadcrumb">
  <li><a href="<c:url value='/'/>">首页</a> <span class="divider">/</span></li>
  <li><a href="#">答题记录</a> <span class="divider">/</span></li>
  <li class="active">复习巩固</li>
</ul>	

<c:if test="${question.type=='SINGLE_CHOICE' || question.type=='MULTIPLE_CHOICE' }">
        <div class="well" style="border:3px dashed #c09853;">
    
   <h4>${question.content}
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
  <script>document.write(String.fromCharCode(${s.index+65}));</script>
  .<span style="text-decoration: underline;">${options.content}</span>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </div>
   </li>
   </c:forEach>
   </ul>
    </div>
    </c:if>
    
    <c:if test="${question.type=='RIGHT_OR_WRONG'}">
     <div class="well" style="border:3px dashed #c09853;">
     <h4>${question.content}</h4>
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
    
    <c:if test="${question.type=='COMBINATION_QUESTION'}"> 
        <div class="well" style="border:3px dashed #c09853;">
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
   <p>
   <c:forEach items="${question.questions}" var="subQuestion" varStatus="status2"> 
   <input type="hidden" name="questionIds"  value="${subQuestion.id}" />
   <input type="hidden" name="answerIds" id="selected_${subQuestion.id}"/>
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
  <script>document.write(String.fromCharCode(${status3.index+65}));</script>
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
    
    <ul class="nav nav-tabs">
  <li class="active"><a href="#rightAnswer" data-toggle="tab">题目详情</a></li>
  <li><a href="#record" data-toggle="tab">答题记录</a></li>
  
  <li><a href="#similar" data-toggle="tab">相似题型</a></li>
</ul>

  <div class="tab-content">
  <div class="tab-pane active" id="rightAnswer">
  <div class="alert alert-info">
  
  正确答案为：
  <c:forEach items="${question.questions[0].answers}" var="options" varStatus="s"> 
   <c:if test="${options.right}">
  <script>document.write(String.fromCharCode(${s.index+65}));</script>
  </c:if>
   </c:forEach>
   <br>
   难易度：${question.difficulty }<br>
   知识点： 
    <c:forEach items="${question.knowledgePoints}" var="knowledgePoint" varStatus="s"> 
   ${knowledgePoint.content }
   </c:forEach>
   </div>
  </div>
  <div class="tab-pane" id="record">
  
  <div class="alert alert-info">
  本道题共回答：${countAnswer }次<br>
  共答对：${countRight }次<br>
  共答错：${countWrong}次<br>
  </div>
  <center>
  <a class="btn" href="javascript:" onclick="toggleRecord()">
  <i class="icon-chevron-down"></i>展开/收起记录</a>
  </center>
   <div id="showRecord" style="display: none;">
   <c:forEach items="${question.questions[0].userAnswers}" var="userAnswer" varStatus="s1"> 
   <div id="${userAnswer.id }" class="alert">
   <a class="close">${userAnswer.answerDate }</a>
    你选择了：
   <c:forEach items="${question.questions[0].answers}" var="options1" varStatus="s2"> 
    <c:forEach items="${userAnswer.answers}" var="options2" varStatus="s3"> 
    <c:if test="${options1.id==options2.id}">
    <script>document.write(String.fromCharCode(${s2.index+65}));</script>
    </c:if>
    </c:forEach>
    </c:forEach>
    
    <c:choose>
    <c:when test="${userAnswer.accuracy==1 }">
    <center><b>回答正确</b></center>
    <script>$("#${userAnswer.id }").attr("class","alert alert-success")</script>
    </c:when>
    <c:when test="${userAnswer.accuracy==0.5 }">
    <center><b>半对</b></center>
    <script>$("#${userAnswer.id }").attr("class","alert alert-warn")</script>
    </c:when>
    <c:otherwise>
    <center><b>回答错误</b></center>
    <script>$("#${userAnswer.id }").attr("class","alert alert-error")</script>
    </c:otherwise>
    </c:choose>
      </div>
   </c:forEach>
    </div>
   </div>
   
  
  <div class="tab-pane" id="similar">
   <div style="float: right;"><r:a href="javascript:" onclick="loadSimilar('${question.id }')" class="label label-info"><i class="icon-refresh icon-white"></i>换一批</r:a></div>
  <div id="loadSimilar"></div>
  </div>
</div>

</r:layout>