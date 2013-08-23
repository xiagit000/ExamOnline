<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="r-tag"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<r:yieldTitle prefix="Demo | "></r:yieldTitle>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" type="text/css" media="screen" />
<link rel="stylesheet" href="<c:url value='/resources/css/application.css'/>" type="text/css" media="screen" />
<r:yieldStylesheets></r:yieldStylesheets>
<style type="text/css">
    body {
      padding-top: 60px;
      padding-bottom: 40px;
    }
    .sidebar-nav {
      padding: 9px 0;
    }
</style>

<script src="<c:url value='/resources/js/jquery-1.8.2.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/js/application.js'/>"></script>
<r:yieldJavascripts />

</head>
<body>
  <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container-fluid">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>
        <a class="brand" href="#">Demo 在线测试系统</a>
        <div class="nav-collapse collapse">
          <ul class="nav pull-right" id="userbar">
            <li>
              <a href="#" id="user_notifications_count"><span class="badge " id="showTime">0</span></a>
            </li>
            <li class="dropdown" id="user_menu">
              <a href="#user_menu" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user icon-white"></i> guest <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li class="first"><r:a href="/">个人资料设置</r:a></li>
                <li class="last"><a href="/">退出</a></li>
              </ul>
            </li>
          </ul>
         
          <ul class="nav">
          <!--  
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            -->
            
          </ul>
        </div>

      </div>
    </div>
  </div>

  <div class="container-fluid main-wrapper">
    <div class="row-fluid">
      <div class="span2">
        <div class="well sidebar-nav">
          <jsp:include page="navigation.jsp"></jsp:include>
        </div>
      </div>
      <div class="span10">
        <div class="box">
          <r:yieldBody></r:yieldBody>
        </div>
      </div>
    </div>
  </div>

</body>
</html>