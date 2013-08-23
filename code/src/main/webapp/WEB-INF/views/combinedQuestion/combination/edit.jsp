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
   <script type="text/javascript">var contextPath="<c:url value='/'/>"</script>
   <script src="<c:url value="/resources/js/jquery-1.8.2.js"/>" type="text/javascript"></script>
   <script src="<c:url value="/resources/js/combinedQuestion/edit.js"/>" type="text/javascript"></script>
   <r:layout title="ChoiceQuestion">
	<ul class="breadcrumb">
		<li><a href="<c:url value='/'/>">首页</a> <span class="divider">/</span></li>
		<li><a href="#">试题管理</a> <span class="divider">/</span></li>
		<li class="active">录入试题</li>
	</ul>
	<input type="hidden" id="pid" value="${combinationQuestion.id }" />
		<form name="choiceForm" action="<c:url value='/combinedQuestion/${combinationQuestion.id }'/>" method="post">
            <input type="hidden" name="_method" value="PUT"/>
			<fieldset>
				<legend>编辑选择题</legend>
                <label class="label label-info">题型</label> 
                <strong>
                    ${ combinationQuestion.type == "MULTIPLE_CHOICE" ? '选择题' : ''}
                    ${ combinationQuestion.type == "SINGLE_CHOICE" ? '选择题' : ''}
                    ${ combinationQuestion.type == "RIGHT_OR_WRONG" ? '判断题' : ''}
                    ${ combinationQuestion.type == "COMBINATION_QUESTION" ? '组合题' : ''}
                    </strong>
                <br />
				<label class="label label-info">题干</label><br />
				<textarea rows="8" name="content"
					style="width: 100%; overflow-x: visible;">${combinationQuestion.content }</textarea>
					
					 <c:import url="/plugin/upload.jsp"></c:import>
                    <c:import url="/plugin/playMedia.jsp"></c:import>

                <input type="hidden" name="imagePath" id="imagePath" value="${combinationQuestion.imagePath }"/>
                <input type="hidden" name="videoPath" id="videoPath" value="${combinationQuestion.videoPath }"/>
                <input type="hidden" name="audioPath" id="audioPath" value="${combinationQuestion.audioPath }"/>
                <p>
                <a class="btn" data-toggle="modal" href="#uploadModal"><i class="icon icon-picture"></i>添加附件</a>
                <div  class="alert alert-info">
                *支持的媒体格式：<b>MP4&nbsp;MP3&nbsp;JPG&nbsp;PNG&nbsp;BMP</b><p>
                <ul class="thumbnails" id="showMedia">
                
                 <c:if test="${!empty combinationQuestion.imagePath}" >
                <li class='span2' id="${combinationQuestion.imagePath}">
                <a class="close" data-dismiss="alert"><i class="icon-remove-sign" style="width:20px;"></i></a>
                <a data-toggle='modal' href='#playModal' onclick=play('${combinationQuestion.imagePath}') class='thumbnail'>
                   <img src="<c:url value="/${combinationQuestion.imagePath}"/>" />
                   <center><h5>点击查看大图</h5></center>
                </a>
                
                </li>
                </c:if>
                
                <c:if test="${!empty combinationQuestion.videoPath}" >
                <li class='span2' id="${combinationQuestion.videoPath}">
                  <a class="close" data-dismiss="alert"><i class="icon-remove-sign" style="width:20px;"></i></a>
                <a data-toggle='modal' href='#playModal' onclick=play('${combinationQuestion.videoPath}') class='thumbnail'>
                   <img src="<c:url value="/resources/img/play.jpg"/>" />
                   <center><h5>点击播放视频</h5></center>
                </a>
                </li>
                </c:if>
                
                <c:if test="${!empty combinationQuestion.audioPath}" >
                <li class='span2' id="${combinationQuestion.audioPath}">
                  <a class="close" data-dismiss="alert"><i class="icon-remove-sign" style="width:20px;"></i></a>
                <a data-toggle='modal' href='#playModal' onclick=play('${combinationQuestion.audioPath}') class='thumbnail'>
                   <img src="<c:url value="/resources/img/play.jpg"/>" />
                   <center><h5>点击播放音频</h5></center>
                </a>
                </li>
                </c:if>
                </ul>
                </div>
			</fieldset>


			<hr>

			<label  class="label label-info">子题</label>&nbsp;&nbsp;
    <r:a href="/singleQuestion/${combinationQuestion.id }/add">添加子题+</r:a><br>
    <c:forEach items="${combinationQuestion.questions}" var="question" varStatus="st">
    <div id="${question.id }" class="alert alert-info">
    <a class="close" data-dismiss="alert" href="#">&times;删除</a>
            <strong> 题目${st.index+1}.${question.content}？</strong>
            (
            ${ question.type == "MULTIPLE_CHOICE" ? '多选题' : ''}
            ${ question.type == "SINGLE_CHOICE" ? '单选题' : ''}
            ${ question.type == "RIGHT_OR_WRONG" ? '判断题' : ''}
            ${ question.type == "COMBINATION_QUESTION" ? '组合题' : ''}
             )
            <br>
              <c:forEach var="answer" items="${question.answers}" varStatus="sta">
               <input value="${st.index+1 }" type="checkbox" ${answer.right==true?"checked=checked":"" } disabled="disabled" />
              <strong><script>document.write(String.fromCharCode(${sta.index+65}));</script></strong>.
              <span style="text-decoration: underline;">${answer.content}</span>&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;
              </c:forEach>
              <c:forEach var="answer" items="${question.knowledgePoints}" varStatus="sta">
              </c:forEach>
              </div>
    </c:forEach>
			<input type="hidden" name="type" id="type" value="${combinationQuestion.type }"/> 
			<r:a class="btn" href="/combinedQuestion">返回</r:a>
			<input type="button" onclick="onSubmit()" class="btn btn-primary"
				value="更新" />

		</form>
</r:layout>