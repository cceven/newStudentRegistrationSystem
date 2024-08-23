<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">宿舍信息详情</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-text">
                    <div class="detail-title">宿舍号：</div>
                    <div class="detail-content">${map.sushehao}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">宿舍类型：</div>
                    <div class="detail-content">${map.susheleixing}</div>
                </div>
                <div class="detail detail-number">
                    <div class="detail-title">宿舍床位：</div>
                    <div class="detail-content">${map.sushechuangwei}</div>
                </div>
                <div class="detail detail-number">
                    <div class="detail-title">已住人数：</div>
                    <div class="detail-content">${map.yizhurenshu}</div>
                </div>
                <div class="detail detail-longtext">
                    <div class="detail-title">宿舍物品：</div>
                    <div class="detail-content">${map.sushewupin}</div>
                </div>
            </div>

            <div class="button-list mt10">
                <div class="">
                    <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                    <button type="button" class="btn btn-default" onclick="window.print()">打印本页</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

