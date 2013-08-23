<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="r" uri="r-tag"%>

<ul class="nav nav-list">
  <li class="nav-header"><i class="icon-edit"></i>在线测试</li>
  <li><r:a href="/test">参加测试</r:a></li>
  <li><r:a href="/answerRecord">答题记录</r:a></li>
  <li class="nav-header"><i class="icon-globe"></i>后台管理</li>
  <li><r:a href="/knowledgePoint/edit">知识点管理</r:a></li>
  <li><r:a href="/go/combinedQuestion">试题管理</r:a></li>
  <li><r:a href="/go/exam">试卷管理</r:a></li>
</ul>