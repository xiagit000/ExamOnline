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
<select id="type" name="type">
            <option value="">请选择题目类型</option>
            <option value="MULTIPLE_CHOICE" ${ testQuestion.type == "MULTIPLE_CHOICE" ? 'selected = selected' : ''}>多选题</option>
            <option value="SINGLE_CHOICE" ${ testQuestion.type == "SINGLE_CHOICE" ? 'selected = selected' : ''}>单选题</option>
            <option value="RIGHT_OR_WRONG" ${ testQuestion.type == "RIGHT_OR_WRONG" ? 'selected = selected' : ''}>判断题</option>
            <option value="COMBINATION_QUESTION" ${ testQuestion.type == "COMBINATION_QUESTION" ? 'selected = selected' : ''}>组合题</option>
        </select>
        <select id="difficultyOrder" name="difficultyOrder">
            <option value="asc" ${ difficultyOrder == "asc" ? 'selected = selected' : ''}>难易度顺序排列</option>
            <option value="desc" ${ difficultyOrder == "desc" ? 'selected = selected' : ''}>难易度倒序排列</option>
        </select>
        
        <div class="input-append">
        <input type="text" class="span2" name="knowledgePointContent" value="${knowledgePointContent}" id="showPoints" style="width: 200px;" value="" placeholder="请选择知识点" 
         readonly="readonly"/>
        <input type="hidden" name="knowledgePointId" value="${knowledgePointId}" id="pointIds"/>
        <a data-toggle="modal" href="#myModal">
        <span class="add-on">
        <i class="icon-list-alt"></i>
        </span>
        </a>
        </div>
        
        <input type="text" class="span3" name="content" value="${testQuestion.content}" placeholder="请输入题目名称"/>
        <button type="submit" class="btn btn-primary">搜索</button>