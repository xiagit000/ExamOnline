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
    <c:import url="/plugin/upload.jsp"></c:import>
    <c:import url="/plugin/playMedia.jsp"></c:import>

                <input type="hidden" name="imagePath" id="imagePath" />
                <input type="hidden" name="videoPath" id="videoPath" />
                <input type="hidden" name="audioPath" id="audioPath" />
                <p>
                <a class="btn" data-toggle="modal" href="#uploadModal"><i class="icon icon-picture"></i>添加附件</a>
                <div  class="alert alert-info">
                *支持的媒体格式：<b>MP4&nbsp;MP3&nbsp;JPG&nbsp;PNG&nbsp;BMP</b><p>
                <ul class="thumbnails" id="showMedia">
                </ul>
                </div>