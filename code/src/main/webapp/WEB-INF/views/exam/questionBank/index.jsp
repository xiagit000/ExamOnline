<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="r" tagdir="/WEB-INF/tags"%>
<script src="<c:url value="/resources/js/jquery-1.8.2.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/exam/edit.js"/>" type="text/javascript"></script>

<r:layout  title="QuestionManager">
<ul class="breadcrumb">
  <li><r:a href="/">首页</r:a> <span class="divider">/</span></li>
  <li><r:a href="/">试题管理</r:a><span class="divider">/</span></li>
  <li class="active">题库</li>
</ul>
    <form action="<c:url value='/exam/${exam.id}/questionBank' />" class="well form-search">
    <h3>${exam.content }</h3>
        <c:import url="/plugin/search.jsp"></c:import>
        <c:import url="/plugin/modal.jsp"></c:import>
    </form>
    
    <r:a class="btn" href="/exam/${exam.id}/edit">返回</r:a>
    
    <c:if test="${!empty questionList }">
    
    <form name="actionForm" action="<c:url value='/exam/${exam.id}'/>" method="post">
        <input type="hidden" name="_method" value="PUT"/>
        <input type="hidden" name="questionId" id="questionId"/>
     </form>
     
    <table class="table table-striped">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>题目</th>
                    <th>类型</th>
                    <th>难易度</th>
                    <th>知识点</th>
                    <th>操作</th>
                </tr>
            </thead>
            
            <tbody>
                <c:set var="index" value="${pageIndex.startRow}" />
                <c:forEach var="question" items="${questionList}" varStatus="status">
                    <tr>
                        <td><span class="badge">${status.index + 1}</span></td>
                        <td>
                        <c:if test="${fn:length(question.content)>40}">
                        <b>${fn:substring(question.content,0,40)}...</b>
                        </c:if>
                       <c:if test="${fn:length(question.content)<=40}">
                        <b>${question.content }</b>
                       </c:if>
                       </td>
                        <td>
                            <c:if test="${question.type == 'MULTIPLE_CHOICE'}">多选题</c:if>
                            <c:if test="${question.type == 'SINGLE_CHOICE'}">单选题</c:if>   
                            <c:if test="${question.type == 'RIGHT_OR_WRONG'}">判断题</c:if>
                            <c:if test="${question.type == 'COMBINATION_QUESTION'}">组合题</c:if>
                        </td>
                        <td>${question.difficulty}</td>
                        <td>
                       <c:forEach var="knowledge" items="${question.knowledgePoints}" varStatus="st">
                       <span class='label badge-info'>${knowledge.content}</span>
                       </c:forEach>
                        </td>
                        <td>
                         <r:a class="btn btn-mini btn-info" href="/combinedQuestion/${question.id}">查看</r:a>
                         <r:a class="btn btn-mini btn-primary" href="javascript:" onclick="removeQuestion('${question.id }')">加入</r:a>
                        </td>
                    </tr>                                                      
                </c:forEach>
            </tbody>
            <tfoot>
            <tr><td colspan="6">
            <div class="toolbar">
            <div class="pagination pagination-centered">
            <r:paginate data="${questionList}" />
            </div>
            </div>
            </td></tr>
            </tfoot>
        </table>
    </c:if>
    <c:if test="${empty questionList }">
    <div class="hero-unit">
    <h3>题库中已没有试题可以添加，请到<r:a href="/combinedQuestion">试题管理</r:a>页面添加新的试题</h3>
    </div>
    </c:if>


    
</r:layout>